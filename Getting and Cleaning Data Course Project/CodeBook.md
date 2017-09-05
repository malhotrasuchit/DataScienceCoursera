---
title: "CodeBook"
author: "suchit malhotra"
date: "September 5, 2017"
output: html_document
---

# CodeBook
This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The data source

- Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data
The dataset includes the following files:

-'README.txt'
-'features_info.txt': Shows information about the variables used on the feature vector.
-'features.txt': List of all features.
-'activity_labels.txt': Links the class labels with their activity name.
-'train/X_train.txt': Training set.
-'train/y_train.txt': Training labels.
-'test/X_test.txt': Test set.
-'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
-'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
-'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
-'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
-'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Transformation details
There are 5 parts:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names.
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How  run_analysis.R  implements the above steps:
-Require  reshapre2  and  data.table  librareis.
-Load both test and train data
-Load the features and activity labels.
-Extract the mean and standard deviation column names and data.
-Process the data. There are two parts processing test and train data respectively.
-Merge data set.

## tidy_data data set
The tidy data set is a text file containing space separated values. The first row of the data set is the identifiers of the variables while the other rows are the values of the variables. The varibale forming the tidy_data set are:

1.	subject : subject identifier, integer, ranges from 1 to 30.
2.	Activity_Label : activity identifier, string with 6 possible values (WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING) “tBodyAcc-mean()-X"
3.	"tBodyAcc-mean()-Y"
4.	“tBodyAcc-mean()-Z"
5.	"tBodyAcc-std()-X"
6.	“tBodyAcc-std()-Y"
7.	"tBodyAcc-std()-Z"
8.	“tGravityAcc-mean()-X"
9.	"tGravityAcc-mean()-Y"
10.	"tGravityAcc-mean()-Z"
11.	"tGravityAcc-std()-X"
12.	"tGravityAcc-std()-Y"
13.	"tGravityAcc-std()-Z"
14.	"tBodyAccJerk-mean()-X"
15.	"tBodyAccJerk-mean()-Y"
16.	"tBodyAccJerk-mean()-Z"
17.	"tBodyAccJerk-std()-X"
18.	"tBodyAccJerk-std()-Y"
19.	"tBodyAccJerk-std()-Z"
20.	"tBodyGyro-mean()-X"
21.	"tBodyGyro-mean()-Y"
22.	"tBodyGyro-mean()-Z"
23.	"tBodyGyro-std()-X"
24.	"tBodyGyro-std()-Y"
25.	"tBodyGyro-std()-Z"
26.	"tBodyGyroJerk-mean()-X"
27.	"tBodyGyroJerk-mean()-Y"
28.	"tBodyGyroJerk-mean()-Z"
29.	"tBodyGyroJerk-std()-X"
30.	"tBodyGyroJerk-std()-Y"
31.	"tBodyGyroJerk-std()-Z"
32.	"tBodyAccMag-mean()"
33.	"tBodyAccMag-std()"
34.	"tGravityAccMag-mean()"
35.	"tGravityAccMag-std()"
36.	"tBodyAccJerkMag-mean()"
37.	"tBodyAccJerkMag-std()"
38.	"tBodyGyroMag-mean()"
39.	"tBodyGyroMag-std()"
40.	"tBodyGyroJerkMag-mean()"
41.	"tBodyGyroJerkMag-std()"
42.	"fBodyAcc-mean()-X"
43.	"fBodyAcc-mean()-Y"
44.	"fBodyAcc-mean()-Z"
45.	"fBodyAcc-std()-X"
46.	"fBodyAcc-std()-Y"
47.	"fBodyAcc-std()-Z"
48.	"fBodyAcc-meanFreq()-X"
49.	"fBodyAcc-meanFreq()-Y"
50.	"fBodyAcc-meanFreq()-Z"
51.	"fBodyAccJerk-mean()-X"
52.	"fBodyAccJerk-mean()-Y"
53.	"fBodyAccJerk-mean()-Z"
54.	"fBodyAccJerk-std()-X"
55.	"fBodyAccJerk-std()-Y"
56.	"fBodyAccJerk-std()-Z"
57.	"fBodyAccJerk-meanFreq()-X"
58.	"fBodyAccJerk-meanFreq()-Y"
59.	"fBodyAccJerk-meanFreq()-Z"
60.	"fBodyGyro-mean()-X"
61.	"fBodyGyro-mean()-Y"
62.	"fBodyGyro-mean()-Z"
63.	"fBodyGyro-std()-X"
64.	"fBodyGyro-std()-Y"
65.	"fBodyGyro-std()-Z"
66.	"fBodyGyro-meanFreq()-X"
67.	"fBodyGyro-meanFreq()-Y"
68.	"fBodyGyro-meanFreq()-Z"
69.	"fBodyAccMag-mean()"
70.	"fBodyAccMag-std()"
71.	"fBodyAccMag-meanFreq()"
72.	"fBodyBodyAccJerkMag-mean()"
73.	"fBodyBodyAccJerkMag-std()"
74.	"fBodyBodyAccJerkMag-meanFreq()"
75.	"fBodyBodyGyroMag-mean()"
76.	"fBodyBodyGyroMag-std()"
77.	"fBodyBodyGyroMag-meanFreq()"
78.	"fBodyBodyGyroJerkMag-mean()"
79.	"fBodyBodyGyroJerkMag-std()"
80.	"fBodyBodyGyroJerkMag-meanFreq()"
