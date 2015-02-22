---
title: "CodeBook - Course Project for Getting and Cleaning Data (Coursera)"
output: html_document
---

1.RAW Data from UCI Machine Learning Repository
---
> **Description:**

This project uses the raw dataset of Human Activity Recognition using Smartphone. The Human Activity Recognition database is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The full description of the dataset can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

> **Data Set Information:**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

> **Attribute Information:**

For each record in the dataset it is provided: 

* **Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration**
  
    
        +  Training Set
    
       Raw File                                     | units | type/length       | Description
       ---------------------------------------------|-------|-------------------|----------------
       train/Inertial Signals/total_acc_x_train.txt | 'g'   | 128 element vector|Total Acceleration - X Axis
       train/Inertial Signals/total_acc_y_train.txt | 'g'   | 128 element vector|Total Acceleration - Y Axis
       train/Inertial Signals/total_acc_z_train.txt | 'g'   | 128 element vector|Total Acceleration - Z Axis
       train/Inertial Signals/body_acc_x_train.txt | 'g'   | 128 element vector|Body Acceleration - X Axis
       train/Inertial Signals/body_acc_y_train.txt | 'g'   | 128 element vector|Body Acceleration - Y Axis
       train/Inertial Signals/body_acc_z_train.txt | 'g'   | 128 element vector|Body Acceleration - Z Axis
      
        +  Test Set
    
       Raw File                                     | units | type/length       | Description
       ---------------------------------------------|-------|-------------------|----------------
       test/Inertial Signals/total_acc_x_test.txt | 'g'   | 128 element vector|Total Acceleration - X Axis
       test/Inertial Signals/total_acc_y_test.txt | 'g'   | 128 element vector|Total Acceleration - Y Axis
       test/Inertial Signals/total_acc_z_test.txt | 'g'   | 128 element vector|Total Acceleration - Z Axis
       test/Inertial Signals/body_acc_x_test.txt | 'g'   | 128 element vector|Body Acceleration - X Axis
       test/Inertial Signals/body_acc_y_test.txt | 'g'   | 128 element vector|Body Acceleration - Y Axis
       test/Inertial Signals/body_acc_z_test.txt | 'g'   | 128 element vector|Body Acceleration - Z Axis


* **Triaxial Angular velocity from the gyroscope** 

        + Training Dataset
       
       Raw File                                     | units | type/length       | Description
       ---------------------------------------------|-------|-------------------|----------------
       train/Inertial Signals/body_gyro_x_train.txt |radians/second| 128 element vector|Angular Velocity - X Axis
       train/Inertial Signals/body_gyro_y_train.txt |radians/second| 128 element vector|Angular Velocity  - Y Axis
       train/Inertial Signals/body_gyro_z_train.txt |radians/second| 128 element vector|Angular Velocity  - Z Axis
       
         + Test Dataset
       
       Raw File                                     | units | type/length       | Description
       ---------------------------------------------|-------|-------------------|----------------
      test/Inertial Signals/body_gyro_x_test.txt | radians/second| 128 element vector|Angular Velocity - X Axis
      test/Inertial Signals/body_gyro_y_test.txt |radians/second| 128 element vector|Angular Velocity  - Y Axis
      test/Inertial Signals/body_gyro_z_test.txt |radians/second| 128 element vector|Angular Velocity  - Z Axis


* **A 561-feature vector with time and frequency domain variables**

        +  Training Dataset
       
       Raw File                                     | units | type/length       | Description
       ---------------------------------------------|-------|-------------------|----------------
       train/X_train.txt |time/frequency| 561 element vector|Training Set (561 features - measures)
       train/Y_train.txt |time/frequency| 561 element vector|Training Labels (walking activity for each sample)
       
        +  Test Dataset
       
       Raw File                                     | units | type/length       | Description
       ---------------------------------------------|-------|-------------------|----------------
       test/X_test.txt |time/frequency| 561 element vector|Training Set (561 features - measures)
       test/Y_test.txt |time/frequency| 561 element vector|Training Labels (walking activity for each sample)
       
