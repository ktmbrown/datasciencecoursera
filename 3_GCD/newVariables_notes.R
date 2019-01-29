library(plyr)
# Baltimore City Restaurants

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- 'https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD'
download.file(fileUrl,destfile='./data/restaurants.csv',method='curl')
restData <- read.csv('./data/restaurants.csv')
head(restData,n=3)
tail(restData,n=3)
summary(restData)
str(restData)
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict, probs = c(.5,.75,.9))
table(restData$zipCode,useNA="ifany")

# creating sequences
s1 <- seq(1,10,by=2) ; s1

s2 <- seq(1,10,length = 3) ; s2

x <- c(1,3,8,25,100); seq(along=x)

# restaurant data: new variable - restaurant near me

restData$nearMe <- restData$neighborhood %in% c('Roland Park','Homeland')
table(restData$nearMe)

# create binary variables: where is zip code wrong
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE,FALSE)
table(restData$zipWrong,restData$zipCode < 0)

# creating categorical values
restData$zipGroups <- cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups,restData$zipCode)

#easier way to do tihs
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

# creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# levels of factor variables
yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac <- factor(yesno,levels=c("yes","no"))
relevel(yesnofac,ref="yes")
as.numeric(yesnofac)

# cutting produces factor variables
restData$zipGroups <- cut2(restData$zipCode,g=4)
table(restData$zipGroups)
class(restData$zipGroups)

# mutate function plyr package
restData2 <- mutate(restData,zipGroups = cut2(zipCode,g=4))
table(restData2$zipGroups)

# common transformations:
# abs(x), sqrt(x), ceiling(x), floor(x), round(x, digits = n), signif(x, digits=n)
# cos(x), sin(x), log(x), log2(x), log10(x), exp(x)