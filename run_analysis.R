# Libraries used

library(data.table)
library(dplyr)

# Part 1 - Downloading the data
# Source of data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 1.1 - Verifying if directory "Data" exists

if(!file.exists("./Data")) {
  dir.create("./Data")
}

# 1.2 - Downloading the file. Note that the file is zipped.

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/Dataset.zip")

# 1.3 - Unzipping the Dataset file

unzip(zipfile = "F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/Dataset.zip", exdir = "F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data")

# Part 2 - Reading the files
# The files are divided in 2 groups: training tables and testing tables

# 2.1 - Training tables

x_train <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/train/subject_train.txt")

# 2.2 - Testing tables

x_test <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/test/subject_test.txt")

# 2.3 - Feature file
# The features from the variables are presented in this file, like mean, standard deviation, max and min values.

features <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/features.txt")

# 2.4 - Activity labels
# Activities types are presented in this file, like walking, walking upstairs and downstairs, sitting, standing and laying.

activityLabels <- read.table("F:/Desktop/Coursera - Ciência de Dados/Johns Hopkins/Data/UCI HAR Dataset/activity_labels.txt")

# Part 3 - Assigning column names
# The column names for the independent variable "x" come from features file.
# The column names for the dependent variable "y" come from activity file.

# 3.1 - Training files

colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

# 3.2 - Testing files

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId', 'activityType')

# Part 4 - Merging the data in one data set
# The training and testing groups of files are merged in a unique file, containing all the available information.
# mergedFile has 10299 rows and 563 columns.

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
mergedFile <- rbind(mrg_train, mrg_test)
dim(mergedFile)

# Part 5 - Extracting the values of mean and standard deviation for the measurements

colNames <- colnames(mergedFile)

# 5.1 - The means and standard deviations are stored in a new vector
# This new vector has 10299 rows and 82 columns

meanAndStd <-  (grepl("activityId", colNames) |
                grepl("subjectId", colNames) |
                grepl("mean..", colNames) |
                grepl("std..", colNames)
                )

setMeanAndStd <- mergedFile[ , meanAndStd == TRUE]

setWithActivityNames <- merge(setMeanAndStd, activityLabels, 
                              by = "activityId", 
                              all.x = TRUE)

dim(setWithActivityNames)

# Part 6 - Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

# 6.1 - Creating a second tidy data set
# The number of rows were reduced from 10299 rows to 9000 rows due to maximum memory capacity available for the .txt file.

tidyData <- setWithActivityNames[1:9000, ] %>% select(subjectId, activityId, contains("mean"))

# 6.2 - Writing the 2nd. tidy file in .txt format.

write.table(tidyData, "tidyData.txt", row.names = FALSE)


