# run_analysis.R Overview

## Purpose
The purpose of this script is to combine both the testing and training data into one complete data set, adding in 

descriptive labels, and then extracting only data containing mean and standard deviation measurements.  The script compiles 

the measurements with their associated activities and participants for an overview of this data in one tidy data set.  It 

then gives an average of theses measurements.  

## Data descriptions

The below description is taken directly from the authors/collectors of this data:

Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

## Files Used
This R-script uses the following files within the UCI HAR Dataset folder:
* UCI HAR Dataset/activity_labels.txt <- this is read into the act_lab data frame
* UCI HAR Dataset/features.txt <- this is read into the features data frame
* UCI HAR Dataset/train/subject_train.txt <- this is read into the subj_train data frame
* UCI HAR Dataset/train/X_train.txt <- this is read into the x_train data frame
* UCI HAR Dataset/train/y_train.txt <- this is read into the y_train data frame
* UCI HAR Dataset/test/subject_test.txt <- this is read into the subj_test data frame
* UCI HAR Dataset/test/X_test.txt <- this is read into the x_test data frame
* UCI HAR Dataset/test/y_test.txt <- this is read into the y_test data frame

Files not used (for this particular script) are those that are contained within the "train/Inertial Signals" and 

"test/Inertial Signals" folders.  The data in these folders show the detailed data before it was aggregated in the above 

mentioned files.

The detailed description of how the data itself was collected can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

## Prerequisites

When running this script, it is expected that the user has downloaded the Samsung data into their working directory, and 

unzipped the file in that location.  

The user should run the script from their working directory where the UCI HAR Dataset folder also resides.

## Brief Description of Steps in the Script
Note that you should review comments within the script for more detailed information on specific steps within the code
* Loads the above mentioned files into data frame variables and assigns descriptive column names to each
* Assigns appropriate activity labels and then merges the training data
* Assigns appropriate activity labels and then merges the test data
* Merges the training and testing data into one file, then selects only the desired columns containing standard deviation 

and mean measurements, along with their associated participant and activity descriptions
* Summarizes the above combined data per their averages, and then stores this in a 'results' table grouped by the 

participant and the activity performed

## Key Variables
* trainMerge is used to combine the subj_train, y_train, and x_train data
* testMerge is used to combine the subj_test, y_test, and x_test data
* allMerge is used to combine the trainMerge and testmerge data frames
* selected is used to select only the participant, activity, and mean or standard deviation measurements
* results is where the averaged data is stored for the "selected" data grouped by participant and activity

## License

Please view the README.md file to view licensing and citations for original data collection.

