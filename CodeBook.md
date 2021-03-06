# **CodeBooK**

* Read X_train.txt, y_train.txt, subject_train.txt from ./project/train folder and store them in dataTrain, labelTrain and subjectTrain respectively.

* Read X_test.txt, y_test.txt, subject_test.txt from ./project/test folder and store them in dataTest, labelTest and subjectTest respectively.

* Create a dataframe allData by merging dataTrain and dataTest

* Create a dataframe allLabels by merging labelTrain and labelTest

* Create a dataframe allSubjects by merging subjectTrain and subjectTest

* Read features.txt from ./project folder and store it in features

* Get the indices that are related to mean and standard deviation and store them in meanStd

* Keep the subset of allData according to the indices of meanStd

* Replace column names of allData with the ones of features.

* From column names remove "()" and replace "-" with "."

* Read activity_labels.txt and store them in activities

* Convert activities to lower case and replace "_" with "."

* Replace the values of allLabels with the ones of activities

* Replace column names of allLabels and allSubjects with "activity" and "subject" respectively

* Combine allSubjects, allLabels and allData to create a new data frame called newData

* In the newData dataframe the subject column contains integers range from  to 30, the activity column contains the activity names (6) and the last columns (66) contains the measurements

* Using the "reshape2" package, create an new tidy data set, the has the average of each measurement for each activity and each subject.

* This tidy data set is written to a file named tidyDataSet.txt
