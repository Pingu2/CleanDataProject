Clean Data Project Code Book

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

 data used for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 




Variable names for the measurements taken are taken from the features file:
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
      mad(): Median absolute deviation 
      max(): Largest value in array
      min(): Smallest value in array
      sma(): Signal magnitude area
      energy(): Energy measure. Sum of the squares divided by the number of values. 
      iqr(): Interquartile range 
      entropy(): Signal entropy
      arCoeff(): Autorregresion coefficients with Burg order equal to 4
      correlation(): correlation coefficient between two signals
      maxInds(): index of the frequency component with largest magnitude
      meanFreq(): Weighted average of the frequency components to obtain a mean frequency
      skewness(): skewness of the frequency domain signal 
      kurtosis(): kurtosis of the frequency domain signal 
      bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
      angle(): Angle between to vectors.

      Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

      gravityMean
      tBodyAccMean
      tBodyAccJerkMean
      tBodyGyroMean
      tBodyGyroJerkMean
  








run_analysis.R steps
set up
libraries dplyr and plyr are used
the data is downloaded and unzipped
files listed above are read in

putting together the file info
Variable names for the measurements taken are taken from the features file 
30 subjects are included in this data
y_test and y_train provide the activity code data
test files data were compiled together
training files data were compiled together
the data frame DATA was then created by binding the test and training data

cleaning the data
Activities are given descriptive labels to replace the numerical values in original data
variable names are changed into lower case and "-" are removed

extract wanted mreasurements to finish first desired data set named DATA
subjects and activities are kept along with only mean and std measurements


DATA contains 10299 obs and 88 variables
 names(DATA)
 [1] "tbodyaccmean()x"                      "tbodyaccmean()y"                     
 [3] "tbodyaccmean()z"                      "tbodyaccstd()x"                      
 [5] "tbodyaccstd()y"                       "tbodyaccstd()z"                      
 [7] "tgravityaccmean()x"                   "tgravityaccmean()y"                  
 [9] "tgravityaccmean()z"                   "tgravityaccstd()x"                   
[11] "tgravityaccstd()y"                    "tgravityaccstd()z"                   
[13] "tbodyaccjerkmean()x"                  "tbodyaccjerkmean()y"                 
[15] "tbodyaccjerkmean()z"                  "tbodyaccjerkstd()x"                  
[17] "tbodyaccjerkstd()y"                   "tbodyaccjerkstd()z"                  
[19] "tbodygyromean()x"                     "tbodygyromean()y"                    
[21] "tbodygyromean()z"                     "tbodygyrostd()x"                     
[23] "tbodygyrostd()y"                      "tbodygyrostd()z"                     
[25] "tbodygyrojerkmean()x"                 "tbodygyrojerkmean()y"                
[27] "tbodygyrojerkmean()z"                 "tbodygyrojerkstd()x"                 
[29] "tbodygyrojerkstd()y"                  "tbodygyrojerkstd()z"                 
[31] "tbodyaccmagmean()"                    "tbodyaccmagstd()"                    
[33] "tgravityaccmagmean()"                 "tgravityaccmagstd()"                 
[35] "tbodyaccjerkmagmean()"                "tbodyaccjerkmagstd()"                
[37] "tbodygyromagmean()"                   "tbodygyromagstd()"                   
[39] "tbodygyrojerkmagmean()"               "tbodygyrojerkmagstd()"               
[41] "fbodyaccmean()x"                      "fbodyaccmean()y"                     
[43] "fbodyaccmean()z"                      "fbodyaccstd()x"                      
[45] "fbodyaccstd()y"                       "fbodyaccstd()z"                      
[47] "fbodyaccmeanfreq()x"                  "fbodyaccmeanfreq()y"                 
[49] "fbodyaccmeanfreq()z"                  "fbodyaccjerkmean()x"                 
[51] "fbodyaccjerkmean()y"                  "fbodyaccjerkmean()z"                 
[53] "fbodyaccjerkstd()x"                   "fbodyaccjerkstd()y"                  
[55] "fbodyaccjerkstd()z"                   "fbodyaccjerkmeanfreq()x"             
[57] "fbodyaccjerkmeanfreq()y"              "fbodyaccjerkmeanfreq()z"             
[59] "fbodygyromean()x"                     "fbodygyromean()y"                    
[61] "fbodygyromean()z"                     "fbodygyrostd()x"                     
[63] "fbodygyrostd()y"                      "fbodygyrostd()z"                     
[65] "fbodygyromeanfreq()x"                 "fbodygyromeanfreq()y"                
[67] "fbodygyromeanfreq()z"                 "fbodyaccmagmean()"                   
[69] "fbodyaccmagstd()"                     "fbodyaccmagmeanfreq()"               
[71] "fbodybodyaccjerkmagmean()"            "fbodybodyaccjerkmagstd()"            
[73] "fbodybodyaccjerkmagmeanfreq()"        "fbodybodygyromagmean()"              
[75] "fbodybodygyromagstd()"                "fbodybodygyromagmeanfreq()"          
[77] "fbodybodygyrojerkmagmean()"           "fbodybodygyrojerkmagstd()"           
[79] "fbodybodygyrojerkmagmeanfreq()"       "angle(tbodyaccmean,gravity)"         
[81] "angle(tbodyaccjerkmean),gravitymean)" "angle(tbodygyromean,gravitymean)"    
[83] "angle(tbodygyrojerkmean,gravitymean)" "angle(x,gravitymean)"                
[85] "angle(y,gravitymean)"                 "angle(z,gravitymean)"                
[87] "subject"                              "activities"  


