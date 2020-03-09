# A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Ensure required packages are installed and loaded into R
if (!"dplyr" %in% installed.packages()) install.packages("dplyr")
library(dplyr)


# Step 1 - Download the dataset, extract relevant files and assign data to variables in R

#Checking if archieve already exists.
filename <- "GACDProject_data.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists, if not extract zip
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}


# Unpacks and prepares all the data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Step 3 - Merge the training and the test sets to create one data set.

test <- cbind(subject_test,x_test,y_test)
train <- cbind(subject_train, x_train, y_train)
data <- tbl_df(rbind(test,train))

#Step 2 - Extract only the measurements on the mean and standard deviation for each measurement

means_sds <- select(data, 1, "code", grep("mean|std", names(data)))

#Step 3 - Uses descriptive activity names to name the activities in the data set

means_sds$Activity <- activity_labels[means_sds$code, 2]

#Step 4 - Appropriately label the data set with descriptive variable names.

names(means_sds)<-gsub("Acc", "Accelerometer", names(means_sds))
names(means_sds)<-gsub("Gyro", "Gyroscope", names(means_sds))
names(means_sds)<-gsub("BodyBody", "Body", names(means_sds))
names(means_sds)<-gsub("Mag", "Magnitude", names(means_sds))
names(means_sds)<-gsub("^t", "Time", names(means_sds))
names(means_sds)<-gsub("^f", "Frequency", names(means_sds))
names(means_sds)<-gsub("()", "", names(means_sds))
means_sds <- rename(means_sds, "Activity Code" = "code")


#Step 5 - Create an independent tidy data set with the average of each variable for each activity and each subject.

by_activity <- group_by(means_sds, subject,Activity)
tidydata <- summarise_all(by_activity, funs(mean))
write.table(tidydata, "tidydata.txt", row.name=FALSE)
