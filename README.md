# Getting-Cleaning-Data-Project
The purpose of this repo is to share a project that collects, works with, and cleans a data set. The goal is to prepare tidy data that can be used for later analysis.

The created R script in this repo named run_analysis.R helps in fulfilling the clean up for the Samsung data.
The R script do the following tasks to the source raw data:

1. Merges and combined the training. the test and subject sets to create one data set.
2. After there is one combined data, it extracts only the measurements on the mean and standard deviation for each measurement using grep.
3. It also uses descriptive activity names to name the activities in the data set such as Subject, Activities pertaining to the features list (Walking,Walking_upstairs,Walking_downstairs, sitting, standing and laying)
4. Appropriately labels the data set with descriptive variable names and also order and arrange it by ascending subject's and activities' columns.
5. Lastly, the cleaned up data will be exported as one independent tidy data set with the average of each variable for each activity and each subject named as tidydata.txt (as text file).
