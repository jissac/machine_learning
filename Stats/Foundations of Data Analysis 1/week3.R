# week 3: Bivariate Distributions
####### videos #########
bull <- BullRiders
plot(bull$YearsPro, bull$BuckOuts12)

# use lm function - linear model function
abline(lm(bull$BuckOuts12 ~ bull$YearsPro))
cor(bull$YearsPro, bull$BuckOuts12)

plot(bull$Events12, bull$BuckOuts12)
abline(lm(bull$BuckOuts12 ~ bull$Events12))
cor(bull$Events12, bull$BuckOuts12)

# Create correlation matrix
myvars <- c('YearsPro', 'Events12', 'BuckOuts12')
cor(bull[,myvars])

###### preLab ##########
table(head(bull$YearsPro,10)>=10)
top15 <- head(bull,15)
bull[which.min(top15$BuckOuts14),]$Rides14

#Subset for riders that participated in at least one event in 2013
new_bull <- bull[bull$Events13  > 0 ,]

# Visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)

# Visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)

# Create a scatterplot
plot(new_bull$Rides13,new_bull$Top10_13)

# Add line of best fit
abline(lm(new_bull$Top10_13~new_bull$Rides13))

# Calculate the correlation coefficient
cor(new_bull$Rides13,new_bull$Top10_13)

# Create a correlation matrix 
vars <- c("Top10_13", "Rides13")
cor(new_bull[,vars])

#identify a specific record
new_bull[which(new_bull$Top10_13==2 & new_bull$Rides13==22),]

###### Lab ##########

#Subset for riders that participated in at least one event in 2012
new_bull12 <- bull[bull$Events12  > 0 ,]

hist(bull$Earnings12)
median(bull$Earnings12)
max(bull$Earnings12)

plot(bull$RidePer12,bull$Earnings12)
cor(bull$RidePer12,bull$Earnings12)

plot(bull$CupPoints12,bull$Earnings12)
cor(bull$CupPoints12,bull$Earnings12)

# identify specific case
new_bull12[which(new_bull12$Earnings12 == max(new_bull12$Earnings12)),]

#Subset the data
nooutlier <- new_bull12[new_bull12$Earnings12 < 1000000 ,] 

plot(nooutlier$RidePer12,nooutlier$Earnings12)
cor(nooutlier$RidePer12,nooutlier$Earnings12)


plot(nooutlier$CupPoints12,nooutlier$Earnings12)
cor(nooutlier$CupPoints12,nooutlier$Earnings12)

###### Problem Set ##########
new_bull <- bull[bull$Events14  > 0 ,]
RidesPerEvent14 <- new_bull$Rides14/new_bull$Events14
hist(RidesPerEvent14)
min(RidesPerEvent14)
median(RidesPerEvent14)
max(RidesPerEvent14)
plot(RidesPerEvent14,new_bull$Rank14)
cor(RidesPerEvent14,new_bull$Rank14)

minutes_studying <- c(30,45,180,95,130,140,80,60,110,0,80)
exam_grade <- c(74,68,87,90,94,84,88,82,93,65,90)
plot(minutes_studying,exam_grade)
cor(minutes_studying,exam_grade)
