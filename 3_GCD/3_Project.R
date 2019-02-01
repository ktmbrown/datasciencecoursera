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
test <- read.fwf(file,widths=c(16,16,16,16,16))
Activity<- read.fwf(file2,widths=c(1))
Activity <- as.factor(Activity$V1)
levels(Activity) <- c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS',
                      'SITTING','STANDING', 'LAYING')
test_df <- cbind(x_test,Activity)
head(test_df)

# read in x_train
file <- './data/UCI/train/X_train.txt'
file2 <- './data/UCI/train/y_train.txt'
train <- read.fwf(file,widths=c(16,16,16,16,16,16))
Activity_train<- read.fwf(file2,widths=c(1))
Activity_train <- as.factor(Activity_train$V1)
levels(Activity_train) <- c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS',
                      'SITTING','STANDING', 'LAYING')
train_df <- cbind(x_train,Activity_train)
head(train_df)

