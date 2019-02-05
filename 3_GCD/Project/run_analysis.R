library(stringr)
library(dplyr)
#---------------------------- 1: DOWNLOADING FILE --------------------------------#

# Getting data from website
if(!file.exists("./data")){dir.creat("./data")}
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url, destfile = './data/activity.zip',method='curl' )
unzip('./data/activity.zip',exdir = './data')
file.rename('./data/UCI HAR Dataset/','./data/UCI/')

#------------------------ 2: READING ACT & FEAT DATA -----------------------------#

# reading in Activity Labels
activity_file <- './data/UCI/activity_labels.txt'
ActivityLabels <- read.table(activity_file,fill=T,header = FALSE)
names(ActivityLabels) <- c('ActivityNum','Activity')

# reading in Features
feat_file <- './data/UCI/features.txt'
Features <- read.table(feat_file, header = FALSE,fill=T, stringsAsFactors = FALSE)
names(Features) <- c('FeatureNum', 'Feature')

#--------------------------- 3a: READING TEST DATA --------------------------------#

#  reading in test subject data
sub_test_file <- './data/UCI/test/subject_test.txt'
Subjects_test <- read.table(sub_test_file,fill=T,header = FALSE)
names(Subjects_test) <- c('Subject')
Subjects <- as.factor(Subjects_test$Subject)

# reading in test data
test_file <- './data/UCI/test/X_test.txt'
test <- read.table(test_file,fill=T,header = FALSE)

# reading in activity vector for test data
act_test_file <- './data/UCI/test/y_test.txt'
Activity_data <- read.table(act_test_file,fill=T,header = FALSE)
names(Activity_data) <- c('Activity')
Activity <- as.factor(Activity_data$Activity)
levels(Activity) <- factor(ActivityLabels$Activity)

# combining all columns for test data
test_df <- cbind(test,Subjects,Activity)
names(test_df) <- c(Features$Feature,'Subject','Activity')

#--------------------------- 3b: READING TRAIN DATA -------------------------------#

# reading in train subject data
sub_train_file <- './data/UCI/train/subject_train.txt'
Subjects_train <- read.table(sub_train_file,fill=T,header = FALSE)
names(Subjects_train) <- c('Subject')
Subjects.1 <- as.factor(Subjects_train$Subject)

# reading in train data
train_file <- './data/UCI/train/X_train.txt'
train <- read.table(train_file,fill=T,header = FALSE)

# reading in activity vector for train data
act_train_file <- './data/UCI/train/y_train.txt'
Activity_data.1 <- read.table(act_train_file,fill=T,header = FALSE)
names(Activity_data.1) <- c('Activity')
Activity.1 <- as.factor(Activity_data.1$Activity)
levels(Activity.1) <- factor(ActivityLabels$Activity)

# combining all columns for test data
train_df <- cbind(train,Subjects.1,Activity.1)
names(train_df) <- c(Features$Feature,'Subject','Activity')

#------------------------------ 4: MERGING DATA ----------------------------------#

# merging test and train sets
merged_df <- rbind(test_df,train_df)

#------------------------- 5: EXTRACTING RELEVANT DATA ---------------------------#

# creating a vector of relevant indices to extract only mean() and std() data
relevant_indices <- grep('mean[(][)]|std[(][)]',names(merged_df))
tidy_df <- merged_df[,c(562:563,relevant_indices)]


#------------------------ 6: AVGs by ACTIVITY & SUBJECT --------------------------#

# finding the average of all variables grouped by Subject and Activity
avg_df <- tidy_df %>% group_by(Subject,Activity) %>% summarize_all(mean)

# renaming all variables with "avg." prefix (except Subject and Activity)
new_avg_names <- paste0('avg.',names(avg_df[-c(1:2)]))
names(avg_df) <- c('subject','activity',new_avg_names)

write.table(avg_df,file="independent_dataset.txt",row.name=FALSE)
