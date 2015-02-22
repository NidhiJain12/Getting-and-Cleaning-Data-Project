
# Read test Data

#1 - Load x_test (test Set) into a array / dataframe
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, stringsAsFactor = FALSE)
colnames(x_test) = features[,2]

#2 - Load y_test (testing Labels) into a array / dataframe
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE, stringsAsFactor = FALSE)
colnames(y_test) = c("activityId")

#3 - Load subject_test (Subject Identifier for each sample/record) into a array / dataframe
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, stringsAsFactor = FALSE)
colnames(subject_test) = c("subjectId")

#Per assignment questions, we will only be keeping variables that are either a mean or std. The files in the Inertial Signals 
# folder (ex-total_acc_x_test, body_gyro_x_test and so on) is not a mean/std. Therefore, we will not be reading these files.
# Refer to the TA blog for explanation ("https://class.coursera.org/getdata-011/forum/thread?thread_id=69")

#Merge the data together for all the data frames extracted for test data (x_test, y_test and subject_test)
# We have merged - subject IDs, Activity IDs and feature data for every record (row) in the datafiles
test_merge_data <- cbind(subject_test, y_test, x_test)
