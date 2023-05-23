# Create an R script to be named as run_analysis.R that does the following:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.
library(plyr)
library(dplyr)

#Download the dataset files and save it as dataset zip file to your working directory
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "dataset.zip")

#Unzip dataset file and see the list of files inside the extracted file.
unzip(zipfile="dataset.zip")
path = file.path("./UCI HAR Dataset")
data = list.files(path, recursive=TRUE)

#Create the data set of the training and test
#First, read the features data
feature_list = read.table(file.path(path, "features.txt"),header = FALSE)
# Assign second column of "feature_list" to "feature_vector"
feature_vector <- feature_list[,"V2"]

#Then, reading the training tables - xtrain, ytrain and subject train
xtrain = read.table(file.path(path, "train", "X_train.txt"),header = FALSE,col.names=feature_vector,check.names = FALSE)
ytrain = read.table(file.path(path, "train", "y_train.txt"),header = FALSE,col.names = "Activity")
subjecttrain = read.table(file.path(path, "train", "subject_train.txt"),col.names = "Subject",header = FALSE)
#Then, read the testing tables
xtest = read.table(file.path(path, "test", "X_test.txt"),header = FALSE,col.names=feature_vector,check.names = FALSE)
ytest = read.table(file.path(path, "test", "y_test.txt"),header = FALSE,col.names = "Activity")
subjecttest = read.table(file.path(path, "test", "subject_test.txt"),header = FALSE,col.names = "Subject")


#Combine the data
# Combine xtrain and xtest to one df
df <- rbind.data.frame(xtrain,xtest)
# Combine ytrain and ytest to "Activity" column
activity <- rbind.data.frame(ytrain,ytest)
# Combine subjecttrain and subjecttest to "Subject" column
subject <- rbind.data.frame(subjecttrain,subjecttest)

# Select only column names with means and standard deviations.
df1 <- df[ , grep("mean\\(\\)", names(df), perl = TRUE ) ]
df2 <- df[ , grep("std\\(\\)", names(df), perl = TRUE ) ]

# Combine the two dataframes, subject and activity vectors and place the columns in alphabetical order.
final_df <- cbind(df1,df2)
final_df <- final_df[,order(names(final_df))]
final_df <- cbind(activity,subject,final_df)

# Correct the typo for columns with "BodyBody" in their name.
names(final_df) <- gsub("BodyBody", "Body", names(final_df), fixed = TRUE)

# Uncode the activities in the "Activities" column
final_df$Activity[which(final_df$Activity == 1)] ="WALKING"
final_df$Activity[which(final_df$Activity == 2)] ="WALKING_UPSTAIRS"
final_df$Activity[which(final_df$Activity == 3)] ="WALKING_DOWNSTAIRS"
final_df$Activity[which(final_df$Activity == 4)] ="SITTING"
final_df$Activity[which(final_df$Activity == 5)] ="STANDING"
final_df$Activity[which(final_df$Activity == 6)] ="LAYING"
# Now, we generate the script to create a tidy dataset

# Sort final_df by Activity and Subject
final_df <- final_df[order(final_df$Subject, final_df$Activity),]

# Calculate mean values for each of the columns
means <- suppressWarnings(aggregate(final_df,by = list(final_df$Activity,final_df$Subject),function (x) mean(as.numeric(as.character(x)))))

# Clean up columns in the "means" dataframe.
means <- subset(means, select=-c(Activity,Subject))
names(means)[names(means)=="Group.1"] <- "Activity"
names(means)[names(means)=="Group.2"] <- "Subject"

# Create the tidy data by placing "Subject" column at beginning of dataframe.
means <- means %>% select(Subject, everything())
write.table(means,file="tidydata.txt",row.name=FALSE)
