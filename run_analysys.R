# Copyright (c) 2016 Al Warren. All rights reserved.
# Author: Al Warren
#
# This program is a solution to the course project assignment
# from the Coursera course Getting and Cleaning Data.
# It takes as it's input data from a number text files and produces
# a text file that is a "Tidy" data set containing the calculated
# means of a subset of the original data.
# During execution, summary information containing the number of
# objects created and their memory size are printed to the console.
#
# There were five requirements for the assignment labeled in this
# script as Assignment Step 1 through Assignment Step 5. The actual 
# execution order of the requirements are optimized for performance.
#
# The following packages are required: data.table and gdata.
#
# See README.md and Codebook.md for additional details
#
# Previous Github commit - 163cd0b09d3ea26064f0fb51581f3961f2150632

LogObjectSize <- function(obj, done=TRUE) {
  # Print out the number of rows and memory size of an object
  size <- humanReadable(object.size(obj))
  paste("done\n", "Rows:", nrow(obj), "Size:", size)
}

cat("\nLoading required libraries... ")
flush.console()

# Load the required packages

suppressMessages(require(data.table))
suppressMessages(require(gdata))

cat("done\n\n")

# Subjects are the individuals performing the activities

cat("Loading subjects values... ")

# We're going to start building the full data set here
fulldata <- fread("UCI HAR Dataset/test/subject_test.txt")
fulldata <- rbind(fulldata, fread("UCI HAR Dataset/train/subject_train.txt"))
setnames(fulldata, c("subject"))

cat(LogObjectSize(fulldata), "\n\n")

# Activity labels are the activity text values

cat("Loading activity labels... ")

# Create descriptive names for use in Step 3
activities <- fread("UCI HAR Dataset/activity_labels.txt")
setnames(activities, c("id", "name"))
setkey(activities, id)

cat(LogObjectSize(activities), "\n\n")

# Y values are the activity numeric IDs

cat("Loading activity values... ")

# Load and combine activities
y.data <- read.table("UCI HAR Dataset/test/y_test.txt")
y.data <- data.table(rbind(y.data, read.table("UCI HAR Dataset/train/y_train.txt")))
setnames(y.data, c("activity"))

# Assignment Step 3
# Change activity IDs to descriptive names
y.data <- y.data[,.(activity=activities$name[activity])]

cat(LogObjectSize(y.data), "\n\n")

cat("Merging subjects with activities... ")

# Merge Subject IDs and descriptive activity labels to full data set
fulldata <- cbind(fulldata, y.data)

cat(LogObjectSize(fulldata), "\n\n")

# Features are the main data set column names

cat("Loading features... ")

# Load features first to get the column indices for subsetting
features <- fread("UCI HAR Dataset/features.txt", select=(2), stringsAsFactors=FALSE)
setnames(features, c("name"))

# Get column indices for subsetting combined data
column.indices <- grep("-(mean|std)\\(\\)", features$name)

# Subset column names to just mean/std
features <- copy(features[column.indices ,])

cat(LogObjectSize(features), "\n\n")

# Clean up the column names
features[, name:=gsub("()", "", name, fixed = T)]
features[, name:=gsub("-", ".", name, fixed = T)]

cat("Loading test data... ")
flush.console()

# Get column classes to speed loading
x <- read.table("UCI HAR Dataset/test/X_test.txt", nrows=5)
x.classes <- lapply(x, class)

# Assignment Step 2
# Use column.indices to select only the columns we need
x.test  <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses=x.classes)[,column.indices]

cat("done\n\n")

cat("Loading training data... ")
flush.console()

# Assignment Step 2
# Use column.indices to select only the columns we need
x.train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses=x.classes)[,column.indices]

cat("done\n\n")

cat("Combining training and test data... ")
flush.console()

# Assignment Step 1
# Combine test and train data
x.data <- data.table(rbind(x.train, x.test))

# Assignment Step 4
setnames(x.data, unlist(features$name))

# Merge X values with the full data set
fulldata <- cbind(fulldata, x.data)

# Set keys to use with lapply
setkey(fulldata, activity, subject)
rm(x.data, x.train, x.test) # try to free some memory

cat(LogObjectSize(fulldata), "\n\n")

cat("Creating tidy data with averages... ")
flush.console()

# Assignment Step 5
# Create the tidy data set with averages
tidydata <- fulldata[, lapply(.SD, mean), by = .(activity, subject)]

cat(LogObjectSize(tidydata), "\n\n")

cat("Writing tidy data to file... ")
flush.console()

# Write the tidy data set to file
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)

cat(sprintf("done\nWrote %s to tidydata.txt", 
            humanReadable(file.info("tidydata.txt")$size)))

cat("\n\nAll processing complete\n\n")
