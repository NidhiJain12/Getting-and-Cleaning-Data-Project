library(plyr)
library(dplyr)
library(reshape2)

#1- Load activity list from text file into a data frame
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactor=FALSE)
#adding descriptiv column names for "activity" dataset
names(activity) = c("activityId", "activityName")

#2- Load feature list from text file into a data frame
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactor = FALSE)

#3 - Load the training dataset. The following R codes loads all the relevant files for the training dataset and merge the data together
# into one data frame "train_merge_data"
source("Read_Training_Set.R")

#4 - Load the test dataset. The following R codes loads all the relevant files for the test dataset and merge the data together
# into one data frame "test_merge_data"
source("Read_Test_Set.R")

#Question 1:
#Merge the training and the test sets to create one data set.
# The merge will use a row bind to make one big dataset

merge_data <- rbind(train_merge_data, test_merge_data)

#Question 2:
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# All the measurements has names, as reflected by columnnames.
# Store all the column names for "merged dataset" into a variable
colNames <- colnames(merge_data) 

#Find the column name which contains "mean()" or "std()" in the string. 
# Assumptions: Only measurements that has full text "mean()" or "std()" in their names are included. Any other patterns for mean are
# excluded. (Such as angle(Y,gravityMean), fBodyBodyGyroMag-meanFreq(), etc are excluded)
validColNameInd <- grep("mean\\(\\)|std\\(\\)", colNames, ignore=TRUE)

#Select only valid columns. It includes all columns/measurements that reflect mean and standard deviation in addition to the
# subject ID and activity ID
#As their are some duplicate column names, I am not able to use "dplyr"- Select function as referenced below
#out_data <- select(merge_data, subjectId, activityId, validColNameInd)

out_data <- cbind(subjectId = merge_data$subjectId, activityId = merge_data$activityId, merge_data[validColNameInd])

#Question 3:
# Uses descriptive activity names to name the activities in the data set
# For this question, we will merge the two datasets "out_data" and "activity". Activity dataset
# contains descriptive names of all the activities

out_data <- merge(activity, out_data, by.x = "activityId", by.y = "activityId")

#Question 4: Appropriately labels the data set with descriptive variable names. 
# I have alread assigned descriptive column names to all the variable

#Question 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# I will use ddply function for the summary. As i am presenting data into wide-format, there are large number of columns.
# Therefore I will be using numcolwise function to calculate mean of all rows without the need for typing all columns

tidy_data <- ddply(out_data,.(subjectId,activityName), numcolwise(mean, na.rm=TRUE))

#Remove extra activityId column as we already have activityName column
tidy_data <- select(tidy_data, -activityId)
newColName = colnames(tidy_data)
newColName[3:length(newColName)] = paste(newColName[3:length(newColName)],".MEAN", sep="")
colnames(tidy_data) = newColName

#Write the output tidy dataset to a text file
write.table(tidy_data,file="tidy_data.txt", row.names=FALSE)
