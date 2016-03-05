## Reads in the activity codes and names their cols. These provide a 
## way to decode the test and training labels.

activity<-read.table("activity_labels.txt")
colnames(activity)<-c("activitynum", "activityname")

## Reads in 6 tables:
## testlabels and trainlabels contain the activity codes.
## testset and trainset contain the set of data
## subtest contains the test subject's ID.

testlabels<-read.table("test_labels.txt")
testset<-read.table("test_set.txt")
subtest<-read.table("subject_test.txt")

trainlabels<-read.table("train_labels.txt")
trainset<-read.table("train_set.txt")
subtrain<-read.table("subject_train.txt")

## Changes the column name for subtest and subtrain to "subject"

colnames(subtrain)<-"subject"
colnames(subtest)<-"subject"

## changes the column name for testlabels and trainlabels
## to "activity"
colnames(trainlabels)<-"activity"
colnames(testlabels)<-"activity"


## Reads in the table containing the list of features.

features<-read.table("features.txt")

## Sets features as the the column names of the 
## train and test sets.

colnames(trainset)<-features[,2]
colnames(testset)<-features[,2]

## Combines all the test data tables together
## and all the train data tables together.

fulltest<-cbind(subtest, testlabels, testset)
fulltrain<-cbind(subtrain, trainlabels, trainset)

## combines testset and trainset together by row.

combinedset<-rbind(fulltest, fulltrain)

## Searches for the subset of the columns that contain "mean"
## and "std", and combines them as a character vector, along with
## the columns "activity" and "subject".

sub_mean<-grep("mean", names(combinedset), value=TRUE)
sub_std<-grep("std", names(combinedset), value=TRUE)
finalvectors<-as.character(c("subject", "activity", sub_mean, sub_std))

## Generates a table with only the column names 
## that contain "mean" and "std".

combinedset2<-combinedset[ , finalvectors]

## Adds a column activity code with the name of the activity.

combinedset2 <- merge(activity, combinedset2, by.x="activitynum", by.y="activity", all.x=TRUE)


## Replaces the variable names with more descriptive names.

names(combinedset2)<-gsub("^t", "time", names(combinedset2))
names(combinedset2)<-gsub("^f", "frequency", names(combinedset2))
names(combinedset2)<-gsub("Acc", "Accelerometer", names(combinedset2))
names(combinedset2)<-gsub("Gyro", "Gyroscope", names(combinedset2))
names(combinedset2)<-gsub("Mag", "Magnitude", names(combinedset2))
names(combinedset2)<-gsub("BodyBody", "Body", names(combinedset2))
names(combinedset2)<-gsub("std()", "SD", names(combinedset2))
names(combinedset2)<-gsub("mean()", "MEAN", names(combinedset2))

## creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

finaldata = ddply(combinedset2, c("subject","activitynum"), numcolwise(mean))
write.table(finaldata, file = "finaldata.txt")
