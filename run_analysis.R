# run_analysis.R
# AM 20/04/2021

#download and unzip the data files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, "data.zip", method = "curl")
unzip("data.zip")

dir("UCI HAR Dataset/",recursive = T)

# import all data files
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# combine training and test data sets
data <- rbind(train_data, test_data)
labels <- rbind(train_labels, test_labels)
subject <- rbind(train_subject, test_subject)

# rename columns with descriptive feature names (using "features.txt")
names(data) <- features$V2
names(labels) <- "activity"
names(subject) <- "subject"

# change activity from number to factor with descriptive name
activity <- as.factor(activity_labels[match(labels$activity, activity_labels$V1),2])

# merge all in one data set and remove everything else
full <- cbind(subject, activity, data)

rm(list = setdiff(ls(), "full"))

# extract only measurements on mean and std, group and calculate mean
library(dplyr)
full <- as_tibble(full, .name_repair = "unique")
averaged <- full %>%
        select(subject:activity, contains(c("mean()", "std()"))) %>%
        group_by(subject, activity) %>%
        summarise(across(everything(), mean))

write.table(averaged, "output.txt", quote = F, row.names = F)
