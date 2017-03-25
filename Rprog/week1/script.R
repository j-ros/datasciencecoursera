setwd("C:/Users/Jesus/Documents/DataScience/Git/datasciencecoursera/Rprog/quiz1")

data<-read.csv("hw1_data.csv")

data[1:2,]
nrow(data)
data[152:153,]
data[47,]$Ozone

sum(is.na(data$Ozone))
mean(data$Ozone[!is.na(data$Ozone)])

clean<-data[complete.cases(data),]
subset<-clean[clean$Ozone>31 & clean$Temp > 90,]
mean(subset$Solar)

subset<-data[data$Month==6,]
mean(subset$Temp)

substet<-data[data$Month==5,]
clean<-substet$Ozone[!is.na(substet$Ozone)]
max(clean)