## getting_cleaning_data_project
Project of "getting and cleaning data course" from data science coursera


### Context

The goal of this project is to obtain a tidy data set from raw data sets include in this following file 
 "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
Those data are data collected from the accelerometers from Samsung Galaxy S Smartphone,
a complete description is available at this address:
 "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
 
Here is an extract of the README File included with the raw data sets given general explanation : 
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
 >Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
 >Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
 The experiments have been video-recorded to label the data manually. 
 The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The tidy output data set of this project is a merge of the test data set and the train data set and is obtained followwing these steps : 

* 1 Merges the training and the test sets to create one data set.
* 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3 Uses descriptive activity names to name the activities in the data set
* 4 Appropriately labels the data set with descriptive variable names. 
* 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A R script, file "run_analysis.R", is used to process the raw data and output the tidy data set.

A codeBook, file "CodeBook.md", described the raw data sets used and the tidy data set generated.

### Inputs  files used :
* Training data set :
    *'train/X_train.txt': Training set.                  7352 records of 561 features
    *'train/y_train.txt': Training labels.               7352 records of activity label
    *'train/subject_train.txt': Subject identification   7352 records of subject
        Each row identifies the subject who performed the activity for each window sample. 
        Its range is from 1 to 30.

* Test data set :
    * 'test/X_test.txt': Training set. 2947 records of 561 features.
    * 'test/y_test.txt': Training labels. 2947 records of activity label.
    * 'test/subject_test.txt': Subject identification 2947 records of subject
        Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* General for training and test data set
    * 'features.txt': List of all features
    * 'activity_labels.txt' Links the class labels with their activity name

### How to generate the tidy data set ?
* 1 Copy in your workspace all the input files :
    * 'X_train.txt'
    * 'y_train.txt'
    * 'subject_train.txt'
    * 'X_test.txt'
    * 'y_test.txt'
    * 'subject_test.txt'
    * 'features.txt'
    * 'activity_labels.txt'
    
* 2 Copy the script "run_analysis.R" in your workspace
* 3    * load  the script : source("run_analisys.R")
       * run the function : tidy_data <- process()

==> A dataframe is generated and named "tidydataset".
    A text dataset is generated and named "tidydataset.txt"
    
