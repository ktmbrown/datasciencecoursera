Human Activity Recognition Using Smartphones: Codebook
================
Katie M Brown
February 4, 2019

Tidy Data
---------

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

In addition to the original data (which was merged together in one tidy dataset) an independent dataset was created using a subset of the features provided in the orginal dataset.

For each record in this independent dataset, the following has been provided:

| ColumnName           | Description                                                                           | Class          | Contents                                                                       |
|:---------------------|:--------------------------------------------------------------------------------------|:---------------|:-------------------------------------------------------------------------------|
| Subject              | Value that identifies the volunteer                                                   | Factor         | Number from 1-30                                                               |
| Activity             | Descriptive identifier that represents the activity performed by the subject          | Factor         | WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING     |
| \*see features below | 66-Feature vector that holds the average value for each feature from original dataset | Numeric Vector | Averages of the features below that are normalized and bounded within \[-1,1\] |
