#1

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "38cbb2094498509cdde2",'904560f86e19ad1d28ed4d9a62538d44e227b630')
library(httpuv)
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
js1<-content(req)
library(jsonlite)
js2=jsonlite::fromJSON(toJSON(js1))
js2[js2$name=='datasharing',]$created_at


#2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
              destfile='acs.csv',
              method="internal" )
acs<-read.csv("acs.csv")
install.packages("sqldf")
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")

#3
a<-sqldf("select distinct AGEP from acs")

#4
link<-url("http://biostat.jhsph.edu/~jleek/contact.html")
page<-readLines(link)
nchar(page[c(10,20,30,100)])


#5

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",destfile="wk.for",method="internal")
data<-read.fortran("wk.for",format=c("X1","A9","X5","F4","F4","X5","F4","F4","X5","F4","F4","X5","F4","F4"),skip=4)
sum(data[,4])
