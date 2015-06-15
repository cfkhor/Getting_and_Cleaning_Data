# 1. Merges the training and the test sets to create one data set.

x_train1 <- read.table("train/X_train.txt")
x_test1<- read.table("test/X_test.txt")
X <- rbind(x_train1, x_test1)


s_train1 <- read.table("train/subject_train.txt")
s_test1 <- read.table("test/subject_test.txt")
S <- rbind(s_train1, s_test1)


y_train1 <- read.table("train/y_train.txt")
y_test1 <- read.table("test/y_test.txt")
Y <- rbind(y_train1, y_test1)


#2.  2. Extracts only the measurements on the mean and standard deviation for each measurement.

F <- read.table("features.txt")
good_features <- grep("-mean\\(\\)|-std\\(\\)", F[, 2])
X <- X[, good_features]
names(X) <- F[good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


# 3. Uses descriptive activity names to name the activities in the data set.

ACT <- read.table("activity_labels.txt")
ACT[, 2] = gsub("_", "", tolower(as.character(ACT[, 2])))
Y[,1] = ACT[Y[,1], 2]
names(Y) <- "activity"


# 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "cleaned_merge_data.txt")

#5. Create a 2nd, independent tidy data set with the average of each variable for each activity and each subject

uSubjects=unique(S)[,1]
noSubjects=length(unique(S)[,1])
noActivities=length(ACT[,1])
noCols=dim(cleaned)[2]
results=cleaned[1:(noSubjects*noActivities),]

row=1
for(s in 1:noActivities) {
	for (a in 1:noActivities) {
		results[row,1]= uSubjects[s]
		results[row,2]= ACT[a,2]
		temp<- cleaned[cleaned$subject==s & cleaned$activity==ACT[a,2],]
		results[row, 3:noCols] <-colMeans(temp[, 3:noCols])
		row=row+1
	}
}

write.table(results, "dataset_with_avg_var.txt")