dateDownloaded<-date() #"Thu Apr 06 20:08:39 2017"

#Question1

#Download csv file adn read it
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week4/quiz4/data.csv"
data<-download.file(url,dir)
idaho<-read.csv("data.csv")
splitNames<-strsplit(names(idaho),"wgtp")
splitNames[[123]]
#[1] ""   "15"

#Question2
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week4/quiz4/data2.csv"
data<-download.file(url,dir)
gdp<-read.csv("data2.csv",na.strings="",skip=5,header=F,nrows=190)
#Clean this file
gdp<-gdp[,5] #GDP
gdp<-as.numeric(gsub(",","",gdp))
#Get mean value
mean(gdp)
#[1] 377652.4

#Question3
gdp<-read.csv("data2.csv",na.strings="",skip=5,header=F,nrows=190)
countryNames<-gdp[,4] #CountryName
length(grep("^United",countryNames))
#[1] 3

#Question4

#First data set it data2.csv
gdp<-read.csv("data2.csv",na.strings="",skip=5,header=F,nrows=190)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week4/quiz4/data3.csv"
data<-download.file(url,dir)
edu<-read.csv("data3.csv")
#Matching column is gdp$V1 and edu$CountryCode
mergedDF<-merge(gdp,edu,by.x="V1",by.y="CountryCode",all=TRUE)
fiscalYearAvailable<-mergedDF[grep("^Fiscal year end:",mergedDF$Special.Notes),]
nrow(fiscalYearAvailable[grep("June",fiscalYearAvailable$Special.Notes),])
#[1] 13

#Question5

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
library(lubridate)
sum(year(sampleTimes)==2012)
#[1] 250
sum(wday(sampleTimes[year(sampleTimes)==2012])==2)
#[1] 47