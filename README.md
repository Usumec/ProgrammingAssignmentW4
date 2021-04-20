README
================
AM
4/20/2021

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Getting and Cleaning Data

## Programming assignment

The script “run\_analysis.R” downloads and unzips the dataset

``` r
#download and unzip the data files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, "data.zip", method = "curl")
unzip("data.zip")

dir("UCI HAR Dataset/",recursive = T)
##  [1] "activity_labels.txt"                         
##  [2] "features.txt"                                
##  [3] "features_info.txt"                           
##  [4] "README.txt"                                  
##  [5] "test/Inertial Signals/body_acc_x_test.txt"   
##  [6] "test/Inertial Signals/body_acc_y_test.txt"   
##  [7] "test/Inertial Signals/body_acc_z_test.txt"   
##  [8] "test/Inertial Signals/body_gyro_x_test.txt"  
##  [9] "test/Inertial Signals/body_gyro_y_test.txt"  
## [10] "test/Inertial Signals/body_gyro_z_test.txt"  
## [11] "test/Inertial Signals/total_acc_x_test.txt"  
## [12] "test/Inertial Signals/total_acc_y_test.txt"  
## [13] "test/Inertial Signals/total_acc_z_test.txt"  
## [14] "test/subject_test.txt"                       
## [15] "test/X_test.txt"                             
## [16] "test/y_test.txt"                             
## [17] "train/Inertial Signals/body_acc_x_train.txt" 
## [18] "train/Inertial Signals/body_acc_y_train.txt" 
## [19] "train/Inertial Signals/body_acc_z_train.txt" 
## [20] "train/Inertial Signals/body_gyro_x_train.txt"
## [21] "train/Inertial Signals/body_gyro_y_train.txt"
## [22] "train/Inertial Signals/body_gyro_z_train.txt"
## [23] "train/Inertial Signals/total_acc_x_train.txt"
## [24] "train/Inertial Signals/total_acc_y_train.txt"
## [25] "train/Inertial Signals/total_acc_z_train.txt"
## [26] "train/subject_train.txt"                     
## [27] "train/X_train.txt"                           
## [28] "train/y_train.txt"
```

All relevant files are imported

``` r
# import all data files
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
```

The training set and test set are merged

``` r
# combine training and test data sets
data <- rbind(train_data, test_data)
labels <- rbind(train_labels, test_labels)
subject <- rbind(train_subject, test_subject)
```

The column names in data (variables) are renamed based on the
“features.txt” file.

``` r
# rename columns with descriptive feature names (using "features.txt")
names(data) <- features$V2
names(labels) <- "activity"
names(subject) <- "subject"
```

“activity”, is converted from number to factor, with descriptive name
based on “activity\_labels.txt”

``` r
# change activity from number to factor with descriptive name
activity <- as.factor(activity_labels[match(labels$activity, activity_labels$V1),2])
```

“activity” and “subject” columns are added to the data set, generating a
full data frame. Everything else is removed to clean the environment.

``` r
# merge all in one data set and remove everything else
full <- cbind(subject, activity, data)

rm(list = setdiff(ls(), "full"))
```

Finally, using dplyr, only mean and standard deviation are selected for
each measurement, the average of each variable for each activity and
each subject is calculated. the results are stored in a new dataset

``` r
# extract only measurements on mean and std, group and calculate mean
library(dplyr)
## 
## Attaching package: 'dplyr'
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
full <- as_tibble(full, .name_repair = "unique")
## New names:
## * `fBodyAcc-bandsEnergy()-1,8` -> `fBodyAcc-bandsEnergy()-1,8...305`
## * `fBodyAcc-bandsEnergy()-9,16` -> `fBodyAcc-bandsEnergy()-9,16...306`
## * `fBodyAcc-bandsEnergy()-17,24` -> `fBodyAcc-bandsEnergy()-17,24...307`
## * `fBodyAcc-bandsEnergy()-25,32` -> `fBodyAcc-bandsEnergy()-25,32...308`
## * `fBodyAcc-bandsEnergy()-33,40` -> `fBodyAcc-bandsEnergy()-33,40...309`
## * ...
averaged <- full %>%
        select(subject:activity, contains(c("mean()", "std()"))) %>%
        group_by(subject, activity) %>%
        summarise(across(everything(), mean))
## `summarise()` has grouped output by 'subject'. You can override using the `.groups` argument.
```
