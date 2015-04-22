
## 
# execute all the analysis steps
process <- function(){
    data_merge <- merge_train_test()

}



## 1 Merges the 3 training and the 3 test sets to create one data set.

merge_train_test <-function(){

    data_test  <- merge_by_columns("subject_test.txt", "y_test.txt", "X_test.txt")
    data_train <- merge_by_columns("subject_train.txt", "y_train.txt", "X_train.txt")
    rbind(data_test, data_train)
}

# read the files and merge by columns
merge_by_columns <- function(subject_file, activity_file, x_file){
    
    data_subject <- read.table(subject_file, header=FALSE)
    data_y <- read.table(activity_file, header=FALSE)
    data_x <- read.table(x_file, header=FALSE)
    cbind(data_subject, data_y, data_x)
} 


## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 










## 3 Uses descriptive activity names to name the activities in the data set






## 4 Appropriately labels the data set with descriptive variable names. 
## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
