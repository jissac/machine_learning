# Decision Tree in R

# Load data
train <- read_csv("~/Machine Learning/Titanic/train.csv")
test <- read_csv("~/Machine Learning/Titanic/test.csv")

# Install and load packages
install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Recreate the gender model
fit <- rpart(Survived ~ Sex, data=train, method="class")
fancyRpartPlot(fit)
text(fit)

# Deeper tree
fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = 'class')
plot(fit)
fancyRpartPlot(fit)

# Make prediciton and submit file
Prediction <- predict(fit, test, type='class')
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = 'decisiontree.csv', row.names = FALSE)
# ?rpart.control

# Manually trim a decision tree
fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train,
             method="class", control=rpart.control(minsplit=2, cp=0.005))
new.fit <- prp(fit,snip=TRUE)$obj
fancyRpartPlot(fit)
fancyRpartPlot(new.fit)


Prediction <- predict(new.fit, test, type='class')
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = 'pruned_decisiontree.csv', row.names = FALSE)
