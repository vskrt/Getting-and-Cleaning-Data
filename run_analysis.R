
library(reshape2)

# Read the training data

dataTrain <- read.table("./project/train/X_train.txt")
labelTrain <- read.table("./project/train/y_train.txt")
subjectTrain <- read.table("./project/train/subject_train.txt")



# Read the test data

dataTest <- read.table("./project/test/X_test.txt")
labelTest <- read.table("./project/test/y_test.txt") 
subjectTest <- read.table("./project/test/subject_test.txt")



# Merge the training and the test sets to create one data set.

allData <- rbind(dataTrain, dataTest)
allLabels <- rbind(labelTrain, labelTest)
allSubjects <- rbind(subjectTrain, subjectTest)




# Read features data

features <- read.table("./project/features.txt")



# Get the indices related to mean and standard deviation

meanStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])



# Keep only the variables related to mean and standard deviation

allData <- allData[, meanStd]



# Replace the original column names with descriptive ones, by removing
# and replacing some strings from the features dataset

# Remove "()"
names(allData) <- gsub("\\(\\)", "", features[meanStd, 2])

# Replace "-" with "."
names(allData) <- gsub("-", ".", names(allData))


# Read activities data

activities <- read.table("./project/activity_labels.txt")



# Convent activities to lowercase and replace "_" with "."

activities[, 2] <- tolower(gsub("_", ".", activities[, 2]))


# Use descriptive activity names to name the activities in the data set

activitiesLbl <- activities[allLabels[, 1], 2]
allLabels[, 1] <- activitiesLbl



# Rename column (V1) from allLabels to "activity" 

names(allLabels) <- "activity"



# Rename column (V1) from allSubjects to "subject"

names(allSubjects) <- "subject"


# Create a new data set with all variables

newData <- cbind(allSubjects, allLabels, allData)



# Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject by using "melt" and "dcast" functions
# from "reshape2" package

id.labels   = c("subject", "activity")
data.labels = setdiff(colnames(newData), id.labels)
melt.data = melt(newData, id = id.labels, measure.vars = data.labels)
tidy.data  = dcast(melt.data, subject + activity ~ variable, mean)


write.table(tidy.data, "tidyDataSet.txt")



