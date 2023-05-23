# Getting-Cleaning-Data-Project
The purpose of this repo is to share a project that collects, works with, and cleans a data set. The goal is to prepare tidy data that can be used for later analysis.

Getting and Cleaning Data Course Project less The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below
2) a link to a Github repository with your script for performing the analysis
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

*The created R script in this repo named "run_analysis.R" helps in fulfilling the clean up for the Samsung data.
 The R script do the following tasks to the source raw data:

1) Reading files
a. Reading feature vector
b. Reading trainings tables
c. Reading testing tables
d. Reading activity labels
e. Assigning column names
f. Merging all data in one set

*Extracting only the measurements on the mean and standard deviation for each measurement

2) Reading column names
a. Create vector for defining ID, mean and standard deviation
b. Making nessesary subset from setAllInOne

*Using descriptive activity names to name the activities in the data set
Appropriately labeling the data set with descriptive variable names
Creating a second, independent tidy data set with the average of each variable for each activity and each subject

3) Making second tidy data set
a. Writing second tidy data set in txt file
