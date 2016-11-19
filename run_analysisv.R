# run_analysis.R
# Coursera Getting and Cleaning Data Course Project 
# by JWvK
# date: 19-11-2016
# The purpose of this project is to demonstrate the ability to collect, work with, and clean a (given) data set.
# source for given dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# There are five data-processing requirements that need to be fullfilled in this project
#   Step 1: Merge the training and the test sets to create one data set.
#   Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
#   Step 3: Use descriptive activity names to name the activities in the data set
#   Step 4: Appropriately label the data set with descriptive variable names.
#   Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each 
#           activity and each subject.

#Step 0: generic library setting and data file download
library(dplyr)

setwd("C:/JWvK/R-home/Getting_and_cleaning_data")  #please customise for your local computer
if(!file.exists("mydata")){dir.create("mydata")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./mydata/getdata_projectfiles_UCI HAR Dataset.zip", method="auto")
unzip("./mydata/getdata_projectfiles_UCI HAR Dataset.zip", overwrite = TRUE, exdir = "./mydata")
list.files("./mydata") # expected outcome: [1] "getdata_projectfiles_UCI HAR Dataset.zip" "UCI HAR Dataset"

# Step 1: Merge the "train" and the "test" data sets to create the mergeddata set.
# prepare the "test" set for merging
# load calculated features from file
X_test<-read.table("./mydata/UCI HAR Dataset/test/X_test.txt")
# load observed activities from file and add activity names
y_test<-read.table("./mydata/UCI HAR Dataset/test/y_test.txt")
names(y_test)<-c("activity")
activity.code <- c(walking=1, waklkingupstairs=2, walkingdownstairs=3, sitting=4, standing=5, laying=6)
y_test$activity.str <- names(activity.code)[match(y_test$activity, activity.code)]
# add activity data to the feature data in X_test data frame
X_test$activity <- y_test$activity.str
# load volunteer-id reference-data from file 
subject_test<-read.table("./mydata/UCI HAR Dataset/test/subject_test.txt")
names(subject_test)<-c("volunteer")
# add volunteer-id reference to the feature data in X_test data frame
X_test$volunteerid <- subject_test$volunteer

# prepare the "train" data set for merging
# load calculated features from file
X_train<-read.table("./mydata/UCI HAR Dataset/train/X_train.txt")
# load observed activities from file add activity names
y_train<-read.table("./mydata/UCI HAR Dataset/train/y_train.txt")
names(y_train)<-c("activity")
activity.code <- c(walking=1, waklkingupstairs=2, walkingdownstairs=3, sitting=4, standing=5, laying=6)
y_train$activity.str <- names(activity.code)[match(y_train$activity, activity.code)]
# add activity data to the feature data in X_train data frame
X_train$activity <- y_train$activity.str
# load volunteer-id reference-data from file 
subject_train<-read.table("./mydata/UCI HAR Dataset/train/subject_train.txt")
names(subject_train)<-c("volunteer")
# add volunteer-id reference to the feature data in X_train data frame
X_train$volunteerid <- subject_train$volunteer
# now merge the two prepared data sets
mergeddata <- rbind(X_train, X_test)
# Step 1=DONE merging creates a dataset of 10299 rows and 563 columns

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
# load list of features names
features<-read.table("./mydata/UCI HAR Dataset/features.txt")
names(features)<-c("index","feature")
# optional check for duplicate feature names (to do the check please remove comment symbols "#" in the next two lines)
# freq_table<- table(features[,"feature"])
# dim(tabel[freq_table>1])  
# 42 feature names have occurences of more than 1, actually they occur three times.

# add feature-names to mergeddata   
# to make the feature-names unique we merge the index- and the feature- strings 
names(mergeddata)<-paste(features$index,features$feature, sep="__")
# we lost two column names: fix this 
names(mergeddata)[562:563] <- c("activity","volunteerid")
# now we can safely filter columnames 
string<-grep(pattern = "mean()|std()", x = names(mergeddata))
masterdata<-select(mergeddata, string, volunteerid, activity)
# Step 2: DONE

# Step 3: Use descriptive activity names to name the activities in the data set
# Step 3: DONE 

# Step 4: Appropriately label the data set with descriptive variable names.
# clean-up column names step by step
# replace some abreviations by full expression
names(masterdata) <- gsub("__f", "__Frequency", names(masterdata))
names(masterdata) <- gsub("__t", "__Time", names(masterdata))
# remove the string that was used to solve the issue with the duplicate columnames in the original dataset 
names(masterdata) <- gsub("[0-9][0-9][0-9]__", "mean", names(masterdata))   #mean prefix: see step 5
names(masterdata) <- gsub("[0-9][0-9]__", "mean", names(masterdata)) #mean prefix: see step 5
names(masterdata) <- gsub("[0-9]__", "mean", names(masterdata))  #mean prefix: see step 5
# remove brackes ( )
names(masterdata) <- gsub("\\(", "", names(masterdata))
names(masterdata) <- gsub("\\)", "", names(masterdata))
# remove commas ,
names(masterdata) <- gsub(",", "", names(masterdata))
# remove dashes -
names(masterdata) <- gsub("-", "", names(masterdata))
# change Uppercase to lowercase letters
names(masterdata) <- tolower(names(masterdata))

# optional check for duplicate feature names (please remove comment signs "#" for check in the next 2 lines)
# freq_table<- table(names(masterdata))
# dim(tabel[freq_table>1])  ### NULL feature names have occurences of more than 1
# Step 4: DONE

# Step 5: From the data set in step 4, create a second, independent tidydata set with the average of each  
#           variable for each activity and each subject.
tidydata<-masterdata %>%
  select(volunteerid, activity, meantimebodyaccmeanx:meanfrequencybodybodygyrojerkmagmeanfreq) %>%
  group_by(volunteerid, activity) %>%
  summarise_each(funs(mean(.)))
# Write CSV
write.csv(tidydata, file = "tidydata.csv")
# Step 5: DONE
