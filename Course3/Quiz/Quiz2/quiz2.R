#Question1

#Read file from GitHub API, its JSON format
library(httr)
myapp<-oauth_app("github",key="d22068ab6279560d42f2",
                  secret="68191eaffbb5f3ec037e983d9ffe6a4fe3c89875")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1<-content(req)
#Convert to data frame with jsonlite package
library(jsonlite)
json2<-fromJSON(toJSON(json1))
#find created data for repo named datasharing
json2$created_at[json2$name=="datasharing"]
#"2013-11-07T13:25:07Z"

#Question2+3

dateDownloaded<-date() #"Sat Apr 01 13:49:14 2017"
#Download csv file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
dir<-"~/DataScience/Git/datasciencecoursera/GettingAndCleaningData/week2/data.csv"
data<-download.file(url,dir)
acs<-read.csv("data.csv")
#load sqldf package and do the select statements on it
library(sqldf) #need to detach(package:RMySQL) for sqldf to work
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")

#Question4

#access html Data 
con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlFile<-readLines(con) #returns a character vector with length 
                         #the number of lines read
nchar(htmlFile[c(10,20,30,100)]) #return number of characters for each line
#[1] 45 31  7 25

#Question5

#read data using read.fwf() for fixed width files, creating a connexion
#to the url using file(), and skipping first 4 lines
data <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip=4, 
  col.names=c("Week","Nino12SST","Nino12SSTA","Nino3SST","Nino3SSTA"
             ,"Nino34SST","Nino34SSTA","Nino4SST","Nino4SSTA"),
  widths=c(10, 9, 4, 9, 4, 9, 4, 9, 4))
sum(data[4]) #32426.7



