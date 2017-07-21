# week5
library(SDSFoundations)
WR <- WorldRecords
mens800 <- WR[WR$Event == 'Mens 800m',]
linFit(mens800$Year, mens800$Record, xlab = "Year",
  ylab = "Time in Seconds")

##### Prelab #####
table(WR$Event)
mens100 <- WR[WR$Event == 'Mens 100m',]
WR[WR$Event == 'Womens Mile' & WR$Record < 260,]

#Subset the data
menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shotput',] 

#Create scatterplots
plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)

###### Lab ######
# Subset data
mensmile <- WR[WR$Event=='Mens Mile',]
womensmile <- WR[WR$Event=='Womens Mile',]

# Create scatterplots
plot(mensmile$Year,mensmile$Record,main='Mens Mile World Records',xlab='Year',ylab='World Record Distance (mile)',pch=16)
plot(womensmile$Year,womensmile$Record,main='Womens Mile World Records',xlab='Year',ylab='World Record Distance (mile)',pch=16)

#Run linear models
linFit(mensmile$Year, mensmile$Record)
linFit(womensmile$Year,womensmile$Record)

####### Problem Set ##########
mens_polevault <- WR[WR$Event=='Mens Polevault' & WR$Year >= 1970,]
plot(mens_polevault$Year,mens_polevault$Record)
linFit(mens_polevault$Year,mens_polevault$Record)

C	= c(140,280,420,560)
h	= c(0,2,4,6)
linFit(h,C)

(175*4-140)/70

(2.84+.04*14.50)-2.91

