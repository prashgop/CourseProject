# This is a function which performs analysis on Data collected from 
# source mentioned in Course project of "Getting and Cleaning Data"
# The steps performed are listed below
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function(){
	#Read the downloaded dataset from Data/UCIHARDataset folder
	sub_text_test <- read.table("./Data/UCIHARDataset/test/subject_test.txt")
	X_text_test <- read.table("./Data/UCIHARDataset/test/X_test.txt")
	y_text_test <- read.table("./Data/UCIHARDataset/test/y_test.txt")
	sub_text_train <- read.table("./Data/UCIHARDataset/train/subject_train.txt")
	X_text_train <- read.table("./Data/UCIHARDataset/train/X_train.txt")
	y_text_train <- read.table("./Data/UCIHARDataset/train/Y_train.txt")
	features<-read.table("./Data/UCIHARDataset/features.txt")
	LabelNames <- read.table("./Data/UCIHARDataset/activity_labels.txt")
	
	#Setting the column headers
	colnames(X_text_test)<-features$V2
 	colnames(X_text_train)<-features$V2
	colnames(y_text_test)<-"ActivityLabel"
	colnames(y_text_train)<-"ActivityLabel"
	colnames(sub_text_train)<-"SubjectId"
	colnames(sub_text_test)<-"SubjectId"
	
	#Filter out the features except mean and std
	SelectedX_test<-X_text_test[,grepl('\\bmean\\b|std',names(X_text_test))]
	SelectedX_train<-X_text_train[,grepl('\\bmean\\b|std',names(X_text_train))]

	#Merge features, label and subject
	test_data_con<- cbind(sub_text_test,SelectedX_test,y_text_test)
	train_data_con<- cbind(sub_text_train,SelectedX_train,y_text_train)

	#Combine test and train datasets
	CombinedX<- rbind(test_data_con,train_data_con)
	
	#Make descriptive names for Activity info variable
	CombinedX$ActivityLabel<-as.factor(CombinedX$ActivityLabel)
	levels(CombinedX$ActivityLabel)<-LabelNames$V2

	#Make descriptive names for filtered variables
	names(CombinedX)<-gsub("\\(\\)|-", "", names(CombinedX))
	
	#Compute the average of each subjectid for each activity for feature
	tidyAverage <- aggregate(.~SubjectId+ActivityLabel, FUN=mean, data=CombinedX)
}
