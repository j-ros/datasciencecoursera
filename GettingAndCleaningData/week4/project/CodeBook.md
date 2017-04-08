### CodeBook - tidydataset.txt

This dataset is derived from the dataset provided in the following [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
containing data from the Samsung Galaxy S accelerometer on 30 subjects while performing 6 different acivities.
The original time domain signals from the accelerometer (tAcc-XYZ and tGyro-XYZ) were sampled at a rate of 50Hz and then filtered using a median filter and a 3rd order 
low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Afterwards they were separated into body (tBodyAcc-XYZ) and gravity (tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The suffixes -XYZ correspond to the corresponding 
axis in the 3-axial raw signal. From these variables the mean and standard deviation were estimated (and hence the suffix
-mean() and -std(), respectively.
More information about the original dataset in the files _features.txt_ and _features_info.txt_ contained in the original dataset.

__SubjectID__

        Integer in range 1-30 identifying the subject.
        Same as in the original dataset.
        
__Activity__

        Factor with levels (Laying, Sitting, Standing, Walking, WalkingUpstairs and WalkingDownStairs) 
        indicating the type of activity performed.
        Converted from the original dataset according to the activity_labels.txt file.
        
__meanBodyAcceleration_meanX__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyAcc-mean()-X from the 
        original dataset averaged for each subject and activity.
        
__meanBodyAcceleration_meanY__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyAcc-mean()-Y from the 
        original dataset averaged for each subject and activity.
      
__meanBodyAcceleration_meanZ__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyAcc-mean()-Z from the 
        original dataset averaged for each subject and activity.
        
__meanBodyAcceleration_sdX__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyAcc-std()-X from the 
        original dataset averaged for each subject and activity.
        
__meanBodyAcceleration_sdY__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyAcc-std()-Y from the 
        original dataset averaged for each subject and activity.
      
__meanBodyAcceleration_sdZ__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyAcc-std()-Z from the 
        original dataset averaged for each subject and activity.
        
__meanGravityAcceleration_meanX__

        Numeric value in range [-1,1] containing the mean value of the variable tGravityAcc-mean()-X from the 
        original dataset averaged for each subject and activity.
        
__meanGravityAcceleration_meanY__

        Numeric value in range [-1,1] containing the mean value of the variable tGravityAcc-mean()-Y from the 
        original dataset averaged for each subject and activity.
      
__meanGravityAcceleration_meanZ__

        Numeric value in range [-1,1] containing the mean value of the variable tGravityAcc-mean()-Z from the 
        original dataset averaged for each subject and activity.
        
__meanGravityAcceleration_sdX__

        Numeric value in range [-1,1] containing the mean value of the variable tGravityAcc-std()-X from the 
        original dataset averaged for each subject and activity.
        
__meanGravityAcceleration_sdY__

        Numeric value in range [-1,1] containing the mean value of the variable tGravityAcc-std()-Y from the 
        original dataset averaged for each subject and activity.
      
__meanGravityAcceleration_sdZ__

        Numeric value in range [-1,1] containing the mean value of the variable tGravityAcc-std()-Z from the 
        original dataset averaged for each subject and activity.
        
__meanBodyAngularVelocity_meanX__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyGyro-mean()-X from the 
        original dataset averaged for each subject and activity.
        
__meanBodyAngularVelocity_meanY__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyGyro-mean()-Y from the 
        original dataset averaged for each subject and activity.
      
__meanBodyAngularVelocity_meanZ__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyGyro-mean()-Z from the 
        original dataset averaged for each subject and activity.
        
__meanBodyAngularVelocity_sdX__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyGyro-std()-X from the original dataset
        averaged for each subject and activity.
        
__meanBodyAngularVelocity_sdY__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyGyro-std()-Y from the original dataset
        averaged for each subject and activity.
      
__meanBodyAngularVelocity_sdZ__

        Numeric value in range [-1,1] containing the mean value of the variable tBodyGyro-std()-Z from the original dataset
        averaged for each subject and activity.
                
