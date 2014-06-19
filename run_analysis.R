#Get datasets in and Label the dataset with descriptive variable names
        #download the zip file and unzip it:
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile='fuci.zip',
              method="internal" )
        unzip("fuci.zip")
        #read in features to labels the data set with descriptive variable names.
        features<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

        # read in datasets and add subject id and activity id to the dataset 
        x_test<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/test/X_test.txt")
        y_test<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/test/y_test.txt")
        subject_test<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/test/subject_test.txt")
        test<-cbind(subject_test,y_test,x_test)
        colnames(test)<-c("subjid","actid",features[,2])

        x_train<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/train/X_train.txt")
        y_train<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/train/y_train.txt")
        subject_train<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/train/subject_train.txt")
        train<-cbind(subject_train,y_train,x_train)
        colnames(train)<-c("subjid","actid",features[,2])



        #read in activity name
        activity<-read.table("~/GitHub/Datagetclean/UCI HAR Dataset/activity_labels.txt")
        colnames(activity)<-c("actid","actname")        
#Merges the training and the test sets to create one data set.
        data<-rbind(train,test)

#Extracts only the measurements on the mean and standard deviation for 
#each measurement. 
        #split colnames by hyphen -
        cnames<-strsplit(colnames(data),'-')
        #a function to scan the colnames of dataframe, 
        #return the column number of the column which match the rule:
        # second part of the colname is mean() or std(), Or subjid or actid
        cnamemarch<-function(x){x[2]=="mean()"| x[2]=="std()" | x[1]=="subjid" | x[1]=="actid"}
        #get the column number
        m<-which(sapply(cnames,cnamemarch))
        #extracts these columns
        final<-data[,m]
        
        
#Uses descriptive activity names to name the activities in the data set
        #merge activity names into dataset. 
        #I don't change it as row name since it's not necessary
        final1<-merge(activity,final,by="actid")
        
        write.table(final1,file="UCIHARDATA.txt")
         
#Creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject. 
        library(reshape2)
        temp<-melt(final1,id.vars=c("actid","actname","subjid"))
        final2<-dcast(temp, subjid+actid+actname~variable,value.var="value",mean)
        # export to dataset 2
        write.table(final2,file="UCIHARDATA-AVE.txt")
        
        #remove objects will not be used again.
        remove(temp,m,final,activity,cnames,data,train,test,x_test,x_train,y_test,y_train,subject_test,subject_train,features)
        