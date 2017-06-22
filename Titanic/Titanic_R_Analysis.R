# Based on a tutorial by Trevor Stephens
# http://trevorstephens.com/kaggle-titanic-tutorial/getting-started-with-r/

# Set working directory and import datafiles
setwd("~/Documents/Projects/Machine Learning/Titanic")
train <- read_csv("~/Documents/Projects/Machine Learning/Titanic/train.csv", stringsAsFactors=FALSE)
test <- read_csv("~/Documents/Projects/Machine Learning/Titanic/test.csv")

# Examine structure of dataframe
str(train)

# Look at number of people who survived
table(train$Survived)
prop.table(table(train$Survived))

# Create new column in test set with everyone dies prediction
test$Survived <- rep(0,418)
test$Survived

# Create a submission dataframe and output to file
submit <- data.frame(PasssengerId = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = 'theyallperish.csv', row.names = FALSE)

# Look at gender patterns
summary(train$Sex)
table(train$Sex)
table(train$Sex, train$Survived)
prop.table(table(train$Sex, train$Survived))


# Create new column in test set with our prediction that everyone dies
test$Survived <- 0
# Update the prediction to say that all females will survive
test$Survived[test$Sex == 'female'] <- 1

# Create submission dataframe and output to file
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = "gendermodel.csv", row.names = FALSE)

# Look at age patterns
summary(train$Age)
train$Child <- 0
train$Child[train$Age < 18] <-1
table(train$Child)
