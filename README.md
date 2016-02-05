# Getting and Cleaning Data Course Project #

Copyright (c) 2016 Al Warren. All rights reserved.

Author: Al Warren

## General ##

This program is a solution to the course project assignment from the Coursera course *Getting and Cleaning Data*. It takes as it's input data from a number of text files* and prduces a text file that is a "*Tidy*" data set containing the calculated means of a subset of the original data. During execution, summary information containing the number of objects created and their memory size are printed to the console.

\* See *Codebook.md* for additional details

## Project Definition ##

There were five requirements for the assignment:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The actual execution order of the requirements are optimized for performance.

## Runtime Requirements

**Required Software**

1. The run_analysis.R script requires the R language and environment.
2. The R software can be found at [http://www.r-project.org/](http://www.r-project.org/ "http://www.r-project.org/").
3. The run_analysys.R script is known to work with R version 3.2.2.

**Required R Packages**

1. data.table
2. gdata

**Required Data**

1. Download the data set from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Extract the zip file so that the "*UCI HAR Dataset*" folder is in your working directory along with run_analysis.R.  

## Execution ##

Use the R source() function to run the script - `source("run_analysis.R")`

## Program Design ##

**General Design Considerations**

The script fulfills all the requirements of the assignment. The actual execution steps are done in a way that takes advantage of the speed and efficiency of the data.tables package.

Because the sensor data consumes a large amount of memory, instead of loading all sensor data at once and then subsetting and merging with the other columns, we begin by building the data set with the smaller data first and then do the larger merge last.

The following steps detail that process.

**Load the subjects file**

The files *subject\_test.txt* and *subject_train.txt* contain the IDs of subjects that the sensor data was collected from. There is one entry for each row in the sensor data.

This step is where we start building the final data set. Subject IDs will become the first column.

**Load activities**

The *activity\_labels.txt* file contains activity text labels and their IDs.

The files *test/y\_test.txt* and *train/y\_train.txt* contain the IDs of activities performed by the subjects. There is one entry for each row in the sensor data. IDs are replaced by the text labels from *activity_labels.txt*.

The activities are then merged into the final data set as the second column.

**Create subset indices**

The *features.txt* file corresponds to column names. We will use a subset of that file to name our columns.

Because we need to subset the sensor data, we load  the features file first and then use a regular expression to find feature names that contain the character strings "*mean()*" and "*std()*". We use the row indexes for that result as column indices that will be used for subsequent subset operations.

**Clean up column names**

Before cleaning up the column names, we take a subset of only those columns we need using the column indices we created earlier. Then we remove the parenthesis and replace all dashes with periods.

**Load and merge sensor data**

The files *test/X\_test.txt* and *train/X\_train.txt* contain the actual sensor data. As each file is read, a subset of only the required columns is taken using the column indices from a previous step.

The sensor data is merged into a single table and assigned column names from a previous step. It is then merged with the final data set.

**Create the tidy data and write to disk**

The full data set is used with *lapply()* to create the mean values required by the assignment. That data is then written to a file named *tidydata.txt*. 

## Credits ##

The data used in the assignment originated from the *Human Activity Recognition Using Smartphones Dataset* which can be found at the following link:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
