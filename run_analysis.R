

#Code for creating tidy data from the HRA dataset

#Setting up for loading the input files
    activity_labels <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
    subject_test <- read.table("subject_test.txt")
    subject_train <- read.table("subject_train.txt")
    X_test <- read.table("X_test.txt")
    X_train <- read.table("X_train.txt")
    y_test <- read.table("y_test.txt")
    y_train <- read.table("y_train.txt")
    ls()

#Step1. Merging the training and the test sets to create one dataset:
    MainData <- rbind(X_test, X_train)

#testing if number of rows of MainData is the sum of those for X_test and X_train.
    temp1 <- dim(MainData) 
    temp2 <- dim(X_test)
    temp3 <- dim(X_train)
    temp1[[1]] == (temp2[[1]] + temp3[[1]])

#Step 2: Extracting the columns with only the mean and standard deviation for each measurement.  
    MeanCols <- grep("mean()", as.character(features$V2))
    StdCols <- grep("std()", as.character(features$V2))
    MeanStdCols <-sort(c(MeanCols, StdCols))
    library(dplyr)
    FilteredData <- select(MainData, MeanStdCols)
    Dims <- dim(FilteredData)
    Dims[2] == length(MeanStdCols)

#Step3: Providing descriptive activity names for the activities in the data set.
    substitute <- function(x){index <- x
     x <- as.character(activity_labels$V2[index])
    }
    ActLblTest <- sapply(y_test, substitute)
    ActLblTrain <- sapply(y_train, substitute)
    Activity <- c(ActLblTest, ActLblTrain)
    dim(FilteredData)
    FilteredData <- cbind(Activity, FilteredData)
    dim(FilteredData)
    str(FilteredData)

#Step 4: Appropriately labeling the data set with descriptive variable names.
    SubsetFeatures <- features$V2[MeanStdCols]
    SubsetFeatures <- c("Activity", as.character(SubsetFeatures))
    colnames(FilteredData) <- SubsetFeatures
    str(FilteredData) 


###Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
    Subject <- factor(c(subject_test$V1, subject_train$V1))
    
#Add this column to FilteredData
    FilteredData <- cbind(Subject, FilteredData)
    
#convert to a Data Table
    library(data.table)
    DataTable <- data.table(FilteredData)
    SubjectActivitySummary <- DataTable[ , lapply(.SD,mean), by = list(Subject, Activity)]

#Naming the columns of SubjectActivitySummary  
    CurrColNames <- colnames(SubjectActivitySummary)
    str(CurrColNames)
    pasteMean <- function(x){
    	y <- c("MEAN", x)
    	paste0(y, collapse="-")
    	}
    NewColNames <- lapply(CurrColNames[3:81],pasteMean )
    NewColNames <- c(CurrColNames[1:2], NewColNames[1:79])
    NewColNames <- unlist(NewColNames)
    OldColNames <- colnames(SubjectActivitySummary)

#checking if the column names look right, setting the column names.
    head(NewColNames,10)
    setnames(SubjectActivitySummary, OldColNames, as.character(NewColNames))
    
#Creeating Tidy data and writing the output
	  library(reshape2)
  	TidySummary <- melt(SubjectActivitySummary, id.vars = c("Subject", "Activity"), variable.name = "Feature Name", value.name = "Value")	
  	str(TidySummary)
    head(TidySummary)  
    write.table(TidySummary, file = "TidySummary.txt", row.name = FALSE)


