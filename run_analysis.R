subject_test<-read.table("UCI HAR Dataset\\test\\subject_test.txt",header=FALSE)
X_test<-read.table("UCI HAR Dataset\\test\\X_test.txt",header=FALSE)
Y_test<-read.table("UCI HAR Dataset\\test\\Y_test.txt",header=FALSE)
subject_train<-read.table("UCI HAR Dataset\\train\\subject_train.txt",header=FALSE)
X_train<-read.table("UCI HAR Dataset\\train\\X_train.txt",header=FALSE)
Y_train<-read.table("UCI HAR Dataset\\train\\Y_train.txt",header=FALSE)
features<-read.table("UCI HAR Dataset\\features.txt",header=FALSE)
activity<-read.table("UCI HAR Dataset\\activty_labels.txt",header=FALSE)
X_final<-rbind(X_test,X_train)
Y_final<-rbind(Y_test,Y_train)
subject_final<-rbind(subject_test,subject_train)

names(X_fina)<-features$V2
colind<-grep("std\\(\\)|mean\\(\\)",colnames(X_final))
X_subset<-X_final[,colind]

names(Y_final)<-c("Activity")
names(subject_final)<-c("Subject")
temp<-cbind(X_subset,subject_final)
data<-cbind(temp,Y_final)
library("reshape2")

p<-melt(data,id=c("Activity","Subject"))
tidy<-dcast(p, Subject + Activity ~ variable, fun.aggregate=mean)
tidy$Activity<-activity[tidy$Activity,2]
names(tidy)<-gsub("(\\W)","\\L",names(tidy),perl=TRUE)
write.table(tidy, file = "my.df.txt", col.names = colnames(tidy))
