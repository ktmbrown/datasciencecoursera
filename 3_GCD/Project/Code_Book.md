Human Activity Recognition Using Smartphones: CODEBOOK
================
Katie M Brown
February 5, 2019

Tidy Data: Independent Data Set - Code Book
-------------------------------------------

In addition to the original test and training data (which was merged together in one tidy dataset) an independent dataset was created (in Phase 7 of `run_analysis.R`) using a subset of the features provided in the orginal dataset.

For each record in this independent dataset, the following has been provided:

| ColumnName           | Description                                                                           | Class          | Contents                                                                       |
|:---------------------|:--------------------------------------------------------------------------------------|:---------------|:-------------------------------------------------------------------------------|
| Subject              | Value that identifies the volunteer                                                   | Factor         | Number from 1-30                                                               |
| Activity             | Descriptive identifier that represents the activity performed by the subject          | Factor         | WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING     |
| \*see features below | 66-Feature vector that holds the average value for each feature from original dataset | Numeric Vector | Averages of the features below that are normalized and bounded within \[-1,1\] |

### 66-Feature Vector

The original dataset was made up of 10299 records and 561 features. The independent dataset is a subset of the original data, making up only the averages of features that are included in the following subset. This dataset is made up of:

| Feature                        | Description                                                                                                                  | Units                              |
|:-------------------------------|:-----------------------------------------------------------------------------------------------------------------------------|:-----------------------------------|
| avg.TimeBodyAcc-mean()-X       | Mean of the linear body acceleration on the X axis for the domain of time.                                                   | gravity (g)                        |
| avg.TimeBodyAcc-mean()-Y       | Mean of the linear body acceleration on the Y axis for the domain of time.                                                   | gravity (g)                        |
| avg.TimeBodyAcc-mean()-Z       | Mean of the linear body acceleration on the Z axis for the domain of time.                                                   | gravity (g)                        |
| avg.TimeBodyAcc-std()-X        | Standard deviation of the linear body acceleration on the X axis for the domain of time.                                     | gravity (g)                        |
| avg.TimeBodyAcc-std()-Y        | Standard deviation of the linear body acceleration on the Y axis for the domain of time.                                     | gravity (g)                        |
| avg.TimeBodyAcc-std()-Z        | Standard deviation of the linear body acceleration on the Z axis for the domain of time.                                     | gravity (g)                        |
| avg.TimeGravityAcc-mean()-X    | Mean of the gravitational acceleration on the X axis for the domain of time.                                                 | gravity (g)                        |
| avg.TimeGravityAcc-mean()-Y    | Mean of the gravitational acceleration on the Y axis for the domain of time.                                                 | gravity (g)                        |
| avg.TimeGravityAcc-mean()-Z    | Mean of the gravitational acceleration on the Z axis for the domain of time.                                                 | gravity (g)                        |
| avg.TimeGravityAcc-std()-X     | Standard deviation of the gravitational acceleration on the X axis for the domain of time.                                   | gravity (g)                        |
| avg.TimeGravityAcc-std()-Y     | Standard deviation of the gravitational acceleration on the Y axis for the domain of time.                                   | gravity (g)                        |
| avg.TimeGravityAcc-std()-Z     | Standard deviation of the gravitational acceleration on the Z axis for the domain of time.                                   | gravity (g)                        |
| avg.TimeBodyAccJerk-mean()-X   | Mean of the rate of change of linear body acceleration on the X axis for the domain of time.                                 | gravity per second (g/s)           |
| avg.TimeBodyAccJerk-mean()-Y   | Mean of the rate of change of linear body acceleration on the Y axis for the domain of time.                                 | gravity per second (g/s)           |
| avg.TimeBodyAccJerk-mean()-Z   | Mean of the rate of change of linear body acceleration on the Z axis for the domain of time.                                 | gravity per second (g/s)           |
| avg.TimeBodyAccJerk-std()-X    | Standard deviation of the rate of change of linear body acceleration on the X axis for the domain of time.                   | gravity per second (g/s)           |
| avg.TimeBodyAccJerk-std()-Y    | Standard deviation of the rate of change of linear body acceleration on the Y axis for the domain of time.                   | gravity per second (g/s)           |
| avg.TimeBodyAccJerk-std()-Z    | Standard deviation of the rate of change of linear body acceleration on the Z axis for the domain of time.                   | gravity per second (g/s)           |
| avg.TimeBodyGyro-mean()-X      | Mean of the angular velocity on the X axis for the domain of time.                                                           | radians per second (r/s)           |
| avg.TimeBodyGyro-mean()-Y      | Mean of the angular velocity on the Y axis for the domain of time.                                                           | radians per second (r/s)           |
| avg.TimeBodyGyro-mean()-Z      | Mean of the angular velocity on the Z axis for the domain of time.                                                           | radians per second (r/s)           |
| avg.TimeBodyGyro-std()-X       | Standard deviation of the angular velocity on the X axis for the domain of time.                                             | radians per second (r/s)           |
| avg.TimeBodyGyro-std()-Y       | Standard deviation of the angular velocity on the Y axis for the domain of time.                                             | radians per second (r/s)           |
| avg.TimeBodyGyro-std()-Z       | Standard deviation of the angular velocity on the Z axis for the domain of time.                                             | radians per second (r/s)           |
| avg.TimeBodyGyroJerk-mean()-X  | Mean of the rate of change of angular velocity on the X axis for the domain of time.                                         | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerk-mean()-Y  | Mean of the rate of change of angular velocity on the Y axis for the domain of time.                                         | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerk-mean()-Z  | Mean of the rate of change of angular velocity on the Z axis for the domain of time.                                         | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerk-std()-X   | Standard deviation of the rate of change of angular velocity on the X axis for the domain of time.                           | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerk-std()-Y   | Standard deviation of the rate of change of angular velocity on the Y axis for the domain of time.                           | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerk-std()-Z   | Standard deviation of the rate of change of angular velocity on the Z axis for the domain of time.                           | radians per second squared (r/s^2) |
| avg.TimeBodyAccMag-mean()      | Mean of the magnitude of the linear body acceleration (no axis) for the domain of time.                                      | gravity (g)                        |
| avg.TimeBodyAccMag-std()       | Standard deviation of the magnitude of the linear body acceleration (no axis) for the domain of time.                        | gravity (g)                        |
| avg.TimeGravityAccMag-mean()   | Mean of the magnitude of the gravitational acceleration (no axis) for the domain of time.                                    | gravity (g)                        |
| avg.TimeGravityAccMag-std()    | Standard deviation of the magnitude of the gravitational acceleration (no axis) for the domain of time.                      | gravity (g)                        |
| avg.TimeBodyAccJerkMag-mean()  | Mean of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of time.                    | gravity per second (g/s)           |
| avg.TimeBodyAccJerkMag-std()   | Standard deviation of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of time.      | gravity per second (g/s)           |
| avg.TimeBodyGyroMag-mean()     | Mean of the magnitude of the angular velocity (no axis) for the domain of time.                                              | radians per second (r/s)           |
| avg.TimeBodyGyroMag-std()      | Standard deviation of the magnitude of the angular velocity (no axis) for the domain of time.                                | radians per second (r/s)           |
| avg.TimeBodyGyroJerkMag-mean() | Mean of the magnitude of the rate of change of angular velocity (no axis) for the domain of time.                            | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerkMag-std()  | Standard deviation of the magnitude of the rate of change of angular velocity (no axis) for the domain of time.              | radians per second squared (r/s^2) |
| avg.FreqBodyAcc-mean()-X       | Mean of the linear body acceleration on the X axis for the domain of frequency.                                              | gravity (g)                        |
| avg.FreqBodyAcc-mean()-Y       | Mean of the linear body acceleration on the Y axis for the domain of frequency.                                              | gravity (g)                        |
| avg.FreqBodyAcc-mean()-Z       | Mean of the linear body acceleration on the Z axis for the domain of frequency.                                              | gravity (g)                        |
| avg.FreqBodyAcc-std()-X        | Standard deviation of the linear body acceleration on the X axis for the domain of frequency.                                | gravity (g)                        |
| avg.FreqBodyAcc-std()-Y        | Standard deviation of the linear body acceleration on the Y axis for the domain of frequency.                                | gravity (g)                        |
| avg.FreqBodyAcc-std()-Z        | Standard deviation of the linear body acceleration on the Z axis for the domain of frequency.                                | gravity (g)                        |
| avg.FreqBodyAccJerk-mean()-X   | Mean of the rate of change of linear body acceleration on the X axis for the domain of frequency.                            | gravity per second (g/s)           |
| avg.FreqBodyAccJerk-mean()-Y   | Mean of the rate of change of linear body acceleration on the Y axis for the domain of frequency.                            | gravity per second (g/s)           |
| avg.FreqBodyAccJerk-mean()-Z   | Mean of the rate of change of linear body acceleration on the Z axis for the domain of frequency.                            | gravity per second (g/s)           |
| avg.FreqBodyAccJerk-std()-X    | Standard deviation of the rate of change of linear body acceleration on the X axis for the domain of frequency.              | gravity per second (g/s)           |
| avg.FreqBodyAccJerk-std()-Y    | Standard deviation of the rate of change of linear body acceleration on the Y axis for the domain of frequency.              | gravity per second (g/s)           |
| avg.FreqBodyAccJerk-std()-Z    | Standard deviation of the rate of change of linear body acceleration on the Z axis for the domain of frequency.              | gravity per second (g/s)           |
| avg.FreqBodyGyro-mean()-X      | Mean of the angular velocity on the X axis for the domain of frequency.                                                      | radians per second (r/s)           |
| avg.FreqBodyGyro-mean()-Y      | Mean of the angular velocity on the Y axis for the domain of frequency.                                                      | radians per second (r/s)           |
| avg.FreqBodyGyro-mean()-Z      | Mean of the angular velocity on the Z axis for the domain of frequency.                                                      | radians per second (r/s)           |
| avg.FreqBodyGyro-std()-X       | Standard deviation of the angular velocity on the X axis for the domain of frequency.                                        | radians per second (r/s)           |
| avg.FreqBodyGyro-std()-Y       | Standard deviation of the angular velocity on the Y axis for the domain of frequency.                                        | radians per second (r/s)           |
| avg.FreqBodyGyro-std()-Z       | Standard deviation of the angular velocity on the Z axis for the domain of frequency.                                        | radians per second (r/s)           |
| avg.FreqBodyAccMag-mean()      | Mean of the magnitude of the linear body acceleration (no axis) for the domain of frequency.                                 | gravity (g)                        |
| avg.FreqBodyAccMag-std()       | Standard deviation of the magnitude of the linear body acceleration (no axis) for the domain of frequency.                   | gravity (g)                        |
| avg.FreqBodyAccJerkMag-mean()  | Mean of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of frequency.               | gravity per second (g/s)           |
| avg.FreqBodyAccJerkMag-std()   | Standard deviation of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of frequency. | gravity per second (g/s)           |
| avg.FreqBodyGyroMag-mean()     | Mean of the magnitude of the angular velocity (no axis) for the domain of frequency.                                         | radians per second (r/s)           |
| avg.FreqBodyGyroMag-std()      | Standard deviation of the magnitude of the angular velocity (no axis) for the domain of frequency.                           | radians per second (r/s)           |
| avg.FreqBodyGyroJerkMag-mean() | Mean of the magnitude of the rate of change of angular velocity (no axis) for the domain of frequency.                       | radians per second squared (r/s^2) |
| avg.FreqBodyGyroJerkMag-std()  | Standard deviation of the magnitude of the rate of change of angular velocity (no axis) for the domain of frequency.         | radians per second squared (r/s^2) |

The data in this independent dataset are a subset, either a mean() or a std(), of the original features, which are listed in the table below.
*Note: The 'XYZ' tag indicates 3 separate features, an X axis, Y axis and Z axis.*:

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

The 33 datapoints above each have a feature based on the following 17 functions (see table below), making a total of 561 features in the original data set.

| FunctionsOfFeatures | IndependentDataset                |
|:--------------------|:----------------------------------|
| mean()              | \*Included in independent dataset |
| std()               | \*Included in independent dataset |
| mad()               | Not Included                      |
| max()               | Not Included                      |
| min()               | Not Included                      |
| sma()               | Not Included                      |
| energy()            | Not Included                      |
| iqr()               | Not Included                      |
| entropy()           | Not Included                      |
| arCoeff()           | Not Included                      |
| correlation()       | Not Included                      |
| maxInds()           | Not Included                      |
| meanFreq()          | Not Included                      |
| skewness()          | Not Included                      |
| kurtosis()          | Not Included                      |
| bandsEnergy()       | Not Included                      |
| angle()             | Not Included                      |
