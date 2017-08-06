rankall <- function(outcome,num="best"){
  #Read csv data
  data<-read.csv("outcome-of-care-measures.csv",
                 na.strings="Not Available",stringsAsFactors = F)
  
  #Check that outcome is valid
  outcomes<-c("heart attack"=11,"heart failure"=17,"pneumonia"=23)
  if(!(outcome %in% names(outcomes))) stop("invalid outcome")
  
  #clean data to what i need and order state-outcome-name
  goodCols<-c(2,7,outcomes[outcome])
  subsetData<-subset(data,select=goodCols)
  names(subsetData)<-c("hospital","state","outcome")
  orderedData<-subsetData[order(subsetData$state,subsetData$outcome,subsetData$hospital),]
  
  #split in a list with each state in an element
  splitData<-split(orderedData,orderedData$state)
  
  #get num element from each list via sapply into a vector
  rank<-sapply(splitData,function(stateDF){
    #clean dataset from NA
    stateDF<-stateDF[complete.cases(stateDF$outcome),]
    #check num 
    if(num=="best") thisNum <- 1
    else if(num=="worst") thisNum <- nrow(stateDF)
    else thisNum <- num
    stateDF[thisNum,1]
    })
  
  #parse vector to build df and return it
  data.frame(hospital=rank,state=names(rank),row.names=names(rank))
}