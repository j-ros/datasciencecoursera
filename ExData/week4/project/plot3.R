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

#Question3
library(ggplot2)
subNEI<-subset(NEI,fips=="24510")
sum<-sapply(split(subNEI,list(subNEI$type,subNEI$year)),function(x){sum(x$Emissions)})
df<-data.frame(year=gsub("[A-Z.-]+","",names(sum)),type=gsub("[0-9.]+","",names(sum)),emissions=sum)
rownames(df)<-seq_along(rownames(df))
png("plot3.png")
ggplot(df,aes(year,emissions))+
  geom_point()+
  facet_grid(.~type)+
  stat_smooth(aes(as.numeric(year),emissions),method="lm",se=F)+
  labs(title="Emissions in Baltimore City")
dev.off()