# Basic Settings
url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url, 'Dataset.zip')
unzip('Dataset.zip')
setwd("./UCI HAR Dataset")

# Import library
library(data.table)
library(reshape2)

# Read Data and Combine them into a complete dataset
# (We'll mainly focus on using data.table package to boost the speed)
subject_test <- fread("test/subject_test.txt")
subject_train <- fread("train/subject_train.txt")
subject <- rbind(subject_test, subject_train)
setnames(subject, "V1", "subject")
rm(subject_test, subject_train)

activity_train <- fread("train/y_train.txt")
activity_test <- fread("test/y_test.txt")
activity <- rbind(activity_test, activity_train)
setnames(activity, "V1", "activityNum")
rm(activity_test, activity_train)

test <- read.table("test/x_test.txt")
test <- data.table(test)
train <- read.table("train/x_train.txt")
train <- data.table(train)
main_data <- rbind(test, train)
rm(test, train)

data <- cbind(cbind(subject, activity), main_data)
rm(main_data)
setkey(data, subject, activityNum)

# Use descriptive activity names to rename elements in the data set
labels <- fread("activity_labels.txt")
setnames(labels, names(labels), c("activityNum", "activitycode"))
data <- merge(labels, data, by="activityNum", all.x=TRUE)
setkey(data, subject, activitycode)
rm(labels)

# Obtain standard deviation values from each line in the training dataset
features <- fread("features.txt")
setnames(features, names(features), c("featureNum", "featureName"))
features <- features[grepl("mean\\(\\)|std\\(\\)", featureName)]
features$featureCode <- features[, paste0("V", featureNum)]
data <- data[, c(key(data), features$featureCode), with=FALSE]
setnames(data, names(data), c(key(data), features$featureName))

# Aggregrate data and generate the tidy_data
tidy_data <- aggregate(data, by=list(data$subject, data$activity), FUN=mean)
tidy_data$activity <- NULL
tidy_data$subject <- NULL
names(tidy_data)[names(tidy_data) == 'Group.1'] <- 'subject'
names(tidy_data)[names(tidy_data) == 'Group.2'] <- 'activity'