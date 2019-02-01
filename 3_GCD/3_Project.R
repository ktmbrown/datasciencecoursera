# Getting data from website
if(!file.exists("./data")){dir.creat("./data")}
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url, destfile = './data/activity.zip',method='curl' )
unzip('./data/activity.zip',exdir = './data')
file.rename('./data/UCI HAR Dataset/','./data/UCI/')

# read in x_test
library(stringr)
file <- './data/UCI/test/X_test.txt'
file2 <- './data/UCI/test/y_test.txt'
x_test <- read.fwf(file,widths=c(15,15,15,15,15))
x_labels <- read.fwf(file2,widths=c(1))
x_labels <- as.factor(x_labels$V1)
Activity <- x_labels
x_df <- cbind(x_test,Activity)