* **Activity label**

      + 
        
        Raw File                                    | units | type/length(per record)| Description
        --------------------------------------------|-------|------------------------|----------------
      activity_labels.txt                           |       | 2 elements (ID and ActivityName) |Links the class labels with their activity name.
      
* **An identifier of the subject who carried out the experiment**

      + Training Dataset
        
        Raw File                                    | units | type/length| Description
        --------------------------------------------|-------|------------------------|----------------
      train/subject_train.txt.txt                   |       | number - range(1-30) |Each row identifies the subject who performed the activity for each window sample.


       + Test Dataset
        
        Raw File                                    | units | type/length| Description
        --------------------------------------------|-------|------------------------|----------------
      test/subject_test.txt.txt                   |       | number - range(1-30) |Each row identifies the subject who performed the activity for each window sample.
      
2. Tidy Data Output
---
> **Description:**

The tidy dataset contains the average of feature variable (Mean and Standard Deviation measures only) from the original dataset for each activity and each subject.


> **Tidy Dataset Information**

*  The tidy dataset is consistent of 68 variables which includes ActivityName, SubjectID and 66 Mean value of feature variable (Mean and Standard deviation measures only). 

*  The Mean of feature variable is calculated for each subject ID and for each activity

*  There are 180 observations in the tidy dataset, (6 activities x 30 subjects)

*  The data is produced in a wide form

