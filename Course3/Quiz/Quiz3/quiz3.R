#Question1

dateDownloaded<-date() #"Sun Apr 02 13:00:11 2017"
#Download csv file adn read it
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week3/data.csv"
data<-download.file(url,dir)
idaho<-read.csv("data.csv")
#compute logical variable and print TRUE results
agricultureLogical<-idaho$ACR==3&idaho$AGS==6
which(agricultureLogical)
#125, 238,262

#Question2

#Load package, download file and read it 
library(jpeg)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg "
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week3/data.jpg"
data<-download.file(url,dir,mode="wb") #use mode="wb" since its binary file
pic<-readJPEG("data.jpg",native=TRUE)
#30th and 80th quantiles
quantile(pic,probs=c(.3,.8)) 
#        30%       80% 
#  -15259150 -10575416

#Question3

#Download and load files into R
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week3/data2.csv"
data<-download.file(url,dir)
gdp<-read.csv("data2.csv",na.strings="",skip=5,header=F)
#Clean this file
gdp<-gdp[,c(1,2,4,5)]
names(gdp)<-c("CountryCode","Rank","CountryName","GDP")
gdp<-gdp[complete.cases(gdp),]
gdp$GDP<-as.numeric(gsub(",","",gdp$GDP))
gdp$Rank<-as.numeric(levels(gdp$Rank))[gdp$Rank] # cannot do as.numeric() to a factor variable
arrange(gdp,desc(Rank))[13,]$CountryName
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week3/data3.csv"
data<-download.file(url,dir)
edu<-read.csv("data3.csv")
length(intersect(gdp$CountryCode,edu$CountryCode)) #189

#Question4

#Merge both datasets by CountryCode and group by Income.Group
library(dplyr)
mergedData<-merge(gdp,edu,by.x="CountryCode",by.y="CountryCode",all=FALSE)
groupData<-group_by(mergedData,Income.Group)
summarize(groupData,mean(Rank)) 
#alternatively use tapply(groupData$Rank,groupData$Income.Group,mean)
#1 High income: nonOECD     91.91304
#2    High income: OECD     32.96667

#Question5

groupData$RankGroup<-cut(groupData$Rank,breaks=quantile(groupData$Rank,probs=seq(0,1,by=0.2)),
    labels=c("0-20","20-40","40-60","60-80","80-100"),include.lowest = TRUE)
table(groupData$RankGroup,groupData$Income.Group) #5, high GDP is low Rank
#alternatively:
#groupData<-mutate(groupData,RankGroup=cut(Rank,breaks=quantile(groupData$Rank,
#           probs=seq(0,1,by=0.2)),labels=c("0-20","20-40","40-60","60-80",
#           "80-100"),include.lowest=TRUE))