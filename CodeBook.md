# run_analysis.R Overview

## Purpose
The purpose of this script is to combine both the testing and training data into one complete data set, adding in 

descriptive labels, and then extracting only data containing mean and standard deviation measurements.  The script compiles 

the measurements with their associated activities and participants for an overview of this data in one tidy data set.  It 

then gives an average of theses measurements.  

## Data descriptions

This R-script uses the following files within the UCI HAR Dataset folder:
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt

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

## License

Please view the README.md file to view licensing and citations for original data collection.

