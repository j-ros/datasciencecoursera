#Set the working directory to the correct folder
setwd("~/DataScience/Git/datasciencecoursera/RegModels/week3/practise")

#Download files

url<-"https://d3c33hcgiwev3.cloudfront.net/_cf0fd3361e05f5be5304b07b771bad48_companydata.csv?Expires=1493769600&Signature=hFuGIE4ROQ9-VZrQKzg0d-Bc3hAnsmB0j8V76-m~rdwZ1keU2sZlPo20h59Y6q9KMx8LSFF6iZljaYlhyysJonh9CqRuiv~JyXqob-ymdvX0fRsQb~Su7BFTELvxM2LvcRQVQYdTtUukxshaLNuqaI~rNemW9NU4hpoDeoOg2Ss_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A"
dir<-"~/DataScience/Git/datasciencecoursera/RegModels/week3/practise/data.csv"
download.file(url,dir)
dateDownloaded<-date() #"Mon May 01 13:25:11 2017"

data<-read.csv("data.csv")
head(data)

#compare several models
fit<-lm(y~x1,data)
summary(fit)
fit2<-lm(y~x1+x2,data)
fit3<-lm(y~x1+x2+x3,data)
anova(fit,fit2,fit3)
fit4<-lm(y~x1+x3,data)
anova(fit,fit4)

#selected model2, from anova test
summary(fit2)
round(fit2$coefficients[2],6) #x1 coeff
confint(fit2) #confidence interval for x1 coeff
summary(fit2)$coef[11] #p-value for x1 coeff
