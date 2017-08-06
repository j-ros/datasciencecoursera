#Read data
data<-read.csv("payments.csv")

#Question1
subny<-subset(data,data$Provider.State=="NY")
pdf("plot1.pdf")
with(subny,plot(Average.Covered.Charges,Average.Total.Payments,
                xlab="Average Covered Charges ($)",
                ylab="Average Total Payments ($)",
                main="Relation between Average Covered Charges and\n Average Total Payments in Ney York state",
                pch=16, col=rgb(0,0,0,0.3)))
with(subny,abline(lm(Average.Total.Payments~Average.Covered.Charges)))
dev.off()

#Question2
#Set limits of plotting variables
min.width=trunc(min(data$Average.Covered.Charges))
max.width=ceiling(max(data$Average.Covered.Charges))
min.length=trunc(min(data$Average.Total.Payments))
max.length=ceiling(max(data$Average.Total.Payments))
DRG.level<-substr(levels(data$DRG.Definition),1,3)

pdf("plot2.pdf")
par(mfrow=c(6,6))
par(cex = 0.6)
par(mar = c(0, 0, 0, 0), oma = c(4, 4, 8, 2))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))

for( i in 1:6 ){
  for( j in 1:6 ){
    with(data[(data$DRG.Definition==levels(data$DRG.Definition)[i])&
                (data$Provider.State==levels(data$Provider.State)[j]),],
         plot(Average.Covered.Charges,Average.Total.Payments,
              axes=FALSE,xlim=c(min.width,max.width),ylim=c(min.length,max.length),
              pch=16, col=rgb(0,0,0,0.3),xlab="",ylab=""))
    mtext(paste(DRG.level[i],levels(data$Provider.State)[j],sep="-"),side=3,line=-1,adj = 0.1, cex = 0.6,col = "grey40")
    if(j==1 & i%%2==0){axis(2, col = "grey40", col.axis = "grey20", at = seq(min.length, max.length, length.out=3))}
    if(j==6 & i%%2==1){axis(4, col = "grey40", col.axis = "grey20", at = seq(min.length, max.length, length.out=3))}
    if(i==6 & j%%2==0){axis(1, col = "grey40", col.axis = "grey20", at = seq(min.width, max.width, length.out=3))}
    if(i==1 & j%%2==1){axis(3, col = "grey40", col.axis = "grey20", at = seq(min.width, max.width, length.out=3))}
    with(data[(data$DRG.Definition==levels(data$DRG.Definition)[i])&
                (data$Provider.State==levels(data$Provider.State)[j]),],
         abline(lm(Average.Total.Payments~Average.Covered.Charges)))
    box(col = "grey60")
  }
  
}
mtext("Average Covered Charges ($)", side=1, outer=T, at=0.5,cex = 0.7, line = 2.2,col = "grey20")
mtext("Average Total Payments ($)", side=2, outer=T, at=0.5,cex = 0.7, line = 2.2,col = "grey20")
mtext("Relation between Average Covered Charges and Average Total Payments\n
      by Medical Condition - Provider State (codes in each panel)",side=3,outer=T,at=0.5,cex=1,line=2.2,col="grey20")
dev.off()