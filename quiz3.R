#1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile='Idaho',
              method="internal" )
idaho<-read.csv("Idaho",header=TRUE)
agricultureLogical<-idaho$ACR==3 & idaho$AGS==6
which(agricultureLogical)[c(1:3)]


#2
library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",
              destfile='Fjeff.jpg',
              method="internal" )

Fjeff<-readJPEG("Fjeff.jpg",native=TRUE)

quantile(Fjeff,probs=c(0.3,0.8))


#3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile='FGDP.csv',
              method="internal")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile="EDU.csv",
              method="internal")

FGDP<-read.csv("FGDP.csv",skip=4,nrows=231,stringsAsFactors=FALSE)
FGDP<-FGDP[FGDP$X!='',]
EDU<-read.csv("EDU.csv",stringsAsFactors=FALSE)
colnames(FGDP)<-c("CountryCode","rank","a","name","gdp","b","c","d","e","f")
library(plyr)
FGDP<-arrange(FGDP,X)
data<-merge(EDU,FGDP,by="CountryCode")
data<-arrange(data,desc(rank))
data[13,"name"]


#4
data$incomeg<-as.factor(data$Income.Group)
tapply(data$rank,data$incomeg,mean,na.rm=TRUE)


#5
library(Hmisc)
data$qg<-cut2(data$rank,g=5)
table(data$incomeg,data$qg)
