# Code Book #
### Getting and Cleaning Data ###

Copyright (c) 2016 Al Warren. All rights reserved.

Author: Al Warren

## General ##

This document describes the data used in the course project for the Coursera course *Getting and Cleaning Data*.

The data used in the assignment originated from the *Human Activity Recognition Using Smartphones Dataset* (HAR) which can be found at the following link:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

See README.txt for additional information.

## Project Input Data ##

The project uses a subset of the data as outlined in the project requirements:

> "*Extract only the measurements on the mean and standard deviation for each measurement.*"

That data was read from the following files:

- ./activity_labels.txt - the type of activity performed. 
- ./features.txt - sensor data column names.
- ./test/subject_test.txt - IDs of the subjects that performed the activities during testing.
- ./test/X_test.txt - sensor measurements during testing. 
- ./test/y_test.txt - activity IDs during testing.
- ./train/subject_train.txt - IDs of the subjects that performed the activities during training.
- ./train/X_train.txt - sensor measurements during training.
- ./train/y_train.txt - activity IDs during training.

**Input column names**

Please see *features_info.txt* from the zip file for information on the original data set columns.

## Project Output Data ##

The project outputs data as defined in the project requirement:

> "*Create a second, independent tidy data set with the average of each variable for each activity and each subject.*"

**Data Set Columns**

