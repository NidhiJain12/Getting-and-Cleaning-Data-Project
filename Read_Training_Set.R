

# Read train Data

#1 - Load x_train (train Set) into a array / dataframe
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, stringsAsFactor = FALSE)
colnames(x_train) = features[,2]

#2 - Load y_train (training Labels) into a array / dataframe
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE, stringsAsFactor = FALSE)
colnames(y_train) = c("activityId")

#3 - Load subject_train (Subject Identifier for each sample/record) into a array / dataframe
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, stringsAsFactor = FALSE)
colnames(subject_train) = c("subjectId")

#Per assignment questions, we will only be keeping variables that are either a mean or std. The files in the Inertial Signals 
# folder (ex-total_acc_x_train, body_gyro_x_train and so on) is not a mean/std. Therefore, we will not be reading these files.
# Refer to the TA blog for explanation ("https://class.coursera.org/getdata-011/forum/thread?thread_id=69")

#Merge the data together for all the data frames extracted for train data (x_train, y_train and subject_train)
# We have merged - subject IDs, Activity IDs and feature data for every record (row) in the datafiles
train_merge_data <- cbind(subject_train, y_train, x_train)
