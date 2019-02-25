library(dplyr)
library(RColorBrewer)
library(ggplot2)
options(digits=2)

## creating color palette
shades <- brewer.pal(9, "Purples")

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
head(activity,10)
tail(activity,10)

# After seeing NAs in both head and tail, I decide to sum the non-NAs to verify
# I have data in the steps column
sum(!is.na(activity$steps))

# summing total steps per day while removing nas
activity$date <- as.Date(activity$date)
df <- aggregate(activity["steps"], by=activity["date"], sum)
data <- tapply(activity$steps, activity$date, FUN=sum,na.rm=TRUE)

step_mean <- format(round(mean(df$steps, na.rm=TRUE), 2), nsmall = 2)
step_median <- format(round(median(df$steps, na.rm=TRUE), 2), nsmall = 2)

# histogram
hist(df$steps, breaks = 40, xlab = "Date")
ggplot() + aes(df$steps) + geom_histogram(binwidth=600, colour=shades[6], fill=shades[5]) +
      geom_vline(xintercept=mean(df$steps,na.rm = TRUE), lwd=1, linetype=2, color=shades[8]) +
      geom_label(x=12500, y=6.2, aes(fontface=2), 
                label = paste('Mean:',step_mean)) +
      geom_label(x=12650, y=5.6, aes(fontface=2), 
                 label = paste('Median:',step_median)) +
      xlab("Steps per Day") +
      ylab("")

# number of steps in interval
activity$interval <- as.factor(activity$interval)
levels(activity$interval)
per_interval <- aggregate(activity["steps"], by=activity["interval"], mean, na.rm=TRUE)
ggplot(data=per_interval, aes(x=interval, y=steps, group=1)) +
      geom_line(color=shades[6]) 
