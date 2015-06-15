# Getting_and_Cleaning_Data

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

(find all project-related materials in the UCI HAR Dataset directory.  

Copies of the important files have been put into this main directory to fulfill the submission requirement)

Instructions:

1. Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, for example C:\Users\yourname\Documents\R\

2. Put run_analysis.R into C:\Users\yourname\Documents\R\UCI HAR Dataset\

3. In R Console: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\"), followed by: source("run_analysis.R")

4. Use data <- read.table("dataset_with_avg_var") to read the data. 

The attached R script (run_analysis.R) performs the following clean up and new data set:

1. Merges the training and test sets to create one data set, namely train/X_train.txt with test/X_test.txt, the result of which is a 10299x561 data frame, as in the original description ("Number of Instances: 10299" and "Number of Attributes: 561"), train/subject_train.txt with test/subject_test.txt, the result of which is a 10299x1 data frame with subject IDs, and train/y_train.txt with test/y_test.txt, the result of which is also a 10299x1 data frame with activity IDs.

2. Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set

4. The script also appropriately labels the data set with descriptive names

5. Lastly, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as dataset_with_avg_var.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names, and then the averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.


