Human Activity Recognition Using Smartphones: README
================
Katie M Brown
February 4, 2019

Human Activity Recognition Using Smartphones: README
----------------------------------------------------

##### A Variation on Human Activity Recognition Using Smartphones Dataset Version 1.0 (see license below)

*Disclaimer: This readme modifies and updates the original codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.*

This data set was created using the following files:

-   `README.txt`: general information about the gathering of data and the dataset itself
-   `features_info.txt`: information about the variables found in the feature vector
-   `features.txt`: a list of 561 features that links with the test/train data
-   `activity_labels.txt`: links the data in the training/testing sets with their appropriate descriptive label using a key (1-6)
-   `train/X_train.txt`: Training set
-   `train/y_train.txt`: Training labels
-   `test/X_test.txt`: Test set
-   `test/y_test.txt`: Test labels

Analysis Summary
----------------

The `run_analysis.R` script is composed of six (6) major phases with the following functionality:

#### Phase 1

Phase 1 is designed to allow for reproducibility by downloading a file from (`activity.zip`) a given URL ([data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). As this file is a zip file, Phase 1 also uses the **unzip()** function to unzip the file.

#### Phase 2

Phase 2 is designed specifically to read in the Activity Labels and the Features files.

The Activity Labels file is a key that shows what activity is associated with what value. See below:

    ##   ActivityNum           Activity
    ## 1           1            WALKING
    ## 2           2   WALKING_UPSTAIRS
    ## 3           3 WALKING_DOWNSTAIRS
    ## 4           4            SITTING
    ## 5           5           STANDING
    ## 6           6             LAYING

The Features file is a list of 561 features. The in depth explanation of these features can be found in the `features_info.txt` file and is also summarized in the supplemental information at the end of this codebook. You can see the head(Features) here:

    ##   FeatureNum           Feature
    ## 1          1 tBodyAcc-mean()-X
    ## 2          2 tBodyAcc-mean()-Y
    ## 3          3 tBodyAcc-mean()-Z
    ## 4          4  tBodyAcc-std()-X
    ## 5          5  tBodyAcc-std()-Y
    ## 6          6  tBodyAcc-std()-Z

#### Phase 3

Phase 3 is segmented into 2 parts, 3a and 3b that read in testing and training data, respectively. For the test data set, a file called `subject_test.txt` is included. In this file, each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. There is a file included with the training set as well called `subject_train.txt` that performs the same way. This information was read in and then cast to a factor variable. This allows us to group by subject later on in the analysis. Also for the test data set, a file called `y_test.txt` is included. This is an encoded list of numbers 1-6 that gives us information about the activity that is being done. We can decode this list using the Activity Labels file discussed above. Once this file is read in, it is cast to a factor and the levels are set using the Activity Labels information that was read in during Phase 2. A similar file called `y_train.txt` is included with that training data and it performs the same way.

Next, files called `test.txt` and `train.txt` were read in to their respective tables. Finally the subject, activity and data were combined to create a test data set and a train data set that included columns for a subject ID and descriptive Activity information. The following shows the first 5 columns and the first 5 rows of the test data. This would be similar for the train data:

    ##   Subject Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
    ## 1       2 STANDING         0.2571778       -0.02328523       -0.01465376
    ## 2       2 STANDING         0.2860267       -0.01316336       -0.11908252
    ## 3       2 STANDING         0.2754848       -0.02605042       -0.11815167
    ## 4       2 STANDING         0.2702982       -0.03261387       -0.11752018
    ## 5       2 STANDING         0.2748330       -0.02784779       -0.12952716

#### Phase 4

Phase 4 is designed to merge the test and train data set into data frame of 10299 observations and 563 variables made up of a Subject column, an Activity column and a 561-feature vector with time and frequency domain variables. The original obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data and in this step we undo that by merging the two back together. The data signifying where they came from (test vs. train) is not retained.

#### Phase 5

Phase 5 is designed to extract only the measurements on the mean and standard deviation for each measurement. This does not include meanFreq() or angle(-XYZ,gravityMean) data **by design**. This phase left us with a data frame of 10299 observations and 68 variables made up of a Subject column, an Activity column, and a 66-feature vector with time and frequency variables only for those that calculated a *mean()* or a *std()*.

#### Phase 6

Phase 6 is designed to group the tidy data set above by activity (6) and subject (30). After the data has been grouped, it is passed to the mean function and all the averages for each of the 66-feature vector are found. The resulting data frame of 180 observations (activity x subject) and 68 variables (made up of Subject, Activity and 66- feature vector) is described in the codebook **Tidy Data: Independent Data Set - Code Book**

Supplemental Information
------------------------

#### Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#### Original README file

Human Activity Recognition Using Smartphones Dataset Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features\_info.txt' for more details.

For each record it is provided:

-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-   Triaxial Angular velocity from the gyroscope.
-   A 561-feature vector with time and frequency domain variables.
-   Its activity label.
-   An identifier of the subject who carried out the experiment.

The dataset includes the following files:

-   'README.txt'

-   'features\_info.txt': Shows information about the variables used on the feature vector.

-   'features.txt': List of all features.

-   'activity\_labels.txt': Links the class labels with their activity name.

-   'train/X\_train.txt': Training set.

-   'train/y\_train.txt': Training labels.

-   'test/X\_test.txt': Test set.

-   'test/y\_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

-   'train/subject\_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

-   'train/Inertial Signals/total\_acc\_x\_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total\_acc\_x\_train.txt' and 'total\_acc\_z\_train.txt' files for the Y and Z axis.

-   'train/Inertial Signals/body\_acc\_x\_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

-   'train/Inertial Signals/body\_gyro\_x\_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Notes:

-   Features are normalized and bounded within \[-1,1\].
-   Each feature vector is a row on the text file.

For more information about this dataset contact: <activityrecognition@smartlab.ws>

License:

Use of this dataset in publications must be acknowledged by referencing the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
