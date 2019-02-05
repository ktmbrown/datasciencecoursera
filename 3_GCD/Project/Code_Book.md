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
| Activity             | Descriptive identifier that represents the activity performed by the subject          | Factor         | WALKING, WALKINGUPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING         |
| \*see features below | 66-Feature vector that holds the average value for each feature from original dataset | Numeric Vector | Averages of the features below that are normalized and bounded within \[-1,1\] |

### 66-Feature Vector

The original dataset was made up of 10299 records and 561 features. The independent dataset is a subset of the original data, making up only the averages of features that are included in the following subset. This dataset is made up of:

| Feature                     | Description                                                                                                                  | Units                              |
|:----------------------------|:-----------------------------------------------------------------------------------------------------------------------------|:-----------------------------------|
| avg.TimeBodyAccmeanX        | Mean of the linear body acceleration on the X axis for the domain of time.                                                   | gravity (g)                        |
| avg.TimeBodyAccmeanY        | Mean of the linear body acceleration on the Y axis for the domain of time.                                                   | gravity (g)                        |
| avg.TimeBodyAccmeanZ        | Mean of the linear body acceleration on the Z axis for the domain of time.                                                   | gravity (g)                        |
| avg.TimeBodyAccstdX         | Standard deviation of the linear body acceleration on the X axis for the domain of time.                                     | gravity (g)                        |
| avg.TimeBodyAccstdY         | Standard deviation of the linear body acceleration on the Y axis for the domain of time.                                     | gravity (g)                        |
| avg.TimeBodyAccstdZ         | Standard deviation of the linear body acceleration on the Z axis for the domain of time.                                     | gravity (g)                        |
| avg.TimeGravityAccmeanX     | Mean of the gravitational acceleration on the X axis for the domain of time.                                                 | gravity (g)                        |
| avg.TimeGravityAccmeanY     | Mean of the gravitational acceleration on the Y axis for the domain of time.                                                 | gravity (g)                        |
| avg.TimeGravityAccmeanZ     | Mean of the gravitational acceleration on the Z axis for the domain of time.                                                 | gravity (g)                        |
| avg.TimeGravityAccstdX      | Standard deviation of the gravitational acceleration on the X axis for the domain of time.                                   | gravity (g)                        |
| avg.TimeGravityAccstdY      | Standard deviation of the gravitational acceleration on the Y axis for the domain of time.                                   | gravity (g)                        |
| avg.TimeGravityAccstdZ      | Standard deviation of the gravitational acceleration on the Z axis for the domain of time.                                   | gravity (g)                        |
| avg.TimeBodyAccJerkmeanX    | Mean of the rate of change of linear body acceleration on the X axis for the domain of time.                                 | gravity per second (g/s)           |
| avg.TimeBodyAccJerkmeanY    | Mean of the rate of change of linear body acceleration on the Y axis for the domain of time.                                 | gravity per second (g/s)           |
| avg.TimeBodyAccJerkmeanZ    | Mean of the rate of change of linear body acceleration on the Z axis for the domain of time.                                 | gravity per second (g/s)           |
| avg.TimeBodyAccJerkstdX     | Standard deviation of the rate of change of linear body acceleration on the X axis for the domain of time.                   | gravity per second (g/s)           |
| avg.TimeBodyAccJerkstdY     | Standard deviation of the rate of change of linear body acceleration on the Y axis for the domain of time.                   | gravity per second (g/s)           |
| avg.TimeBodyAccJerkstdZ     | Standard deviation of the rate of change of linear body acceleration on the Z axis for the domain of time.                   | gravity per second (g/s)           |
| avg.TimeBodyGyromeanX       | Mean of the angular velocity on the X axis for the domain of time.                                                           | radians per second (r/s)           |
| avg.TimeBodyGyromeanY       | Mean of the angular velocity on the Y axis for the domain of time.                                                           | radians per second (r/s)           |
| avg.TimeBodyGyromeanZ       | Mean of the angular velocity on the Z axis for the domain of time.                                                           | radians per second (r/s)           |
| avg.TimeBodyGyrostdX        | Standard deviation of the angular velocity on the X axis for the domain of time.                                             | radians per second (r/s)           |
| avg.TimeBodyGyrostdY        | Standard deviation of the angular velocity on the Y axis for the domain of time.                                             | radians per second (r/s)           |
| avg.TimeBodyGyrostdZ        | Standard deviation of the angular velocity on the Z axis for the domain of time.                                             | radians per second (r/s)           |
| avg.TimeBodyGyroJerkmeanX   | Mean of the rate of change of angular velocity on the X axis for the domain of time.                                         | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerkmeanY   | Mean of the rate of change of angular velocity on the Y axis for the domain of time.                                         | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerkmeanZ   | Mean of the rate of change of angular velocity on the Z axis for the domain of time.                                         | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerkstdX    | Standard deviation of the rate of change of angular velocity on the X axis for the domain of time.                           | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerkstdY    | Standard deviation of the rate of change of angular velocity on the Y axis for the domain of time.                           | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerkstdZ    | Standard deviation of the rate of change of angular velocity on the Z axis for the domain of time.                           | radians per second squared (r/s^2) |
| avg.TimeBodyAccMagmean      | Mean of the magnitude of the linear body acceleration (no axis) for the domain of time.                                      | gravity (g)                        |
| avg.TimeBodyAccMagstd       | Standard deviation of the magnitude of the linear body acceleration (no axis) for the domain of time.                        | gravity (g)                        |
| avg.TimeGravityAccMagmean   | Mean of the magnitude of the gravitational acceleration (no axis) for the domain of time.                                    | gravity (g)                        |
| avg.TimeGravityAccMagstd    | Standard deviation of the magnitude of the gravitational acceleration (no axis) for the domain of time.                      | gravity (g)                        |
| avg.TimeBodyAccJerkMagmean  | Mean of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of time.                    | gravity per second (g/s)           |
| avg.TimeBodyAccJerkMagstd   | Standard deviation of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of time.      | gravity per second (g/s)           |
| avg.TimeBodyGyroMagmean     | Mean of the magnitude of the angular velocity (no axis) for the domain of time.                                              | radians per second (r/s)           |
| avg.TimeBodyGyroMagstd      | Standard deviation of the magnitude of the angular velocity (no axis) for the domain of time.                                | radians per second (r/s)           |
| avg.TimeBodyGyroJerkMagmean | Mean of the magnitude of the rate of change of angular velocity (no axis) for the domain of time.                            | radians per second squared (r/s^2) |
| avg.TimeBodyGyroJerkMagstd  | Standard deviation of the magnitude of the rate of change of angular velocity (no axis) for the domain of time.              | radians per second squared (r/s^2) |
| avg.FreqBodyAccmeanX        | Mean of the linear body acceleration on the X axis for the domain of frequency.                                              | gravity (g)                        |
| avg.FreqBodyAccmeanY        | Mean of the linear body acceleration on the Y axis for the domain of frequency.                                              | gravity (g)                        |
| avg.FreqBodyAccmeanZ        | Mean of the linear body acceleration on the Z axis for the domain of frequency.                                              | gravity (g)                        |
| avg.FreqBodyAccstdX         | Standard deviation of the linear body acceleration on the X axis for the domain of frequency.                                | gravity (g)                        |
| avg.FreqBodyAccstdY         | Standard deviation of the linear body acceleration on the Y axis for the domain of frequency.                                | gravity (g)                        |
| avg.FreqBodyAccstdZ         | Standard deviation of the linear body acceleration on the Z axis for the domain of frequency.                                | gravity (g)                        |
| avg.FreqBodyAccJerkmeanX    | Mean of the rate of change of linear body acceleration on the X axis for the domain of frequency.                            | gravity per second (g/s)           |
| avg.FreqBodyAccJerkmeanY    | Mean of the rate of change of linear body acceleration on the Y axis for the domain of frequency.                            | gravity per second (g/s)           |
| avg.FreqBodyAccJerkmeanZ    | Mean of the rate of change of linear body acceleration on the Z axis for the domain of frequency.                            | gravity per second (g/s)           |
| avg.FreqBodyAccJerkstdX     | Standard deviation of the rate of change of linear body acceleration on the X axis for the domain of frequency.              | gravity per second (g/s)           |
| avg.FreqBodyAccJerkstdY     | Standard deviation of the rate of change of linear body acceleration on the Y axis for the domain of frequency.              | gravity per second (g/s)           |
| avg.FreqBodyAccJerkstdZ     | Standard deviation of the rate of change of linear body acceleration on the Z axis for the domain of frequency.              | gravity per second (g/s)           |
| avg.FreqBodyGyromeanX       | Mean of the angular velocity on the X axis for the domain of frequency.                                                      | radians per second (r/s)           |
| avg.FreqBodyGyromeanY       | Mean of the angular velocity on the Y axis for the domain of frequency.                                                      | radians per second (r/s)           |
| avg.FreqBodyGyromeanZ       | Mean of the angular velocity on the Z axis for the domain of frequency.                                                      | radians per second (r/s)           |
| avg.FreqBodyGyrostdX        | Standard deviation of the angular velocity on the X axis for the domain of frequency.                                        | radians per second (r/s)           |
| avg.FreqBodyGyrostdY        | Standard deviation of the angular velocity on the Y axis for the domain of frequency.                                        | radians per second (r/s)           |
| avg.FreqBodyGyrostdZ        | Standard deviation of the angular velocity on the Z axis for the domain of frequency.                                        | radians per second (r/s)           |
| avg.FreqBodyAccMagmean      | Mean of the magnitude of the linear body acceleration (no axis) for the domain of frequency.                                 | gravity (g)                        |
| avg.FreqBodyAccMagstd       | Standard deviation of the magnitude of the linear body acceleration (no axis) for the domain of frequency.                   | gravity (g)                        |
| avg.FreqBodyAccJerkMagmean  | Mean of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of frequency.               | gravity per second (g/s)           |
| avg.FreqBodyAccJerkMagstd   | Standard deviation of the magnitude of the rate of change of linear body acceleration (no axis) for the domain of frequency. | gravity per second (g/s)           |
| avg.FreqBodyGyroMagmean     | Mean of the magnitude of the angular velocity (no axis) for the domain of frequency.                                         | radians per second (r/s)           |
| avg.FreqBodyGyroMagstd      | Standard deviation of the magnitude of the angular velocity (no axis) for the domain of frequency.                           | radians per second (r/s)           |
| avg.FreqBodyGyroJerkMagmean | Mean of the magnitude of the rate of change of angular velocity (no axis) for the domain of frequency.                       | radians per second squared (r/s^2) |
| avg.FreqBodyGyroJerkMagstd  | Standard deviation of the magnitude of the rate of change of angular velocity (no axis) for the domain of frequency.         | radians per second squared (r/s^2) |

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
