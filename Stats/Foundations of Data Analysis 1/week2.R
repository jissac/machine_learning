library(SDSFoundations)
############################
#Lessons
animaldata <- AnimalData
View(animaldata)
head(animaldata)
table(animaldata$Sex)
# Barplot
barplot(table(animaldata$Sex),
        main='Bar Chart of Animal Genders',
        xlab = 'Animal Gender', ylab='Frequency')
# Histogram
hist(animaldata$Age.Intake,
     main='Histogram of Intake Age',
     xlab='Age at Intake')
female_age <-animaldata$Age.Intake[animaldata$Sex == 'Female']
male_age <-animaldata$Age.Intake[animaldata$Sex == 'Male']
hist(female_age,
     main='Histogram of Female Ages',
     xlab='Age at Intake for Female Animals')
hist(male_age,
     main='Histogram of Male Ages',
     xlab='Age at Intake for Male Animals',
     breaks=5)
max(male_age)
max(female_age)
animaldata[which(animaldata$Age.Intake==17),]

# univariate descriptive statistics
mean(animaldata$Age.Intake)
median(animaldata$Age.Intake)
sd(animaldata$Age.Intake)
# Five num summary
# [min, 1st quart, median, 3rd quart,max]
fivenum(animaldata$Age.Intake)

hours<-c(10,2,6,12,14,15,15,24,15,25,3,12)
mean(hours)
sd(hours)
fivenum(hours)
plot(hours)
median(hours)
range(hours)
IQR(hours)
##################################
# Prelab
animaldata <- AnimalData
first_ten = head(animaldata,10)
table(first_ten$Outcome.Type=='Adoption')
animaldata[which(animaldata$Intake.Type=='Owner Surrender'),]

#Find the number of animals that were adopted
table(animaldata$Outcome.Type)

#Pull out only adopted animals
adopted <- animaldata[animaldata$Outcome.Type=="Adoption",]

#Pull out just the days in shelter for the adopted animals
daystoadopt <- adopted$Days.Shelter

#Visualize and describe this variable
hist(daystoadopt)
fivenum(daystoadopt)
mean(daystoadopt)
sd(daystoadopt)
which(animaldata$Days.Shelter==max(daystoadopt))

###############################
# Lab
adults = animaldata[animaldata$Age.Intake>=1,]
table(adults$Animal.Type)
adult_dogs = adults[adults$Animal.Type=='Dog',]
adult_cats = adults[adults$Animal.Type=='Cat',]
hist(adult_dogs$Weight)
hist(adult_cats$Weight)
# Use mean since cat weight is normally distributed
mean(adult_cats$Weight)
sd(adult_cats$Weight)
# Z score of a 13 pound cat
zcat = (13-8.6)/1.91
# what proportion of adult cats weigh more than 13 lbs
1-pnorm(zcat)

table(adult_dogs$Weight>13)
max(adult_dogs$Weight)
median(adult_cats$Weight)

all_dogs = animaldata[animaldata$Animal.Type=='Dog',]
mode(all_dogs$Intake.Type)

###############################
# Problem sets
animaldata <- AnimalData
table(animaldata$Intake.Type=="Owner Surrender")
owner_surrender<-animaldata[animaldata$Intake.Type=="Owner Surrender",]
table(owner_surrender$Outcome.Type=='Return to Owner')
owner_returned<- owner_surrender[owner_surrender$Outcome.Type=='Return to Owner',]
mean(owner_returned$Days.Shelter)
# 2 2 3 5 6 7 9 13 15 18
# median = (6+C)/2 = 6.5
C = (2*6.5)-6
# E-2=16, E=18
# IQR = Q3-Q1, D-3=10, D=13
# mean = 8 = (B+75)/10, B = 5
array = c(2,2,3,5,6,7,9,13,15,18)
mean(array)
median(array)
IQR(array)
range(array)
?IQR
