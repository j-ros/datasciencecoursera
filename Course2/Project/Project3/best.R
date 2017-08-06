best <- function(state,outcome){
  #Read csv data
  data<-read.csv("outcome-of-care-measures.csv",
                 na.strings="Not Available",stringsAsFactors = F)
  
  #Check that state is valid
  if(!(state %in% data$State)) stop("invalid state")
  #Check that outcome is valid
  outcomes<-c("heart attack"=11,"heart failure"=17,"pneumonia"=23)
  if(!(outcome %in% names(outcomes))) stop("invalid outcome")
  
  #clean data to what i need
  goodCols<-c(2,7,outcomes[outcome])
  subsetData<-subset(data,State==state,select=goodCols)
  names(subsetData)<-c("hospital","state","outcome")
  subsetData<-subsetData[complete.cases(subsetData$outcome),]
  
  #order data by outcome then hospital name
  orderedData<-subsetData[order(subsetData$outcome,subsetData$hospital),]
  
  orderedData[1,1]
}