
#1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile='Idaho',
              method="internal" )
idaho<-read.csv("Idaho",header=TRUE)
names<-colnames(idaho)
a<-strsplit(names,'wgtp')
a[[123]]

#2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile='FGDP.csv',
              method="internal")
FGDP<-read.csv("FGDP.csv",skip=4,nrows=190,stringsAsFactors=FALSE)[,5]
gdp<-as.numeric(gsub(',','',FGDP))
mean(gdp)

#3
country<-read.csv("FGDP.csv",skip=4,nrows=190,stringsAsFactors=FALSE)[,4]
sum(grepl("^United",country))

#4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile="EDU.csv",
              method="internal")
EDU<-read.csv("EDU.csv",stringsAsFactors=FALSE)
colnames(FGDP)<-c("CountryCode","rank","a","name","gdp","b","c","d","e","f")
data<-merge(EDU,FGDP,by="CountryCode")
sum(grepl("[Ff]iscal year end.+[J]une",data$Special.Notes))

$5
library(quantmod)
library(gdata)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sum(getYear(sampleTimes)=='2012')
sum(weekdays(sampleTimes)=='星期一' & getYear(sampleTimes)=='2012')
