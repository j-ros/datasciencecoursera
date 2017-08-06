#Set the working directory to the correct folder
setwd("~/DataScience/Git/datasciencecoursera/RR/week4/project")

#Download files

if(!dir.exists("data")){dir.create("data")}
url<-"https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
dir<-"~/DataScience/Git/datasciencecoursera/RR/week4/project/data/data.csv.bz2"
download.file(url,dir)
dateDownloaded<-date() #"Mon Apr 17 11:32:41 2017"

#Read file
stormData<-read.csv("data/data.csv.bz2",na.strings="",
                    nrows=902297,stringsAsFactors = FALSE)
stormSS<-stormData[,c(8,23:28)] #subset relevant variables

#save useful variables for efficiency when reading
write.csv(stormSS,file="data/stormSS.csv",row.names = FALSE) 


#read this only
stormSS<-read.csv("data/stormSS.csv",stringsAsFactors = FALSE,nrows=902297)
stormSS$EVTYPE<-as.factor(stormSS$EVTYPE) #convert event type to factor

unique(stormSS$PROPDMGEXP); unique(stormSS$CROPDMGEXP)
nrow(stormSS)
sum(stormSS[!is.na(stormSS$PROPDMGEXP),]$PROPDMGEXP=="+")
sum(stormSS[!is.na(stormSS$PROPDMGEXP),]$PROPDMGEXP=="?")
sum(stormSS[!is.na(stormSS$PROPDMGEXP),]$PROPDMGEXP=="-")
sum(stormSS[!is.na(stormSS$CROPDMGEXP),]$CROPDMGEXP=="?")

#Convert fields
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="B"]<-10^9
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="M"]<-10^6
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="m"]<-10^6
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="K"]<-10^3
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="H"]<-10^2 
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="h"]<-10^2 
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="0"]<-10^0
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="5"]<-10^5
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="6"]<-10^6
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="4"]<-10^4
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="2"]<-10^2
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="3"]<-10^3
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="7"]<-10^7
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="1"]<-10^1
stormSS$PROPDMGMULT[stormSS$PROPDMGEXP=="8"]<-10^8

stormSS$CROPDMGMULT[stormSS$CROPDMGEXP=="B"]<-10^9
stormSS$CROPDMGMULT[stormSS$CROPDMGEXP=="M"]<-10^6
stormSS$CROPDMGMULT[stormSS$CROPDMGEXP=="m"]<-10^6
stormSS$CROPDMGMULT[stormSS$CROPDMGEXP=="K"]<-10^3
stormSS$CROPDMGMULT[stormSS$CROPDMGEXP=="k"]<-10^3
stormSS$CROPDMGMULT[stormSS$CROPDMGEXP=="0"]<-10^0
stormSS$CROPDMGMULT[stormSS$CROPDMGEXP=="2"]<-10^2

stormSS$PROPDMGCASH<-stormSS$PROPDMG*stormSS$PROPDMGMULT
stormSS$CROPDMGCASH<-stormSS$CROPDMG*stormSS$CROPDMGMULT

#sums by EVTYPE
library(dplyr)
stormSum<-stormSS %>% group_by(EVTYPE) %>% 
        summarise(fatalities=sum(FATALITIES),injuries=sum(INJURIES),
                  propdmg=sum(PROPDMGCASH),cropdmg=sum(CROPDMGCASH))

fatalities<-stormSum[order(stormSum$fatalities,decreasing = T),][1:5,c(1,2)]#fatalities
injuries<-stormSum[order(stormSum$injuries,decreasing = T),][1:5,c(1,3)]#injuries
propdmg<-stormSum[order(stormSum$propdmg,decreasing = T),][1:5,c(1,4)]#propdmg
cropdmg<-stormSum[order(stormSum$cropdmg,decreasing = T),][1:5,c(1,5)]#cropdmg

par(mfrow=c(2,1))
par(cex = 0.5)
par(mar = c(2, 0, 2, 0), oma = c(0, 0, 0, 0))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))
barplot(fatalities$fatalities,names.arg=as.array(fatalities$EVTYPE),horiz=F,yaxt='n',
        main="Top 5 Number of Fatalities per Event type")
barplot(injuries$injuries,names.arg=as.array(injuries$EVTYPE),horiz=F,yaxt='n',
        main="Top 5 Number of Injuries per Event type")

par(mfrow=c(2,1))
par(cex = 0.5)
par(mar = c(2, 0, 2, 0), oma = c(0, 0, 0, 0))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))
barplot(propdmg$propdmg,names.arg=as.array(propdmg$EVTYPE),horiz=F,yaxt='n',
        main="Top 5 Amount of Property Damage per Event type")
barplot(cropdmg$cropdmg,names.arg=as.array(cropdmg$EVTYPE),horiz=F,yaxt='n',
        main="Top 5 Amount of Crop Damage per Event type")

#TODO
#1.Create variables for propdmg and cropdmg multiplying by prop(crop)dmgexp
#2.Make summaries/plots by EVTYPE to answer questions
#3.Make 2 2-panel barplots showing number of fatalities/deaths for each EVTYPE
#       and prop/cropdmg for each EVTYPE (or maybe only the most relevant)
