# Feature Engineering

# Load data
train <- read_csv("~/Machine Learning/Titanic/train.csv")
test <- read_csv("~/Machine Learning/Titanic/test.csv")

# Load packages
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Join test and train set together for feature engineering
test$Survived <- NA
combi <- rbind(train, test)

# Find indices for the title part of a specific name
strsplit(combi$Name[1], split='[,.]')
strsplit(combi$Name[1], split='[,.]')[[1]]
strsplit(combi$Name[1], split='[,.]')[[1]][2]

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

# Split back into test and train sets
train <- combi[1:891,]
test <- combi[892:1309,]

# Build a new tree with our new features
fit <- rpart(Survived ~ Pclass + Sex + Age + Fare + Embarked + Title,
             data=train, method="class")
fancyRpartPlot(fit)

# Submission
Prediction <- predict(fit, test, type='class')
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = 'featureeng_decisiontree.csv', row.names = FALSE)