Forming the second data frame DATA2
get the mean of each measurement from DATA grouped by subject 
get the mean of each measurement from DATA grouped by activity
merge the two results

DATA2 contains 36 observations and 88 variables
names(DATA2)
 [1] "subject"                              "activity"                            
 [3] "tbodyaccmean()x"                      "tbodyaccmean()y"                     
 [5] "tbodyaccmean()z"                      "tbodyaccstd()x"                      
 [7] "tbodyaccstd()y"                       "tbodyaccstd()z"                      
 [9] "tgravityaccmean()x"                   "tgravityaccmean()y"                  
[11] "tgravityaccmean()z"                   "tgravityaccstd()x"                   
[13] "tgravityaccstd()y"                    "tgravityaccstd()z"                   
[15] "tbodyaccjerkmean()x"                  "tbodyaccjerkmean()y"                 
[17] "tbodyaccjerkmean()z"                  "tbodyaccjerkstd()x"                  
[19] "tbodyaccjerkstd()y"                   "tbodyaccjerkstd()z"                  
[21] "tbodygyromean()x"                     "tbodygyromean()y"                    
[23] "tbodygyromean()z"                     "tbodygyrostd()x"                     
[25] "tbodygyrostd()y"                      "tbodygyrostd()z"                     
[27] "tbodygyrojerkmean()x"                 "tbodygyrojerkmean()y"                
[29] "tbodygyrojerkmean()z"                 "tbodygyrojerkstd()x"                 
[31] "tbodygyrojerkstd()y"                  "tbodygyrojerkstd()z"                 
[33] "tbodyaccmagmean()"                    "tbodyaccmagstd()"                    
[35] "tgravityaccmagmean()"                 "tgravityaccmagstd()"                 
[37] "tbodyaccjerkmagmean()"                "tbodyaccjerkmagstd()"                
[39] "tbodygyromagmean()"                   "tbodygyromagstd()"                   
[41] "tbodygyrojerkmagmean()"               "tbodygyrojerkmagstd()"               
[43] "fbodyaccmean()x"                      "fbodyaccmean()y"                     
[45] "fbodyaccmean()z"                      "fbodyaccstd()x"                      
[47] "fbodyaccstd()y"                       "fbodyaccstd()z"                      
[49] "fbodyaccmeanfreq()x"                  "fbodyaccmeanfreq()y"                 
[51] "fbodyaccmeanfreq()z"                  "fbodyaccjerkmean()x"                 
[53] "fbodyaccjerkmean()y"                  "fbodyaccjerkmean()z"                 
[55] "fbodyaccjerkstd()x"                   "fbodyaccjerkstd()y"                  
[57] "fbodyaccjerkstd()z"                   "fbodyaccjerkmeanfreq()x"             
[59] "fbodyaccjerkmeanfreq()y"              "fbodyaccjerkmeanfreq()z"             
[61] "fbodygyromean()x"                     "fbodygyromean()y"                    
[63] "fbodygyromean()z"                     "fbodygyrostd()x"                     
[65] "fbodygyrostd()y"                      "fbodygyrostd()z"                     
[67] "fbodygyromeanfreq()x"                 "fbodygyromeanfreq()y"                
[69] "fbodygyromeanfreq()z"                 "fbodyaccmagmean()"                   
[71] "fbodyaccmagstd()"                     "fbodyaccmagmeanfreq()"               
[73] "fbodybodyaccjerkmagmean()"            "fbodybodyaccjerkmagstd()"            
[75] "fbodybodyaccjerkmagmeanfreq()"        "fbodybodygyromagmean()"              
[77] "fbodybodygyromagstd()"                "fbodybodygyromagmeanfreq()"          
[79] "fbodybodygyrojerkmagmean()"           "fbodybodygyrojerkmagstd()"           
[81] "fbodybodygyrojerkmagmeanfreq()"       "angle(tbodyaccmean,gravity)"         
[83] "angle(tbodyaccjerkmean),gravitymean)" "angle(tbodygyromean,gravitymean)"    
[85] "angle(tbodygyrojerkmean,gravitymean)" "angle(x,gravitymean)"                
[87] "angle(y,gravitymean)"                 "angle(z,gravitymean)" 







