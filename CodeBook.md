Codebook
================
AM
20/04/2021

<!-- CodeBook.md is generated from CodeBook.Rmd. Please edit that file -->

# Codebook

## Original files

The following files available in the original data set were used as
input:

-   ‘features\_info.txt’

-   ‘features.txt’

-   ‘activity\_labels.txt’

-   ‘train/X\_train.txt’

-   ‘train/y\_train.txt’

-   ‘test/X\_test.txt’

-   ‘test/y\_test.txt’

-   ‘train/subject\_train.txt’

-   ‘test/subject\_test.txt’

# Output files

“Output.txt” contains the following variables:

-   Subject No.

-   Activity

-   Selected variables: mean and standard deviation for every available
    measurement, as described in “features\_info.txt”

The values of each variable are the mean of the observations for each
activity of each subject

The variable names are available in “variables.txt”

    ##    V1                          V2
    ## 1   1                     subject
    ## 2   2                    activity
    ## 3   3           tBodyAcc-mean()-X
    ## 4   4           tBodyAcc-mean()-Y
    ## 5   5           tBodyAcc-mean()-Z
    ## 6   6        tGravityAcc-mean()-X
    ## 7   7        tGravityAcc-mean()-Y
    ## 8   8        tGravityAcc-mean()-Z
    ## 9   9       tBodyAccJerk-mean()-X
    ## 10 10       tBodyAccJerk-mean()-Y
    ## 11 11       tBodyAccJerk-mean()-Z
    ## 12 12          tBodyGyro-mean()-X
    ## 13 13          tBodyGyro-mean()-Y
    ## 14 14          tBodyGyro-mean()-Z
    ## 15 15      tBodyGyroJerk-mean()-X
    ## 16 16      tBodyGyroJerk-mean()-Y
    ## 17 17      tBodyGyroJerk-mean()-Z
    ## 18 18          tBodyAccMag-mean()
    ## 19 19       tGravityAccMag-mean()
    ## 20 20      tBodyAccJerkMag-mean()
    ## 21 21         tBodyGyroMag-mean()
    ## 22 22     tBodyGyroJerkMag-mean()
    ## 23 23           fBodyAcc-mean()-X
    ## 24 24           fBodyAcc-mean()-Y
    ## 25 25           fBodyAcc-mean()-Z
    ## 26 26       fBodyAccJerk-mean()-X
    ## 27 27       fBodyAccJerk-mean()-Y
    ## 28 28       fBodyAccJerk-mean()-Z
    ## 29 29          fBodyGyro-mean()-X
    ## 30 30          fBodyGyro-mean()-Y
    ## 31 31          fBodyGyro-mean()-Z
    ## 32 32          fBodyAccMag-mean()
    ## 33 33  fBodyBodyAccJerkMag-mean()
    ## 34 34     fBodyBodyGyroMag-mean()
    ## 35 35 fBodyBodyGyroJerkMag-mean()
    ## 36 36            tBodyAcc-std()-X
    ## 37 37            tBodyAcc-std()-Y
    ## 38 38            tBodyAcc-std()-Z
    ## 39 39         tGravityAcc-std()-X
    ## 40 40         tGravityAcc-std()-Y
    ## 41 41         tGravityAcc-std()-Z
    ## 42 42        tBodyAccJerk-std()-X
    ## 43 43        tBodyAccJerk-std()-Y
    ## 44 44        tBodyAccJerk-std()-Z
    ## 45 45           tBodyGyro-std()-X
    ## 46 46           tBodyGyro-std()-Y
    ## 47 47           tBodyGyro-std()-Z
    ## 48 48       tBodyGyroJerk-std()-X
    ## 49 49       tBodyGyroJerk-std()-Y
    ## 50 50       tBodyGyroJerk-std()-Z
    ## 51 51           tBodyAccMag-std()
    ## 52 52        tGravityAccMag-std()
    ## 53 53       tBodyAccJerkMag-std()
    ## 54 54          tBodyGyroMag-std()
    ## 55 55      tBodyGyroJerkMag-std()
    ## 56 56            fBodyAcc-std()-X
    ## 57 57            fBodyAcc-std()-Y
    ## 58 58            fBodyAcc-std()-Z
    ## 59 59        fBodyAccJerk-std()-X
    ## 60 60        fBodyAccJerk-std()-Y
    ## 61 61        fBodyAccJerk-std()-Z
    ## 62 62           fBodyGyro-std()-X
    ## 63 63           fBodyGyro-std()-Y
    ## 64 64           fBodyGyro-std()-Z
    ## 65 65           fBodyAccMag-std()
    ## 66 66   fBodyBodyAccJerkMag-std()
    ## 67 67      fBodyBodyGyroMag-std()
    ## 68 68  fBodyBodyGyroJerkMag-std()
