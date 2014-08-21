##read files

subtest <- read.table("subject_test.txt")
ytest <- read.table("y_test.txt")
Xtest <- read.table("X_test.txt")
subtrain <- read.table("subject_train.txt")
ytrain <- read.table("y_train.txt")
Xtrain <- read.table("X_train.txt")
features <- read.table("features.txt")

##check dimensions

dim(subtest)
dim(ytest)
dim(Xtest)
dim(subtrain)
dim(ytrain)
dim(Xtrain)
dim(features)

##column bind test data (number of rows identical)
test <- cbind(subtest, ytest, Xtest)

##column bind train data
train <- cbind(subtrain, ytrain, Xtrain)

##row bind train, test
traintest <- rbind(train, test)

##transpose feature columns to rows
features_row <- t(features)

##convert matrix back to data frame
features_df<-as.data.frame(features_row,stringsAsFactors=F)

##select row 2 of data frame (i.e. row containing names)
features_headings <- features_df[2,]

##add subject and activity headings
headings <- cbind("subject", "activity")
headings_df <- as.data.frame(headings, stringsAsFactors=F)

##bind all headings 
feature <- cbind(headings_df, features_headings)

##add headings to traintest data frame
colnames(traintest) <- feature[1,]

##identify mean and sd column indices 
traintest_mean_sd <- grep("mean\\(|std|activity|subject",
colnames(traintest))
##check meanFreq not present by comparing:
traintest_remove <- grep("meanFreq", colnames(traintest))

##subset traintest by traintest_mean_sd
traintest_msd <- traintest[,traintest_mean_sd]

##replace numbers 1-6 with activity names
traintest_msd$activity[traintest_msd$activity == 1]<-"Walking"
traintest_msd$activity[traintest_msd$activity == 2]<-"WalkingUp"
traintest_msd$activity[traintest_msd$activity == 3]<-"WalkingDown"
traintest_msd$activity[traintest_msd$activity == 4]<-"Sitting"
traintest_msd$activity[traintest_msd$activity == 5]<-"Standing"
traintest_msd$activity[traintest_msd$activity == 6]<-"Laying"
	
##tidy up variable names using gsub
tidy1 <- gsub("BodyBody",replacement="Body",colnames(traintest_msd))
tidy2 <- gsub("-mean\\(\\)-",replacement="Mean",tidy1)
tidy3 <- gsub("-std\\(\\)-",replacement="Std",tidy2)
tidy4 <- gsub("Gravity",replacement="Grav",tidy3)
tidy5 <- gsub("AccJerk",replacement="Jerk",tidy4)
tidy6 <- gsub("-mean\\(\\)",replacement="Mean",tidy5)
tidy7 <- gsub("-std\\(\\)",replacement="Std",tidy6)

##use as column headings
colnames(traintest_msd) <- tidy7

##use aggregate to find mean for each column by activity and subject
agg_traintest <- aggregate(traintest_msd[,3:68], by = list(
traintest_msd$subject, traintest_msd$activity), "mean")

##write data frame into text file
write.table(agg_traintest, "tidy.txt", row.name = FALSE)