*   
        
        Field/Attribute                   | units | type/length             | Description
        ----------------------------------|-------|------------------------ |----------------
        SubjectId                         |       | int - range(1-30)       |Identifies the subject who performed the activity.
        ActivityName                      |       | character -             |Name of the activity
                                          |       |       values            |
                                          |       |        ("LAYING",       |
                                          |       |        "SITTING",       |    
                                          |       |        "STANDING",      |
                                          |       |        "WALKING",       |
                                          |       |    "WALKING_DOWNSTAIRS",| 
                                          |       |      "WALKING_UPSTAIRS) |
                                          |       |                         |
          66 Mean values of feature       |       |  number                 |Average of measures (std() and mean()   
                                          |       |                         |  variables by subject by activity)
          variables                       |       |                         |
        (ex- tBodyAcc-mean()-X.MEAN,      |       |                         |
        tBodyAcc-mean()-Y.MEAN and so on) |       |                         |    

> **Tidy Dataset Attributes**

More details of the tidy datset attributes are below:


```r
tidy <- read.table("./tidy_data.txt", stringsAsFactor=FALSE, header=TRUE)
str(tidy)
```

```
## 'data.frame':	180 obs. of  68 variables:
##  $ subjectId                       : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ activityName                    : chr  "LAYING" "SITTING" "STANDING" "WALKING" ...
##  $ tBodyAcc.mean...X.MEAN          : num  0.222 0.261 0.279 0.277 0.289 ...
##  $ tBodyAcc.mean...Y.MEAN          : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
##  $ tBodyAcc.mean...Z.MEAN          : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
##  $ tBodyAcc.std...X.MEAN           : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
##  $ tBodyAcc.std...Y.MEAN           : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
##  $ tBodyAcc.std...Z.MEAN           : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
##  $ tGravityAcc.mean...X.MEAN       : num  -0.249 0.832 0.943 0.935 0.932 ...
##  $ tGravityAcc.mean...Y.MEAN       : num  0.706 0.204 -0.273 -0.282 -0.267 ...
##  $ tGravityAcc.mean...Z.MEAN       : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
##  $ tGravityAcc.std...X.MEAN        : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
##  $ tGravityAcc.std...Y.MEAN        : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
##  $ tGravityAcc.std...Z.MEAN        : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
##  $ tBodyAccJerk.mean...X.MEAN      : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
##  $ tBodyAccJerk.mean...Y.MEAN      : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
##  $ tBodyAccJerk.mean...Z.MEAN      : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
##  $ tBodyAccJerk.std...X.MEAN       : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
##  $ tBodyAccJerk.std...Y.MEAN       : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
##  $ tBodyAccJerk.std...Z.MEAN       : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
##  $ tBodyGyro.mean...X.MEAN         : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
##  $ tBodyGyro.mean...Y.MEAN         : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
##  $ tBodyGyro.mean...Z.MEAN         : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
##  $ tBodyGyro.std...X.MEAN          : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
##  $ tBodyGyro.std...Y.MEAN          : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
##  $ tBodyGyro.std...Z.MEAN          : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
##  $ tBodyGyroJerk.mean...X.MEAN     : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
##  $ tBodyGyroJerk.mean...Y.MEAN     : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
##  $ tBodyGyroJerk.mean...Z.MEAN     : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
##  $ tBodyGyroJerk.std...X.MEAN      : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
##  $ tBodyGyroJerk.std...Y.MEAN      : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
##  $ tBodyGyroJerk.std...Z.MEAN      : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
##  $ tBodyAccMag.mean...MEAN         : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
##  $ tBodyAccMag.std...MEAN          : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
##  $ tGravityAccMag.mean...MEAN      : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
##  $ tGravityAccMag.std...MEAN       : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
##  $ tBodyAccJerkMag.mean...MEAN     : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
##  $ tBodyAccJerkMag.std...MEAN      : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
##  $ tBodyGyroMag.mean...MEAN        : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
##  $ tBodyGyroMag.std...MEAN         : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
##  $ tBodyGyroJerkMag.mean...MEAN    : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
##  $ tBodyGyroJerkMag.std...MEAN     : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
##  $ fBodyAcc.mean...X.MEAN          : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
##  $ fBodyAcc.mean...Y.MEAN          : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
##  $ fBodyAcc.mean...Z.MEAN          : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
##  $ fBodyAcc.std...X.MEAN           : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
##  $ fBodyAcc.std...Y.MEAN           : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
##  $ fBodyAcc.std...Z.MEAN           : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
##  $ fBodyAccJerk.mean...X.MEAN      : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
##  $ fBodyAccJerk.mean...Y.MEAN      : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
##  $ fBodyAccJerk.mean...Z.MEAN      : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
##  $ fBodyAccJerk.std...X.MEAN       : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
##  $ fBodyAccJerk.std...Y.MEAN       : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
##  $ fBodyAccJerk.std...Z.MEAN       : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
##  $ fBodyGyro.mean...X.MEAN         : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
##  $ fBodyGyro.mean...Y.MEAN         : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
##  $ fBodyGyro.mean...Z.MEAN         : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
##  $ fBodyGyro.std...X.MEAN          : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
##  $ fBodyGyro.std...Y.MEAN          : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
##  $ fBodyGyro.std...Z.MEAN          : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
##  $ fBodyAccMag.mean...MEAN         : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
##  $ fBodyAccMag.std...MEAN          : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
##  $ fBodyBodyAccJerkMag.mean...MEAN : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
##  $ fBodyBodyAccJerkMag.std...MEAN  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
##  $ fBodyBodyGyroMag.mean...MEAN    : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
##  $ fBodyBodyGyroMag.std...MEAN     : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
##  $ fBodyBodyGyroJerkMag.mean...MEAN: num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
##  $ fBodyBodyGyroJerkMag.std...MEAN : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...
```

3.Transformation (from RAW to Tidy Data)
---

> **Assumptions:**

  *  While reading at UCI webpage, it appears that the intention is to use data to see patterns of 
     different measures / variables. Doing analysis / looking at patterns of different variable would 
     be easier using wide - form instead of skinny/narrow format. Therefore, my output is in wide form.
        Although, I believe both forms represent tidy data.
        
  *  I have assumed that only valid values are where measure names contain either 
           mean() or std(). I have excluded any other means such as FreqMean or angle mean.      

> **Steps:**

1. **Merges the training and the test sets to create one data set.**

          A. Load the Datasets
              i). As there are different datasets file for training data and test data, all the files      
              are first loaded into separate dataframe variables. The data from training and test 
              datasets will be merged later.
              
              ii). Loaded the datafiles into following dataframe/vectors.
                Variable                          | Filename          | dimension
                ----------------------------------|-------------------|-------
                features (Data Frame)             |  features.txt    | 561x2
                activity (Data Frame)             |  activity.txt     | 6x2
                x_test (Data Frame)               |  X_test.txt       | 2947x561
                y_test (Data Frame)               |  Y_test.txt       | 2947x1
                subject_test (Data Frame)         |  subject_test.txt | 2947x1
                x_train (Data Frame)              |  X_train.txt      | 7352x561
                y_train (Data Frame)              |  Y_train.txt      | 7352x1
                subject_train (Data Frame)        |  subject_train.txt| 7352x1
                
              iii). There is no need to load/read the datasets for Inertia Signals (accelerometer,      
                angular velocity) as later in the project these will be dropped. They do not represent 
                mean / standard deviation values. Project only asks to prepare tidy dataset for mean
                /standard deviation variables.  
                
               iv) Provide appropriate/descriptive column names for each of the retrieved dataset.  
                
          B. Concatenate the three data frames for training data together to form one frame. That is,     
              we have merged - subject IDs, Activity IDs and feature data for every record (row) in the   
              datafiles. 
              
              The function used is "cbind". 
              train_merge_data <- cbind(subject_train, y_train, x_train)
 
          C. Similarly produce one data frame for test dataset. 
              test_merge_data <- cbind(subject_test, y_test, x_test)
              
            
          D. Merge the test and train datasets. These needs to be merged horizentally. Use row bind     
             function "rbind".
              merge_data <- rbind(train_merge_data, test_merge_data)
              
      
