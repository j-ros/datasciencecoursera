#Set the working directory to the correct folder
setwd("~/DataScience/Git/datasciencecoursera/ExData/week4/project")

#Download files

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
dir<-"~/DataScience/Git/datasciencecoursera/ExData/week4/project/data.zip"
download.file(url,dir)
dateDownloaded<-date() #"Sat Apr 15 11:43:07 2017"
unzip(dir,exdir="data")

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#Quesion1
totalemission<-with(NEI,tapply(Emissions,year,sum))
png("plot1.png")
plot(names(totalemission),totalemission,xlab="Year",ylab="Total Emission")
abline(lm(totalemission~as.numeric(names(totalemission))))
dev.off()