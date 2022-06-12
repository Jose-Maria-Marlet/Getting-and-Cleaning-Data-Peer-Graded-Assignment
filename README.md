# Getting-and-Cleaning-Data-Peer-Graded-Assignment
This repositoty contains the files for the peer graded assignment.
1. Basics:
Getting and Cleaning Data Course Project
menos 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
You should create one R script called run_analysis.R that does the following. 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2. R script:
The file run_analysis.R perform the tasks demanded by the peer assessment work. It is divided in six parts, as follow:
Part 1 - Downloading the data
Source of data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Part 2 - Reading the files
The files are divided in 2 groups: training tables and testing tables
# The features from the variables are presented in this file, like mean, standard deviation, max and min values.
# Activities types are presented in this file, like walking, walking upstairs and downstairs, sitting, standing and laying.
Part 3 - Assigning column names
# The column names for the independent variable "x" come from features file.
# The column names for the dependent variable "y" come from activity file.
Part 4 - Merging the data in one data set
# The training and testing groups of files are merged in a unique file, containing all the available information.
# mergedFile has 10299 rows and 563 columns.
Part 5 - Extracting the values of mean and standard deviation for the measurements
# This new vector has 10299 rows and 82 columns. The original file have 563 columns.
Part 6 - Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
# The number of rows were reduced from 10299 rows to 9000 rows due to maximum memory capacity available for the .txt file.
# This tidy data set have 48 columns.

