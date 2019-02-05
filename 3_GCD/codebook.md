Human Activity Recognition Using Smartphones: Codebook
================
Katie M Brown
February 4, 2019

Tidy Data - Dataset of Averages
-------------------------------

*Disclaimer: This codebook modifies and updates the original codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.*

This data set was created using the following files:

-   **README.txt**: general information about the gathering of data and the dataset itself
-   **features\_info.txt**: information about the variables found in the feature vector
-   **features.txt**: a list of 561 features that links with the test/train data
-   **activity\_labels.txt**: links the data in the training/testing sets with their appropriate descriptive label using a key (1-6)
-   **train/X\_train.txt**: Training set
-   **train/y\_train.txt**: Training labels
-   **test/X\_test.txt**: Test set
-   **test/y\_test.txt**: Test labels

In addition to the original test and training data (which was merged together in one tidy dataset) an independent dataset was created using a subset of the features provided in the orginal dataset.

For each record in this independent dataset, the following has been provided:

| ColumnName           | Description                                                                           | Class          | Contents                                                                       |
|:---------------------|:--------------------------------------------------------------------------------------|:---------------|:-------------------------------------------------------------------------------|
| Subject              | Value that identifies the volunteer                                                   | Factor         | Number from 1-30                                                               |
| Activity             | Descriptive identifier that represents the activity performed by the subject          | Factor         | WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING     |
| \*see features below | 66-Feature vector that holds the average value for each feature from original dataset | Numeric Vector | Averages of the features below that are normalized and bounded within \[-1,1\] |

### 66-Feature Vector

The original dataset was made up of 10299 records and 561 features. The independent dataset is a subset of the original data, making up only the averages of features that are included in the following subset. This dataset is made up of:

| Feature                        |
|:-------------------------------|
| avg.TimeBodyAcc-mean()-X       |
| avg.TimeBodyAcc-mean()-Y       |
| avg.TimeBodyAcc-mean()-Z       |
| avg.TimeBodyAcc-std()-X        |
| avg.TimeBodyAcc-std()-Y        |
| avg.TimeBodyAcc-std()-Z        |
| avg.TimeGravityAcc-mean()-X    |
| avg.TimeGravityAcc-mean()-Y    |
| avg.TimeGravityAcc-mean()-Z    |
| avg.TimeGravityAcc-std()-X     |
| avg.TimeGravityAcc-std()-Y     |
| avg.TimeGravityAcc-std()-Z     |
| avg.TimeBodyAccJerk-mean()-X   |
| avg.TimeBodyAccJerk-mean()-Y   |
| avg.TimeBodyAccJerk-mean()-Z   |
| avg.TimeBodyAccJerk-std()-X    |
| avg.TimeBodyAccJerk-std()-Y    |
| avg.TimeBodyAccJerk-std()-Z    |
| avg.TimeBodyGyro-mean()-X      |
| avg.TimeBodyGyro-mean()-Y      |
| avg.TimeBodyGyro-mean()-Z      |
| avg.TimeBodyGyro-std()-X       |
| avg.TimeBodyGyro-std()-Y       |
| avg.TimeBodyGyro-std()-Z       |
| avg.TimeBodyGyroJerk-mean()-X  |
| avg.TimeBodyGyroJerk-mean()-Y  |
| avg.TimeBodyGyroJerk-mean()-Z  |
| avg.TimeBodyGyroJerk-std()-X   |
| avg.TimeBodyGyroJerk-std()-Y   |
| avg.TimeBodyGyroJerk-std()-Z   |
| avg.TimeBodyAccMag-mean()      |
| avg.TimeBodyAccMag-std()       |
| avg.TimeGravityAccMag-mean()   |
| avg.TimeGravityAccMag-std()    |
| avg.TimeBodyAccJerkMag-mean()  |
| avg.TimeBodyAccJerkMag-std()   |
| avg.TimeBodyGyroMag-mean()     |
| avg.TimeBodyGyroMag-std()      |
| avg.TimeBodyGyroJerkMag-mean() |
| avg.TimeBodyGyroJerkMag-std()  |
| avg.FreqBodyAcc-mean()-X       |
| avg.FreqBodyAcc-mean()-Y       |
| avg.FreqBodyAcc-mean()-Z       |
| avg.FreqBodyAcc-std()-X        |
| avg.FreqBodyAcc-std()-Y        |
| avg.FreqBodyAcc-std()-Z        |
| avg.FreqBodyAccJerk-mean()-X   |
| avg.FreqBodyAccJerk-mean()-Y   |
| avg.FreqBodyAccJerk-mean()-Z   |
| avg.FreqBodyAccJerk-std()-X    |
| avg.FreqBodyAccJerk-std()-Y    |
| avg.FreqBodyAccJerk-std()-Z    |
| avg.FreqBodyGyro-mean()-X      |
| avg.FreqBodyGyro-mean()-Y      |
| avg.FreqBodyGyro-mean()-Z      |
| avg.FreqBodyGyro-std()-X       |
| avg.FreqBodyGyro-std()-Y       |
| avg.FreqBodyGyro-std()-Z       |
| avg.FreqBodyAccMag-mean()      |
| avg.FreqBodyAccMag-std()       |
| avg.FreqBodyAccJerkMag-mean()  |
| avg.FreqBodyAccJerkMag-std()   |
| avg.FreqBodyGyroMag-mean()     |
| avg.FreqBodyGyroMag-std()      |
| avg.FreqBodyGyroJerkMag-mean() |
| avg.FreqBodyGyroJerkMag-std()  |
| avg.Subject                    |
| avg.Activity                   |

The data in this independent dataset are a subset, either a mean() or a std(), of the original features, which are listed here:

| OriginalFeatures  |
|:------------------|
| tBodyAcc-XYZ      |
| tGravityAcc-XYZ   |
| tBodyAccJerk-XYZ  |
| tBodyGyro-XYZ     |
| tBodyGyroJerk-XYZ |
| tBodyAccMag       |
| tGravityAccMag    |
| tBodyAccJerkMag   |
| tBodyGyroMag      |
| tBodyGyroJerkMag  |
| fBodyAcc-XYZ      |
| fBodyAccJerk-XYZ  |
| fBodyGyro-XYZ     |
| fBodyAccMag       |
| fBodyAccJerkMag   |
| fBodyGyroMag      |
| fBodyGyroJerkMag  |

| FunctionsOfFeatures |
|:--------------------|
| mean()              |
| std()               |
| mad()               |
| max()               |
| min()               |
| sma()               |
| energy()            |
| iqr()               |
| entropy()           |
| arCoeff()           |
| correlation()       |
| maxInds()           |
| meanFreq()          |
| skewness()          |
| kurtosis()          |
| bandsEnergy()       |
| angle()             |

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
