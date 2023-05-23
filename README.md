# Getting-Cleaning-Data-Project
The purpose of this repo is to share a project that collects, works with, and cleans a data set. The goal is to prepare tidy data that can be used for later analysis.

*The created R script in this repo named "run_analysis.R" helps in fulfilling the clean up for the Samsung data.
 The R script do the following tasks to the source raw data:

1.1 Reading files
  1.1.1 Reading feature vector
  1.1.2 Reading trainings tables
  1.1.3 Reading testing tables
  1.1.4 Reading activity labels
1.2 Assigning column names
1.3 Merging all data in one set

*Extracting only the measurements on the mean and standard deviation for each measurement

2.1 Reading column names
2.2 Create vector for defining ID, mean and standard deviation
2.3 Making nessesary subset from setAllInOne

*Using descriptive activity names to name the activities in the data set
Appropriately labeling the data set with descriptive variable names
Creating a second, independent tidy data set with the average of each variable for each activity and each subject

5.1 Making second tidy data set
5.2 Writing second tidy data set in txt file
