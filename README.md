CourseProject
=============

Step 0: 
The data from the source "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" has been unzipped to Data folder in my home directory. Data folder contains "UCIHARDataset" folder, which has the data required for analysis 

Step 1: 
Read the files subject_test/train.txt, X_test/train.txt, y_test/train.txt to dataframes. Also read the features and activity_labels to data frames.

Step 2:

For X_train/test datasets, set the column names with names from features
Label y_test/train with ActivityId and sibject_test/train with SubjectID

Step 3:
Extracing all the measurements for only mean and standard deviation for each measurement

Step 4:
Merge the X, Y and Subject datasets for each of train and test seperately

Step 5:
Combine the test and train datasets and create a CombinedX dataset

Step 6:
Uses descriptive activity names from LabelNames df to name the activities in the CombinedX dataset

Step 7:
Make descriptive names for filtered variables by eliminating special charaters like - and ()

Step 8:
Creates a second, independent tidy data set, tidyAverage, with the average of each variable for each activity and each subject
