
## 
# execute all the analysis steps
process <- function(){
    data_set <- merge_train_test()
    data_set <- subset_data(data_set)
    data_set <- add_activity_names(data_set)
    tidy_data <- create_tidy_data_set(data_set)
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
## 4 Appropriately labels the data set with descriptive variable names. 

subset_data <- function(data){
# read the raw variables names
features <- read.table(file ="features.txt")

# add variable names of column 1 and column 2
add_labels <- data.frame(label=c("subject", "activity"))
features_labels <- data.frame(features[,2])
colnames(features_labels) = "label"
variables_names <- rbind(add_labels, features_labels)

# subset of the data set
# looking for variables names to keep
flag <- grep(pattern="-mean\\(\\)|-std\\(\\)|^subject$|^activity$",x = variables_names[,1])
# subset
data <- data[,flag]
# add variables names
colnames(data) = all_labels[flag,1]

data
}

## 3 Uses descriptive activity names to name the activities in the data set
add_activity_names <- function(data){
    data
}
 
## 5 From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.
create_tidy_data_set <- function(data){
    test <- melt(data,id=c("subject","activity"),measure.vars=c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y"))
    test <- melt(tidy_data,id=c("subject","activity"))
    dcast(data, subject+activity~variable)
    final <-dcast(test,subject+activity~variable,mean)
    
    data
    
}