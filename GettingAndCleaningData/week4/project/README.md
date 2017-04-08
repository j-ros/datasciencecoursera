tidydataset.txt generation scripts
---

This dataset summarises the dataset from the following 
[dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
containing information on the subject, activity and mean values for each pair subject-activity on 
some of the variables of the original dataset, as per _CodeBook.md_ file.

It includes the following documents:
- A file _README.md_ detailing the analysis scripts
- A file _CodeBook.md_ detailing the variables in the _result/tidydataset.txt_ file
- A file _result/tidydataset.txt_ with the resulting dataset
- The original dataset in the directory _data_
- The R script used to generate the dataset, _run_analysis.R_

run_analysis.R script in detail
---

The original dataset is downloaded into the _data_ folder from the following 
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzipped.

Then the following files are read into R:
1. _data/UCI HAR Dataset/train/subject_train.txt_
2. _data/UCI HAR Dataset/train/X_train.txt_
3. _data/UCI HAR Dataset/train/y_train.txt_
4. _data/UCI HAR Dataset/test/subject_test.txt_
5. _data/UCI HAR Dataset/test/X_test.txt_
6. _data/UCI HAR Dataset/test/y_test.txt_

and the __test_ and __train_ tables corresponding to the same dataset are merged by appending the rows from the _test_
dataset to the _train_ dataset. This generates 3 datasets containing:
1. _subject_ dataset with the corresponding ids to the subjects.
2. _y_ dataset with the activity codes.
3. _x_ dataset with all features.

From the _x_ dataset we extract the measurements on the mean and standard deviation for each measurement. 
Therefore we omit all variables that do not correspond to measurements but to posterior computations 
(Jerk, Magnitude, Fast-Fourier-Tranforms and angles) from those measurements. This leaves the dataset
_x_ with the data from the mean and standard deviation of the body acceleration (_tBodyAcc_), 
gravity acceleration (_tGravityAcc_) and body angular velocity (_tBodyGyro_) on all 3 axis (_XYZ_).

Afterwards all the columns and variables from the 3 datasets are labeled with descriptive variable names:
1. The only column on the dataset _subject_ is named _SubjectID_.
2. The only column in the _y_ dataset is named _Activity_.
3. The columns in the _x_ dataset (_tBodyAcc_ mean in XYZ axis, _tBodyAcc_ std in XYZ axis,
_tGravityAcc_ mean in XYZ axis, _tGravityAcc_ std in XYZ axis, _tBodyGyro_ mean in XYZ axis and _tBodyGyro_
std in XYZ axis) are named, respectively, _BodyAcceleration_meanX_, _BodyAcceleration_meanY_, _BodyAcceleration_meanZ_, 
_BodyAcceleration_sdX_, _BodyAcceleration_sdY_, _BodyAcceleration_sdZ_, _GravityAcceleration_meanX_,
_GravityAcceleration_meanY_, _GravityAcceleration_meanZ_, _GravityAcceleration_sdX_, _GravityAcceleration_sdY_,
_GravityAcceleration_sdZ_, _BodyAngularVelocity_meanX_, _BodyAngularVelocity_meanY_, _BodyAngularVelocity_meanZ_,
_BodyAngularVelocity_sdX_, _BodyAngularVelocity_sdY_, _BodyAngularVelocity_sdZ_.
4. The values in the _y_ dataset are named according to the _activity_labels.txt_ file of the original dataset. 
1 into Walking, 2 into WalkingUpstairs, 3 into WalkingDownStairs, 4 into Sitting, 5 into Standing and 6 into Laying.

Finally, the 3 datasets are binded by columns to create one dataset containing the columns of _subject_, _y_ and _x_ datasets
in that order. This dataset contains each observation from one subject and activity in one row and each variable 
in a separate column, thus conforming to the __tidy data__ standards.

From this dataset we build an independent dataset containing the  the average of each variable for each activity 
and each subject which gets output in the file _result/tidydataset.txt_.

It can be read back into R by using
```r
read.table("result/tidydataset.txt",header=TRUE)
```

Notes
---
The original dataset from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
was downloaded on `"Fri Apr 07 20:00:42 2017"` 

The output from `sessionInfo()` command in R is listed below with the detailed information of the software
and packages used
>R version 3.3.3 (2017-03-06)
>Platform: x86_64-w64-mingw32/x64 (64-bit)
>Running under: Windows >= 8 x64 (build 9200)
>
>locale:
>  [1] LC_COLLATE=Spanish_Spain.1252  LC_CTYPE=Spanish_Spain.1252   
>  [3] LC_MONETARY=Spanish_Spain.1252 LC_NUMERIC=C                  
>  [5] LC_TIME=Spanish_Spain.1252    
>
>attached base packages:
>  [1] stats     graphics  grDevices utils     datasets  methods   base     
>
>other attached packages:
>  [1] dplyr_0.5.0
>
>loaded via a namespace (and not attached):
>  [1] lazyeval_0.2.0 magrittr_1.5   R6_2.2.0       assertthat_0.1 DBI_0.6       
> [6] tools_3.3.3    tibble_1.3.0   Rcpp_0.12.10




