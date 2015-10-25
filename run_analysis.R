##You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

##Packages used this this script: plyr dplyr and reshape2. You must load plyr before dplyr.
library(plyr)
library(dplyr)
library(reshape2)

##Set file pointers. Change these for use on a diff local.
setwd("~/Documents/Coursework/Data Scientists Toolbox/Class 3")
path <- function(file) {paste('Class Project/UCI HAR Dataset',"/",file,sep="")}

##Paths for activities
pAct <- path("activity_labels.txt")
pFeat <- path("features.txt")
pYtestAct <- path("test/y_test.txt")
pYtrainAct <- path("train/y_train.txt")

##Paths for test and training data
##pXtestSs <- path("test/subject_test.txt")
pXtest <- path("test/X_test.txt")
ptrainSs <- path("train/subject_train.txt")
pXtrain <- path("train/X_train.txt")
ptestSs <- path("test/subject_test.txt")

##Read tables from test and training files and bind them
##Observations are X, Activities are Y
TestDat <- read.table(pXtest)
TrainDat <- read.table(pXtrain)
ObsAll <- rbind(TestDat, TrainDat)

##Add feature data to the new trimed dset
featDat <- read.table(pFeat,stringsAsFactors = FALSE)[[2]]
colnames(ObsAll) <- (featDat)

##Trim the new super set to only include measures of interest as in item 2 above
trimObs <- ObsAll[,grep("mean|std|activityLabel",featDat)]

##Get activity labels and rename columes for later use
ActLab <- read.table(pAct, stringsAsFactors = FALSE)
colnames(ActLab) <- c("activityID","activityLabel")

##Combine the activities for Y, test and training
##Rename column 1 of these to match ActLab, then join them by common column
TrainAct <- read.table(pYtrainAct,stringsAsFactors = FALSE)
TestAct <- read.table(pYtestAct,stringsAsFactors = FALSE)
ActAll <- rbind(TrainAct,TestAct)
colnames(ActAll)[1] <- "activityID"
ActFull <- join(ActAll, ActLab, by = "activityID")

##Bind these to the trimed dset
trimObs <- cbind(activity=ActFull[,"activityLabel"],trimObs)

##Get subject info -- read, bind, etc
ptrainSsdat <- read.table(ptrainSs,stringsAsFactors = FALSE)
ptestSsdat <- read.table(ptestSs,stringsAsFactors = FALSE)
AllSs <- rbind(ptestSsdat, ptrainSsdat)
colnames(AllSs) <- ("subject")
Tidy <- cbind(AllSs,trimObs)

##Order the trimmed binded dset
Tidy <- Tidy[order(Tidy$subject, Tidy$activity),]

##Use reshape2 package to make dset long form, then wide form which addresses means for 
##Item 5 above.
longTidy <- melt(Tidy,id.vars= c("subject","activity"))
wideTidy <- dcast(longTidy, subject + activity ~ variable, mean)

write.table(wideTidy, file="wideTidy-table.txt",row.names = FALSE)