2. **Extracts only the measurements on the mean and standard deviation for each measurement.** 

          A. Extract only those measures from the merged data frame which represents mean or standard    
           deviation.
          
          B. Assumption: I have assumed that only valid values are where measure names contain either 
             mean() or std(). I have excluded any other means such as FreqMean or angle mean.
           
          C. Use grep command to extract the measures that matched mean() or std().
             Sample - 
             grep("mean\\(\\)|std\\(\\)", colNames, ignore=TRUE)
            
          D. The grep will provide the indices of the columns whose names match the selection 
            criteria.
          
          E. Extract all the valid columns in a dataframe using cbind. The data frame contains 
            subjectId, activityId and 66 columns (measures) that met the selection criteria. Use cbind()  
            function. Call this dataset "out_data"
            
          
3. **Uses descriptive activity names to name the activities in the data set**


          A. Join dataset in previous step ("out_data") with the "activity" data frame based on 
             activityID field. "activity" dataset contains descriptive names of all the activities.
          
          B. Assign the result to out_data. This will now contain activityName in addition to the 68  
             columns.
          
4. **Appropriately labels the data set with descriptive variable names.** 

          A.  Label all the columns extracted from the datafiles in the dataframe appropriately. Give 
              them a descriptive name such as "activityName", "activityId", and so on. I have provided the 
              appropriate names when the data was loaded from files. Feature names are extracted from 
              "feature.txt" file and assigned as column names for the measure variables in test/train 
              datasets.
          
5. **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**


          A. Calculate the aggregated mean of all the 66 measures for each subject for each activity. 
            Used "ddply"" function for calculating the summary. As the tidy data will be presented in 
            wide-form (and Not Skinny form), there are large number of columns.
                 Therefore I will be using "numcolwise"" function to calculate mean of all rows without 
            the need for typing all columns.
          
            Sample:- tidy_data <- ddply(out_data,.(subjectId,activityName), numcolwise(mean, na.rm=TRUE))

          B. Remove the "activity ID" column as we have activityName (descriptive)
          
          C. Change the column names of the measures by append ".MEAN" to the original name at the end
