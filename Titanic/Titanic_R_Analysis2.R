# Load data
train <- read_csv("~/Machine Learning/Titanic/train.csv")
test <- read_csv("~/Machine Learning/Titanic/test.csv")

# Look at age patterns
summary(train$Age)
train$Child <- 0
train$Child[train$Age < 18] <- 1
aggregate(Survived ~ Child + Sex, data=train, FUN=sum) 
aggregate(Survived ~ Child + Sex, data=train, FUN=length) 
table(train$Child)
aggregate(Survived ~ Child + Sex, data=train, FUN=function(x) {sum(x)/length(x)}) 

# Look at class and fare patterns
train$Fare2 <- '30+'
train$Fare2[train$Fare < 30 & train$Fare >= 20] <- '20-30'
train$Fare2[train$Fare < 20 & train$Fare >= 10] <- '10-20'
train$Fare2[train$Fare < 10] <- '<10'
table(train$Fare2)
aggregate(Survived ~ Fare2 + Pclass + Sex + Child, data=train, FUN=function(x) {sum(x)/length(x)}) 

# Create new column in test set with our prediction that everyone dies
test$Survived <- 0
# Update the prediction to say that all females will survive
test$Survived[test$Sex == 'female'] <- 1
# Update once more to say that females who pay more for a third class fare also perish
test$Survived[test$Sex == 'female' & test$Pclass == 3 & test$Fare >= 20] <- 0

# Create submission file
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = 'genderclassmodel.csv', row.names = FALSE)
# kaggle score of 0.77990, same as random forest prediction score :o
