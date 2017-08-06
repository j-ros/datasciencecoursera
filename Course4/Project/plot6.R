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

#Question6
scc_codes<-SCC[grep("Veh",SCC$Short.Name),1]
subNEI_balt<-subset(NEI,SCC%in%scc_codes & fips=="24510")
subNEI_la<-subset(NEI,SCC%in%scc_codes & fips=="06037")
totalemission_balt<-with(subNEI_balt,tapply(Emissions,year,sum))
totalemission_la<-with(subNEI_la,tapply(Emissions,year,sum))
png("plot6.png")
par(mfrow=c(1,2))
plot(names(totalemission_balt),totalemission_balt,xlab="Year",
     ylab="Total Vehicle Emission in Baltimore City",col="blue")
abline(lm(totalemission_balt~as.numeric(names(totalemission_balt))))
plot(names(totalemission_la),totalemission_la,xlab="Year",
     ylab="Total Vehicle Emission in Los Angeles",col="red")
abline(lm(totalemission_la~as.numeric(names(totalemission_la))))
dev.off()