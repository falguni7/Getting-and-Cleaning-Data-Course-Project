#reads available data

features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
colnames(train) <- features$V2
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
train$activity <- y_train$V1
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train$subject <- factor(subject_train$V1)
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(test) <- features$V2
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") 
test$activity <- y_test$V1
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test$subject <- factor(subject_test$V1)

#Merges the training and the test sets to create one data set.
dataset <- rbind(test, train) 
column.names <- colnames(dataset)

#Extracts only the measurements on the mean and standard deviation for each measurement
column.names.filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)
dataset.filtered <- dataset[, column.names.filtered] 

#Uses descriptive activity names to name the activities in the data set
dataset.filtered$activitylabel <- factor(dataset.filtered$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#creates a independent tidy data set with the average of each variable for each activity and each subject.
features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)
dataset.melt <-melt(dataset.filtered, id = c('activitylabel', 'subject'), measure.vars = features.colnames)
dataset.tidy <- dcast(dataset.melt, activitylabel + subject ~ variable, mean)
 
write.table(dataset.tidy, file = "tidydataset.txt" row.names = FALSE)