GCD-Project
===========

Getting and Cleaning Data Course Project

##The Original Dataset

The original data comes from the Human Activity Recognition Using Smartphones Dataset, collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. of the Smartlab - Non Linear Complex Systems Laboratory at the University of Genoa. The essential details are included here.

The original experiments involved a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II). Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were recorded. Each activity was performed by each subject numerous times. The subjects were split into a training subset and a testing subset: 70% of the subject were assigned to 'train', 30% to 'test'.

###For each record the following data was recorded:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###The original dataset included the following files:


- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set data from accelerometers and gyroscopes.
- 'train/y_train.txt': Training activity labels.
- 'test/X_test.txt': Test set data from accelerometers and gyroscopes.
- 'test/y_test.txt': Test activity labels.

##Transforming the Dataset

The requirements of the project to transform the original dataset described above, are as follows:

You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The first instruction was carried out using the following steps:

- All original files were read into the R script using the read.table function. 
- The training labels and the training data were clipped together, as were the test labels and test data.
- Next the training and testing data were combined to form on large dataset.
- The features file was used to add headings to the combined dataset, called "traintest".

The next step was to extract only the measurements on mean and standard deviation. This was done using 'grep' and regular expressions. This reduced the size of the dataset from 563 columns to 68.

The activity labels were then inserted, e.g. activity 1 became "Walking".

The headings were tidied up so that the variable names were appropriately labelled. This step was carried out using the 'gsub' function.

Finally the second, independent tidy dataset, called "agg_traintest", was created using the 'aggregate' function. This dataset contains the mean of each of the 68 columns by activity and subject.


