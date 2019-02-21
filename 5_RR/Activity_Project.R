library(dplyr)


# Create directory (add this directory to .gitignore file)
if(!file.exists("./data")) {
      dir.create("./data")
}

# Download file
if(!file.exists("./data/activity.zip")) {
      url <- 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip'
      download.file(url, destfile = './data/activity.zip',method='curl' )
}

# Unzip file
if(!file.exists("./data/activity.csv")) {
      unzip('./data/activity.zip',exdir = './data')
}

# Read in data
activity <- read.csv('data/activity.csv')

# Look at data
str(activity)
names(activity)
head(activity,20)

# notices some na's so I will keep that in mind when doing histogram

# histogram of number of steps
barplot(tapply(activity$steps, activity$date, FUN=sum,na.rm=TRUE))
