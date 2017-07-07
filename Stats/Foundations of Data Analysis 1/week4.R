# week4: Bivariate distributions (Categorical Data)

#### Videos
# Table proportions
acl <- AustinCityLimits
table(acl$Grammy)
gtab <- table(acl$Grammy)
prop.table(gtab)
gtab2 <- table(acl$Grammy, acl$Gender)
gtab2
prop.table(gtab2) 
prop.table(gtab2,1) 
prop.table(gtab2,2)

# Grouped bar charts
barplot(gtab, main='ACL Grammy Winners', xlab = 'Grammy Winners',
        ylab='Counts')

#### Prelab ########
table(head(acl$Grammy,10))
which(acl$Gender=='F' & acl$Age>60)
acl[10,]

#Subset the data for artists age 30 or older
older <-acl[acl$Age>=30,]
table(older$Gender=='M')
# Create tables of marginal distributions
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender

# Create contingency table 
twoway <- table(older$Gender,older$Genre)
twoway

# Visualize the counts
barplot(twoway, legend=T, beside=T)

# Calculate P(A): the probability of each genre being played
prop.table(genre)

# Calculate P(A|B): the probability of each genre being played, given the artist’s gender
prop.table(twoway,2)

#### Lab ########
gtab3 <- table(acl$Grammy, acl$Genre, acl$Gender)
gtab3
plot(gtab3)

#### Problem Set #####
popular <- acl[acl$Facebook.100k,]
table(acl$Facebook.100k)
summary(popular)
popular_age <- table(acl$Age.Group,acl$Facebook.100k)
prop.table(popular_age,1)
