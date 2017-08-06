complete<-function(directory,id=1:332){
  #Create a data frame for results
  res<-data.frame(id=numeric(0),nobs=numeric(0))
  #Read files and compute their values into res
  for(i in id){
    thisFile<-read.csv(file.path(directory,paste(sprintf("%03d",i),".csv",sep="")))
    completeCases<-thisFile[complete.cases(thisFile),]
    res<-rbind(res,data.frame(id=i,nobs=nrow(completeCases)))
  }
  res
}