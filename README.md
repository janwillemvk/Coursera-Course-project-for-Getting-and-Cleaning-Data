Coursera Getting and Cleaning Data Course Project 
by JWvK
Project deliverables:
1) a tidy data set called "tidydata.csv"  
2) the script called "run_analysis.R" for performing the analysis  
3) a code book called "CodeBook.md" describing the variables, the data, and any transformations or work that are performed to clean up the data  
4) a document called "README.md" explaining how the script run_analysis.R works and how the different processing steps and deliverables are connected 
5) the link to a Github repository containing all the above named files

Objective
The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset set to prepare it for use in later analysis.
In this case a publicly available dataset was used as a startingpoint. 
The data that was collected and cleaned in this course project stems from the area of wearable computing. The data was originally produced in a controlled 
set-up where volunteers wearing a smartphone went through a series of basic movements like klimbing stairs and walking. 
The purpose of the investigation was to try to develop models that can predict the actions of the volunteers based on the accelerometer data from the smartphone. 
The project data was downloaded 11-Nov-2015, at 5:20 CET. 
The download link is: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The datacollection and cleaning proces were executed using a single R-script called: run_analysis.R
The script was developped and tested on a Windows 7 laptop with internet connection, using R version 3.3.1 and RStudio Version 0.99.903.

Data processing steps.
-Step 0: library setting and data file download
Zipped datafiles are downloaded from a public website in the initial part of the script.
The script uses a basic set-up where the zipfile is placed and unpacked in a directory named "mydata" one level under the working directory.
When this mydata directory does not exists, it is created automaticly. 
The working directory information in this script refers to the original development environment. 
It needs to be adapted to suit the computer where te script is executed.

-Step 1: Merge the training and the test sets to create one data set.
By the end of step 1 there is a straightforward action for the two large tables containing alle the relevant measurements.
Before these two tables are merged both are extended with reference data on activities and volunteers.
-Step 2: Extract the measurements on the mean and standard deviation for each measurement.
There is a column selection action by the end of step 2.
Before this selection can take place the script deals with duplicate feature-names by merging feature names and indexes.  
Step 3: Use descriptive activity names to name the activities in the data set.
Activity id's are replaced by activity names. 
-Step 4: Appropriately label the data set with descriptive variable names.
The script changes a number of column names to comply to tidy data requirements.
-Step 5: From the data set in step 4, a second, independent tidy data set is created with the average of each variable for each activity and each subject.
The dataset is transformed: we now see the mean value of each measurent (feature) for each activity per volunteer.
Finally a CSV file is created (tidydata.csv)

References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012