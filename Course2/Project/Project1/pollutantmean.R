pollutantmean<-function(directory,pollutant,id=1:332){
  #Allocate the elements in a vector
  res<-numeric()
  #Read the files and put the corresponding data series in res (without NA)
  for(i in id){
    thisFile<-read.csv(file.path(directory,paste(sprintf("%03d",i),".csv",sep="")))
    thisCleanCol<-thisFile[[pollutant]][!is.na(thisFile[[pollutant]])]
    res<-c(res,thisCleanCol)
  }
  mean(res)
}