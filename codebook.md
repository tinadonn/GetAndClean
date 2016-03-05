CodeBook
This code book describes the dataset, variables, and transformations to clean up the data.
Dataset Information
The experiments were carried out on 30 volunteers ages 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
The data are found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
A description of the dataset is found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset
The dataset includes the following files:
•	'README.txt'
•	'features_info.txt': Shows information about the variables used on the feature vector.
•	'features.txt': List of all features.
•	'activity_labels.txt': Links the class labels with their activity name.
•	'train/X_train.txt': Training set.
•	'train/y_train.txt': Training labels.
•	'test/X_test.txt': Test set.
•	'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent.
•	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
•	'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
•	'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
•	'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
Transforming the Data
There are 5 parts:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Transformations in Hw4.R
•	Reads in the activity codes and names their columns
•	Reads in 6 tables: testlabels and trainlabels contain the activity codes. testset and trainset contain the set of data subtest contains the test subject's ID.
•	Changes the column name for subtest and subtrain to "subject" and changes the column name for testlabels and trainlabels to "activity"
•	 Reads in the table containing the list of features. Sets features as the column names of the train and test sets.
•	 Combines all the test data tables together and all the train data tables together. Then combines testset and trainset together by row.
•	 Searches for the subset of the columns that contain "mean" and "std", and combines them as a character vector, along with the columns "activity" and "subject".
•	 Generates a table with only the column names that contain "mean" and "std".
•	 Adds a column for activity code with the name of the activity.
•	 Replaces the variable names with more descriptive names.
•	 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
