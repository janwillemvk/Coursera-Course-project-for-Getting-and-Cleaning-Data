Code Book
The dataset 'tidydata.csv' was created by R script 'run_analysis.R'. 
The README.md document explains how the tidy data set was created.

Features:
The dataset contains 81 features. 
-Activity: Observed activities of the volunteers with the smart phone attached to their waist while walking, walkingupstairs, walkingdownstairs, sitting, standing and laying.
-Volunteerid: Volunteers numbered from 1 through 30 1,2,3 .... 29, 30
Features 3 through 81: Average of 79 features taken form the original original test and train datasets. 

Feature name composition:
mean: Mean value 
time: Time domain signal 
frequency: Frequency domain signal 
std: Standard Deviation value 
acc: Body and gravity acceleration (accelerometer) 
xyz: X, Y, and Z coordinates (X, Y, Z direction) 
jerk: Jerk signals 
gyro: Gyroscope sensor signals 
freq: Frequency 
mag: Magnitude

List of all 81 tidydata features:
-volunteerid                             
-activity                                
-meantimebodyaccmeanx                    
-meantimebodyaccmeany                    
-meantimebodyaccmeanz                    
-meantimebodyaccstdx                     
-meantimebodyaccstdy                     
-meantimebodyaccstdz                     
-meantimegravityaccmeanx                 
-meantimegravityaccmeany                 
-meantimegravityaccmeanz                 
-meantimegravityaccstdx                  
-meantimegravityaccstdy                  
-meantimegravityaccstdz                  
-meantimebodyaccjerkmeanx                
-meantimebodyaccjerkmeany                
-meantimebodyaccjerkmeanz                
-meantimebodyaccjerkstdx                 
-meantimebodyaccjerkstdy                 
-meantimebodyaccjerkstdz                 
-meantimebodygyromeanx                   
-meantimebodygyromeany                   
-meantimebodygyromeanz                   
-meantimebodygyrostdx                    
-meantimebodygyrostdy                    
-meantimebodygyrostdz                    
-meantimebodygyrojerkmeanx               
-meantimebodygyrojerkmeany               
-meantimebodygyrojerkmeanz               
-meantimebodygyrojerkstdx                
-meantimebodygyrojerkstdy                
-meantimebodygyrojerkstdz                
-meantimebodyaccmagmean                  
-meantimebodyaccmagstd                   
-meantimegravityaccmagmean               
-meantimegravityaccmagstd                
-meantimebodyaccjerkmagmean              
-meantimebodyaccjerkmagstd               
-meantimebodygyromagmean                 
-meantimebodygyromagstd                  
-meantimebodygyrojerkmagmean             
-meantimebodygyrojerkmagstd              
-meanfrequencybodyaccmeanx               
-meanfrequencybodyaccmeany               
-meanfrequencybodyaccmeanz               
-meanfrequencybodyaccstdx                
-meanfrequencybodyaccstdy                
-meanfrequencybodyaccstdz                
-meanfrequencybodyaccmeanfreqx           
-meanfrequencybodyaccmeanfreqy           
-meanfrequencybodyaccmeanfreqz           
-meanfrequencybodyaccjerkmeanx           
-meanfrequencybodyaccjerkmeany           
-meanfrequencybodyaccjerkmeanz           
-meanfrequencybodyaccjerkstdx            
-meanfrequencybodyaccjerkstdy            
-meanfrequencybodyaccjerkstdz            
-meanfrequencybodyaccjerkmeanfreqx       
-meanfrequencybodyaccjerkmeanfreqy       
-meanfrequencybodyaccjerkmeanfreqz       
-meanfrequencybodygyromeanx              
-meanfrequencybodygyromeany              
-meanfrequencybodygyromeanz              
-meanfrequencybodygyrostdx               
-meanfrequencybodygyrostdy               
-meanfrequencybodygyrostdz               
-meanfrequencybodygyromeanfreqx          
-meanfrequencybodygyromeanfreqy          
-meanfrequencybodygyromeanfreqz          
-meanfrequencybodyaccmagmean             
-meanfrequencybodyaccmagstd              
-meanfrequencybodyaccmagmeanfreq         
-meanfrequencybodybodyaccjerkmagmean     
-meanfrequencybodybodyaccjerkmagstd      
-meanfrequencybodybodyaccjerkmagmeanfreq 
-meanfrequencybodybodygyromagmean        
-meanfrequencybodybodygyromagstd         
-meanfrequencybodybodygyromagmeanfreq    
-meanfrequencybodybodygyrojerkmagmean    
-meanfrequencybodybodygyrojerkmagstd     
-meanfrequencybodybodygyrojerkmagmeanfreq

Some Observations:
Key facts about the tidydata set: 
The tidydata set contains 180 Records (rows) and 91 Features (columns) including the 'activity' and 'volunteerid' columns

Data Transformation
The following files were merged to create the mergeddata set:
X_test.txt, y_test.txt, subject_test.txt
X_train.txt, y_train.txt, subject_train.txt
features.txt

The mergeddata set contains 563 Features and 10299 Records 
No missing data was found in the original dataset
In the original datasets 42 feature names occur three times, which means there are 126 columns that can complicate processing of the data. 
To make the feature names unique the original feature names were merged with the column reference index.
Because the selection of the columns for the tidydata set contained no duplicate names, the index prefix was later removed.  

Feature (column) names were processed to remove unappropriate characters (dash, comma, bracket)
Feature (column) names were processed to change upper case to lower case
Feature (column) names were processed to substitute some abbreviations by full expressions (t --> time, f--> frequency )
Not all abbreviations we replaced to avoid accessive feature name length

The masterdata set was then created by selecting only the columns with names containing the key words 'mean' and 'std'.
Activity- and volunteerid- columns were also merged to this data set. This full data set contains 81 Features 
and 10299 records

The tidydata set was created by using the masterdata set and calculating the average of each feature for each activity and every volunteer. 
The tidydata set has 180 rows and 81 columns. The first two columns volunteerid and activity. 