# execute the 5 analysis steps and create a tidy data set text file
process <- function(){
    data_set <- merge_train_test()
    data_set1 <- subset_data(data_set)
    data_set2 <- add_activity_names(data_set1)
    data_set3 <- proper_variables_names(data_set2)
    tidy_data <- create_tidy_data_set(data_set3)
    # create a text file
    write.table(x = tidy_data, file ="tidy_data_set.txt", row.names=FALSE)
    tidy_data
}

# 1 Merges the 3 training and the 3 test sets to create one data set.

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

# 2 Extracts only the measurements on the mean and standard deviation for each measurement. . 

subset_data <- function(data){
    # read the raw variables names
    features <- read.table(file ="features.txt")

    # add to the feature list variable names for column 1 and column 2
    add_labels <- data.frame(label=c("subject", "activity"))
    features_labels <- data.frame(features[,2])
    colnames(features_labels) = "label"
    variables_names <- rbind(add_labels, features_labels)

    # subset of the data set
    # looking for variables names to keep
    flag <- grep(pattern="-mean\\(\\)|-std\\(\\)|^subject$|^activity$",x = variables_names[,1])
    # subsetting
    data <- data[,flag]
    # add raw variables names
    colnames(data) = variables_names[flag,1]
    data
}

# 3 Uses descriptive activity names to name the activities in the data set

add_activity_names <- function(data){
    activity_labels <-read.table("activity_labels.txt", header=FALSE)
    #replace the activity number by an activity label for all elements
    data[,2] <-unlist(lapply(data[,2],FUN = convert, activity_labels))
    data
}
#replace the activity number by an activity label for one element
convert <- function(x, activity_labels){
    if (x %in% c(1:6))  x <- activity_labels[x,2]
}

## 4 Appropriately labels the data set with descriptive variable names.

proper_variables_names <- function(data){
    # variable names with only lower case
    names(data) = tolower(names(data))
    # delete parenthesis from variables names
    names(data)=sub("\\(","",(names(data)))
    names(data)=sub("\\)","",(names(data)))
    data
}

## 5 From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.

create_tidy_data_set <- function(data){
    # obtain long format data of 4 columns ("subject","activity", "variable", "value")
    temp <- melt(data, id=c("subject","activity"))
    # calculate the mean for each variable for each group of (subject+activity)
    dcast(temp, subject + activity ~ variable, mean)
}