| Name | Data Type | Description |
| ---- | --------- | ----------- |
| activity | character |The type of actitivty performed |
| subject | numeric | The ID of the subject performing the activity |
| tBodyAcc.mean.X | numeric | mean of mean, time domain, body, acceleration, X axis |
| tBodyAcc.mean.Y | numeric | mean of mean, time domain, body, acceleration, Y axis |
| tBodyAcc.mean.Z | numeric | mean of mean, time domain, body, acceleration, Z axis |
| tBodyAcc.std.X | numeric | mean of standard deviation, time domain, body, acceleration, X axis |
| tBodyAcc.std.Y | numeric | mean of standard deviation, time domain, body, acceleration, Y axis |
| tBodyAcc.std.Z | numeric | mean of standard deviation, time domain, body, acceleration, Z axis |
| tBodyAccJerk.mean.X | numeric | mean of mean, time domain, body, jerk, X axis |
| tBodyAccJerk.mean.Y | numeric | mean of mean, time domain, body, jerk, Y axis |
| tBodyAccJerk.mean.Z | numeric | mean of mean, time domain, body, jerk, Z axis |
| tBodyAccJerk.std.X | numeric | mean of standard deviation, time domain, body, jerk, X axis | 
| tBodyAccJerk.std.Y | numeric | mean of standard deviation, time domain, body, jerk, Y axis | 
| tBodyAccJerk.std.Z | numeric | mean of standard deviation, time domain, body, jerk, Z axis |
| tBodyGyro.mean.X | numeric | mean of mean, time domain, body, gyro, X axis |
| tBodyGyro.mean.Y | numeric | mean of mean, time domain, body, gyro, Y axis |
| tBodyGyro.mean.Z | numeric | mean of mean, time domain, body, gyro, Z axis |
| tBodyGyro.std.X | numeric | mean of standard deviation, time domain, body, gyro, X axis | 
| tBodyGyro.std.Y | numeric | mean of standard deviation, time domain, body, gyro, Y axis | 
| tBodyGyro.std.Z | numeric | mean of standard deviation, time domain, body, gyro, Z axis | 
| tBodyGyroJerk.mean.X | numeric | mean of mean, time domain, body, gyro, jerk, X axis |
| tBodyGyroJerk.mean.Y | numeric | mean of mean, time domain, body, gyro, jerk, Y axis |
| tBodyGyroJerk.mean.Z | numeric | mean of mean, time domain, body, gyro, jerk, Z axis |
| tBodyGyroJerk.std.X | numeric | mean of standard deviation, time domain, body, gyro, jerk, X axis |
| tBodyGyroJerk.std.Y | numeric | mean of standard deviation, time domain, body, gyro, jerk, Y axis |
| tBodyGyroJerk.std.Z | numeric | mean of standard deviation, time domain, body, gyro, jerk, Z axis |
| tBodyAccMag.mean | numeric | mean of mean, time domain, body, acceleration magnitude |
| tBodyAccMag.std | numeric | mean of standard deviation, time domain, body, acceleration magnitude |
| tGravityAccMag.mean | numeric | mean of mean, time domain, gravity, acceleration magnitude |
| tGravityAccMag.std | numeric | mean of standard deviation, time domain, gravity, acceleration magnitude |
| tBodyAccJerkMag.mean | numeric | mean of mean, time domain, body, jerk acceleration magnitude |
| tBodyAccJerkMag.std | numeric | mean of standard deviation, time domain, body, jerk acceleration magnitude |
| tBodyGyroMag.mean | numeric | mean of mean, time domain, body, gyro, magnitude |
| tBodyGyroMag.std | numeric | mean of standard deviation, time domain, body, gyro, magnitude |
| tBodyGyroJerkMag.mean | numeric | mean of mean, time domain, body, gyro, jerk magnitude |
| tBodyGyroJerkMag.std | numeric | mean of standard deviation, time domain, body, gyro, jerk magnitude |
| fBodyAcc.mean.X | numeric | mean of mean, fast fourier transform, body, acceleration, X axis |
| fBodyAcc.mean.Y | numeric | mean of mean, fast fourier transform, body, acceleration, Y axis |
| fBodyAcc.mean.Z | numeric | mean of mean, fast fourier transform, body, acceleration, Z axis |
| fBodyAcc.std.X | numeric | mean of standard deviation, fast fourier transform, body, acceleration, X axis |
| fBodyAcc.std.Y | numeric | mean of standard deviation, fast fourier transform, body, acceleration, Y axis |
| fBodyAcc.std.Z | numeric | mean of standard deviation, fast fourier transform, body, acceleration, Z axis |
| fBodyAccJerk.mean.X | numeric | mean of mean, fast fourier transform, body, jerk acceleration, X axis |
| fBodyAccJerk.mean.Y | numeric | mean of mean, fast fourier transform, body, jerk acceleration, Y axis |
| fBodyAccJerk.mean.Z | numeric | mean of mean, fast fourier transform, body, jerk acceleration, Z axis |
| fBodyAccJerk.std.X | numeric | mean of standard deviation, fast fourier transform, body, jerk acceleration, X axis |
| fBodyAccJerk.std.Y | numeric | mean of standard deviation, fast fourier transform, body, jerk acceleration, Y axis |
| fBodyAccJerk.std.Z | numeric | mean of standard deviation, fast fourier transform, body, jerk acceleration, Z axis |
| fBodyGyro.mean.X | numeric | mean of mean, fast fourier transform, gyro, X axis |
| fBodyGyro.mean.Y | numeric | mean of mean, fast fourier transform, gyro, Y axis |
| fBodyGyro.mean.Z | numeric | mean of mean, fast fourier transform, gyro, Z axis |
| fBodyGyro.std.X | numeric | mean of standard deviation, fast fourier transform, gyro, X axis |
| fBodyGyro.std.Y | numeric | mean of standard deviation, fast fourier transform, gyro, Y axis |
| fBodyGyro.std.Z | numeric | mean of standard deviation, fast fourier transform, gyro, Z axis |
| fBodyAccMag.mean | numeric | mean of mean, fast fourier transform, body, acceleration magnitude |
 fBodyAccMag.std | numeric | mean of standard deviation, fast fourier transform, body, acceleration magnitude |
| fBodyAccJerkMag.mean | numeric | mean of mean, fast fourier transform, body, acceleration jerk magnitude |
| fBodyAccJerMag.std | numeric | mean of standard deviation, fast fourier transform, body, acceleration jerk magnitude |
| fBodyBodyGyroMag.mean | numeric | mean of mean, fast fourier transform, body, body gyro magnitude|
| fBodyBodyGyroMag.std | numeric | mean of standard deviation, fast fourier transform, body, body gyro magnitude|
| fBodyBodyGyroJerkMag.mean | numeric | mean of mean, fast fourier transform, body, body gyro jerk magnitude|
| fBodyBodyGyroJerkMag.std | numeric | mean of standard deviation, fast fourier transform, body, body gyro jerk magnitude|
