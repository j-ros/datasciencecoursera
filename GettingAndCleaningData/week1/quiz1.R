dateDownloaded<-date() #"Fri Mar 31 17:33:44 2017"

#Download csv file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week1/data.csv"
data<-download.file(url,dir)
table<-read.csv("data.csv")
sum(table$VAL[!is.na(table$VAL)]==24)

#Download excel file
library(xlsx)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week1/data.xlsx"
data<-download.file(url,dir,mode="wb") #add mode because default is binary
dat<-read.xlsx("data.xlsx",sheetIndex=1,rowIndex=18:23,colIndex=7:15)

#Download xml file
library(XML)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week1/data.xml"
data<-download.file(url,dir)
xmlObj<-xmlParse("data.xml")
root<-xmlRoot(xmlObj)
sum(xpathSApply(root,"//zipcode",xmlValue)=="21231")

#Download csv file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week1/data2.csv"
data<-download.file(url,dir)
library(data.table)
DT<-fread("data2.csv")
DT[,mean(pwgtp15),by=SEX]

