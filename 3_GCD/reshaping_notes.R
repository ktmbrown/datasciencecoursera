# reshaping data

library(reshape2)
head(mtcars)

# 1. melt the data set
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

# 2. casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData

# 3. recast data frames
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

head(InsectSprays)
# take sum of count of insects for each spray
# apply to count along the index spray the function sum
tapply(InsectSprays$count, InsectSprays$spray,sum)

# split apply combine
spIns <- split(InsectSprays$count,InsectSprays$spray)
spIns

# apply a function to list
sprCount <- lapply(spIns,sum)
sprCount

# combine
unlist(sprCount)
sprCount

# both apply and combine steps together
sapply(spIns,sum)

# another way
ddply(InsectSprays,.(spray),summarize, sum=sum(count))

# same dimension as original dataset but sum is listed in row for each unique spray
spraySums <- ddply(InsectSprays,.(spray),summarize, sum=ave(count,FUN=sum))
dim(spraySums)

# more
# acast turns into array(possibly multidimensional)
# arrange - reordering quickly
# mutate
