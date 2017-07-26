## week 6: exponential and logistic growth
world <- WorldBankData

######## Prelab #########
head(world[world$IncomeGroup=='Low income',1])
world[world$Country=='Aruba' & world$year==1970,]
world[world$Country=='Australia' & world$mobile.users>0,]

# Subset data for just the United States and name the new data frame "us"
us <- world[world$Country.Code == "USA",]

# Select the years from 1990 and name the new data frame "us_select"
us_select <- us[us$year >= 1990, ]

# Create a new variable in our datset called internet.mil to make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000

# Create a new variable in our dataset called time that represents "years since 1990"
us_select$time <- us_select$year - 1990

# Select the first 10 years (from 1990 to 1999) and name the new data frame "us_select_10"
us_select_10 <- us_select[us_select$time < 10,]

# Use a function to fit an exponential and logistic model for 1990-1999
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)

# Based on the prior model parameters, predict the number of internet users in 2006
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)

# actual number of internet users in 2006
us_select[us_select$year==2006,]

########## Lab ###############
world <- WorldBankData
world_select <- world[world$year>=1990,]
world_select$internet_prop <- world_select$internet.users/world_select$population
world_select$time <- world_select$year - 1990
denmark <- world_select[world_select$Country=='Denmark',]
#denmark_10 <- denmark[denmark$time < 10,]

expFit(denmark$time, denmark$internet_prop)
logisticFit(denmark$time, denmark$internet_prop)

e_pred <- expFitPred(denmark$time, denmark$internet_prop, 0)
l <- logisticFitPred(denmark$time, us_select_10$internet.mil, 16)

####### Problem Sets ##########
world <- WorldBankData
brazil <- world[world$Country.Code == "BRA",]
brazil_select = brazil[brazil$year >= 1995,]
brazil_select$mobile.mil <- brazil_select$mobile.users/1000000
brazil_select$time <- brazil_select$year - 1995
tripleFit(brazil_select$time,brazil_select$mobile.mil)
logisticFit(brazil_select$time, brazil_select$mobile.mil)
l_pred <- logisticFitPred(brazil_select$time, brazil_select$mobile.mil, 30)

 