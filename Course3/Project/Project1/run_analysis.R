#Set the working directory to the correct folder
setwd("~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week4/project")

#Download files

if(!dir.exists("data")){dir.create("data")}
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week4/project/data/data.zip"
download.file(url,dir)
dateDownloaded<-date() #"Fri Apr 07 20:00:42 2017" 

#Open a file connection to the zip file to read
unzip(dir,exdir="data")
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")

#Merge train and test tables by adding rows from test below train
subject <- rbind(subject_train,subject_test)
x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)

#Subset only the measured variables (not computed/derived ones) from x:
#tBodyAcc for BodyAcceleration in all 3 axis getting mean() plus sd() variables
#tGravityAcc for GravityAcceleration in all 3 axis getting mean() plus sd() variables
#tBodyGyro for BodyAngularVelocity in all 3 axis getting mean() plus st() variables
x <- x[,c(1:6,41:46,121:126)]

#Name all columns
names(subject) <- "SubjectID"
names(y) <- "Activity"
names(x) <- c("BodyAcceleration_meanX","BodyAcceleration_meanY","BodyAcceleration_meanZ",
              "BodyAcceleration_sdX","BodyAcceleration_sdY","BodyAcceleration_sdZ",
              "GravityAcceleration_meanX","GravityAcceleration_meanY","GravityAcceleration_meanZ",
              "GravityAcceleration_sdX","GravityAcceleration_sdY","GravityAcceleration_sdZ",
              "BodyAngularVelocity_meanX","BodyAngularVelocity_meanY","BodyAngularVelocity_meanZ",
              "BodyAngularVelocity_sdX","BodyAngularVelocity_sdY","BodyAngularVelocity_sdZ")

#Rename all activities to descriptive names
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING
y[y$Activity==1,]<-"Walking"
y[y$Activity==2,]<-"WalkingUpstairs"
y[y$Activity==3,]<-"WalkingDownStairs"
y[y$Activity==4,]<-"Sitting"
y[y$Activity==5,]<-"Standing"
y[y$Activity==6,]<-"Laying"

#Bind the data frames for subject,x,y together
data <- cbind(subject,y,x)

#Now create tidy dataset containing the average of each variable 
#for each subject and activity
library(dplyr)
groupedData <- group_by(data,SubjectID,Activity)
tidyDataset <- summarise(groupedData,
                         meanBodyAcceleration_meanX    = mean(BodyAcceleration_meanX),
                         meanBodyAcceleration_meanY    = mean(BodyAcceleration_meanY),
                         meanBodyAcceleration_meanZ    = mean(BodyAcceleration_meanZ),
                         meanBodyAcceleration_sdX      = mean(BodyAcceleration_sdX),
                         meanBodyAcceleration_sdY      = mean(BodyAcceleration_sdY),
                         meanBodyAcceleration_sdZ      = mean(BodyAcceleration_sdZ),
                         meanGravityAcceleration_meanX = mean(GravityAcceleration_meanX),
                         meanGravityAcceleration_meanY = mean(GravityAcceleration_meanY),
                         meanGravityAcceleration_meanZ = mean(GravityAcceleration_meanZ),
                         meanGravityAcceleration_sdX   = mean(GravityAcceleration_sdX),
                         meanGravityAcceleration_sdY   = mean(GravityAcceleration_sdY),
                         meanGravityAcceleration_sdZ   = mean(GravityAcceleration_sdZ),
                         meanBodyAngularVelocity_meanX = mean(BodyAngularVelocity_meanX),
                         meanBodyAngularVelocity_meanY = mean(BodyAngularVelocity_meanY),
                         meanBodyAngularVelocity_meanZ = mean(BodyAngularVelocity_meanZ),
                         meanBodyAngularVelocity_sdX   = mean(BodyAngularVelocity_sdX),
                         meanBodyAngularVelocity_sdY   = mean(BodyAngularVelocity_sdY),
                         meanBodyAngularVelocity_sdZ   = mean(BodyAngularVelocity_sdZ))

if(!dir.exists("result")){dir.create("result")}
write.table(tidyDataset,file="result/tidydataset.txt",row.name=FALSE)
#read.table("result/tidydataset.txt",header=TRUE)

sessionInfo()
#R version 3.3.3 (2017-03-06)
#Platform: x86_64-w64-mingw32/x64 (64-bit)
#Running under: Windows >= 8 x64 (build 9200)

#locale:
#  [1] LC_COLLATE=Spanish_Spain.1252  LC_CTYPE=Spanish_Spain.1252   
#  [3] LC_MONETARY=Spanish_Spain.1252 LC_NUMERIC=C                  
#  [5] LC_TIME=Spanish_Spain.1252    

#attached base packages:
#  [1] stats     graphics  grDevices utils     datasets  methods   base     

#other attached packages:
#  [1] dplyr_0.5.0

#loaded via a namespace (and not attached):
#  [1] lazyeval_0.2.0 magrittr_1.5   R6_2.2.0       assertthat_0.1 DBI_0.6       
# [6] tools_3.3.3    tibble_1.3.0   Rcpp_0.12.10
