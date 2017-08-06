corr<-function(directory,threshold=0){
  #Loop through all files and correlate pollutant values if above threshold
  res<-numeric(0)
  for(i in 1:332){
    thisFile<-read.csv(file.path(directory,paste(sprintf("%03d",i),".csv",sep="")))
    cs<-complete.cases(thisFile)
    if(sum(cs)>threshold){
      res<-c(res,cor(thisFile[cs,]$sulfate,thisFile[cs,]$nitrate))
    }
  }
  res
}