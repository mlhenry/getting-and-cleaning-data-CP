# getting-and-cleaning-data: Class Project - Week 3

**Deliverables:**
- Tidy data set
- Link to this repository with script run_analysis.R
- Code book with descriptions of variable, data, and transformation called CodeBook.md
- This README.md file

**Data**
- Dataset background and sources (taken from original assignment):  
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

- Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**Script run_analysis.R will do the following:**
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Libraries**
- run_analysis.R uses the following libraries: plyr, dplyr, reshape2.
- The script will load the libraries in this order, it is important that plyr be loaded prior to dplyr.
- If you do not have these packages you can use install.packages.

**Paths**
- If you wish to use this script on your local, be sure to change the working directory and path variables at the beginning of this script.

**Output**
- *Question 1:* Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).
File: wideTidy-table.txt

- *Question 2:* Please submit a link to a Github repo with the code for performing your analysis. The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing how the script works and the code book describing the variables.

**Direct links to repo files:**
- CodeBook.md: 
- run_analysis.R: https://github.com/mlhenry/getting-and-cleaning-data-CP/blob/master/run_analysis.R


