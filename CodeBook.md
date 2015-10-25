# CodeBook for run_analysis.R



---
title: "CodeBook for run_analysis.R"
author: "mlhenry"
date: "25Oct15"
output: "wideTidy-table.txt"
---

## Project Description
This project produces a wide tidy data set with measurements for mean and standard deviation of movement metrics from a group of volunteers via a accelerometer and gyroscope equipped Samsung Galaxy S II phone.

##Study design and data processing
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. From: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. From: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Notes on the original (raw) data 
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
From the data's ReadME file

##Creating the tidy datafile
Libraries used:
- plyr
- dplyr
- reshape2

###Guide to create the tidy data file
1. Download and unzip the data in your working directory. The script expects the unzipped folder "UCI HAR Dataset" to be in folder "Class Project" that sits in your working directory. You must change these in order to run the script on your local.
2. Check that you have the required libraries 
3. Modify path variables to match those of your local (as explained in item 1 here).
4. Run the script in R to produce: wideTidy.csv, longTidy.csv, and wideTidy-table.txt (for submission).

###Cleaning of the data
The cleaning script combines multiple raw files such as test and training sets, subsets data of interest (mean, etc), and applies proper labels. The reshape2 package is used to create both long and wide forms of the data.
- Read tables from test and training files and bind them (observations are X, Activities are Y)
- Add feature data to the new trimed dset
- Trim the new super set to only include measures of interest as in item 2 above
- Get activity labels and rename columns for later use
- Combine the activities for Y, test and training
- Rename the first column of the activities to match ActLab, then join them by common column
- Bind these to the trimed dset
- Get subject info -- read, bind, etc
- Order the trimmed binded dset
- Use reshape2 package to make dset long form, then wide form which addresses means for Item 5.
- Lastly, put this into the required format using write.table where row.names is set to FALSE.

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Contain 180 observations of 81 variables.
 - There are 30 Ss
 - Activity is of 6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 - Remaining variable pertain to mean and std of movement measurements. More details in the data's accompanying ReadME file.

###Variable 1
Subject: there are 30 volunteers within an age bracket of 19-48 years.
Value: 1-30

###Variable 2
Activity: 6 levels
Value: 1-6
Labeled as:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

###Remaining Variables
Taken from source data file: Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

##Sources
- Used this codebook template on GitHub Gist https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41
- Data descriptions from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
- Data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

