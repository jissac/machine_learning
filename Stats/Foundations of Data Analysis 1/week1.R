library(SDSFoundations)
bike <- BikeData
# Find the number of students in the dataset
table(bike$student)

# Pull out student data into a new dataframe
student <-bike[bike$student==1,]

# Find how often the students ride, using the new dataframe
table(student$cyc_freq)

# Create a vector for the distance variable
distance <-student$distance

# Find average distance ridden
mean(distance)

table(bike$cyc_freq=='Daily')
male_riders <- bike[bike$cyc_freq=='Daily',]$gender=='M'
table(male_riders)
mean(bike$cyc_freq=='Daily')
female_riders <- bike[bike$cyc_freq=='Daily',]$gender=='F'
table(female_riders)
daily_rider = bike[bike$cyc_freq=='Daily',]
female_daily = daily_rider[daily_rider$gender=='F',]
mean(female_daily$age)
male_daily = daily_rider[daily_rider$gender=='M',]
mean(male_daily$age)
table(male_daily$age>=30)
