# Random forest ensemble
# Based on http://trevorstephens.com/kaggle-titanic-tutorial/r-part-5-random-forests/

# Load data
train <- read_csv("~/Machine Learning/Titanic/train.csv")
test <- read_csv("~/Machine Learning/Titanic/test.csv")

# Install and load packages
library(rpart)
#install.packages('randomForest')
library(randomForest)
install.packages('party')
library(party)

# Join together the test and train sets for easier feature engineering
test$Survived <- NA
combi <- rbind(train, test)

# Engineered variable: Title
combi$Title <- sapply(combi$Name, FUN=function(x) {strsplit(x,split='[,.]')[[1]][2]})
combi$Title <- sub( ' ', '', combi$Title)
table(combi$Title)
# Combine small title groups
combi$Title[combi$Title %in% c('Mme', 'Mlle')] <- 'Mlle'
combi$Title[combi$Title %in% c('Capt', 'Sir', 'Don', 'Major', 'Jonkheer')] <- 'Sir'
combi$Title[combi$Title %in% c('Lady', 'the Countess', 'Dona')] <- 'Lady'
combi$Title[combi$Title %in% c('Lady', 'Mlle', 'Ms')] <- 'Ms'

# Engineered variable: Family size
combi$FamilySize <- combi$SibSp + combi$Parch + 1
table(combi$FamilySize)

# Fill in Age NAs using decision tree
summary(combi$Age)
Agefit <- rpart(Age ~ Pclass + Sex + Fare + Embarked + Title + FamilySize,
                data=combi[!is.na(combi$Age),], method='anova')
combi$Age[is.na(combi$Age)] <- predict(Agefit, combi[is.na(combi$Age),])

# Fill in Embarked blanks
table(combi$Embarked)
which(is.na(combi$Embarked))
combi$Embarked[c(62,830)] = "S"

# Fill in Fare NAs
summary(combi$Fare)
combi$Fare[which(is.na(combi$Fare))] <- median(combi$Fare, na.rm=TRUE)

# Split back into test and train sets
train <- combi[1:891,]
test <- combi[892:1309,]
train$Sex <- factor(train$Sex)
train$Embarked <- factor(train$Embarked)
train$Title <- factor(train$Title)
test$Sex <- factor(test$Sex)
test$Embarked <- factor(test$Embarked)
test$Title <- factor(test$Title)
summary(train)
summary(test)

# Build Random forest ensemble
# Set random seed to make results reproducible
set.seed(415)
fit <- randomForest(as.factor(Survived) ~ Pclass + Sex + Age + Fare + SibSp + Parch + Embarked + Title + FamilySize,
                   data=train, 
                   importance=TRUE, 
                   ntree=2000)
varImpPlot(fit)

# to fix error: Type of predictors in new data do not match that of the training data
levels(test$Pclass) <- levels(train$Pclass)
levels(test$Sex) <- levels(train$Sex)
levels(test$Age) <- levels(train$Age)
levels(test$Fare) <- levels(train$Fare)
levels(test$Embarked) <- levels(train$Embarked)
levels(test$Title) <- levels(train$Title)

# Submit prediction
Prediction <- predict(fit, test)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "randomforest.csv", row.names = FALSE)

# Build condition inference tree Random Forest
set.seed(415)
fit <- cforest(as.factor(Survived) ~ Pclass + Sex + Age + Fare + Embarked + Title + FamilySize,
               data = train, controls=cforest_unbiased(ntree=2000, mtry=3)) 
# Now let's make a prediction and write a submission file
Prediction <- predict(fit, test, OOB=TRUE, type = "response")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "ciforest.csv", row.names = FALSE)



################# Future Work ##################
# look into converted categorical to numerical, one hot encoder?
# errors were thrown in randomforest before converting chars to factors. why?

#################################################