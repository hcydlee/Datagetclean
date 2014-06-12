#1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile='Idaho',
              method="internal" )
idaho<-read.csv("Idaho",header=TRUE)
k<-idaho[idaho$TYPE==1&idaho$VAL==24,]
table(k$RT)

#3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
              destfile='gas.xlsx',
              method="internal" )
library(xlsx)
dat<-read.xlsx("gas.xlsx",1,colIndex=7:15,rowIndex=18:23)
sum(dat$Zip*dat$Ext,na.rm=T) 

#4
library(XML)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
              destfile='restaurants.xml',
              method="internal" )
doc<-xmlTreeParse('restaurants.xml')
res<-xmlRoot(doc)
zip<-getNodeSet(res,"//zipcode")
zipcode<-sapply(zip,xmlValue)
table(zipcode)
