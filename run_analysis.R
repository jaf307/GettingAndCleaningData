## load the dplyr library
library(dplyr)

## read data into data frame variables
act_lab <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

## assign descriptive column names
colnames(act_lab) <- c("activityNum", "activityDesc")
colnames(features) <- c("featureNum", "featureDesc")
colnames(y_test) <- c("activityNum")
colnames(y_train) <- c("activityNum")
colnames(subj_test) <- c("participant")
colnames(subj_train) <- c("participant")

## for the below x data frames in test and train, there were column names that caused 
## issues below with duplicate values, so after assigining the feature names, 
## it was necessary to correct via make.names and setting unique = TRUE to indicate 
## unique column names

colnames(x_test) <- features[,2]
corTestNames <- make.names(names = names(x_test), unique = TRUE, allow_ = TRUE)
names(x_test) <- corTestNames
colnames(x_train) <- features[,2]
corTrainNames <- make.names(names = names(x_train), unique=TRUE, allow_ = TRUE)
names(x_train) <- corTrainNames


## begin the data merge steps - outlined individually below

### associate y_train data with activity labels
y_train = merge(y_train, act_lab, by = "activityNum")
colnames(y_train)[2] <- "activityDesc"

### merge training data
trainMerge <- cbind(subj_train, y_train$activityDesc, x_train)
colnames(trainMerge)[2] <- "activityDesc"

### associate y_test data with activity labels
y_test = merge(y_test, act_lab, by = "activityNum")
colnames(y_test)[2] <- "activityDesc"

### merge test data
testMerge <- cbind(subj_test, y_test$activityDesc, x_test)
colnames(testMerge)[2] <- "activityDesc"

###  merge test and train data into one table
allMerge <- rbind(trainMerge, testMerge)

### select only columns that show the participant, a description of the activity, 
### and measurements that show either a mean or an standard deviation value
selected <- select(allMerge,contains("participant"), contains("activityDesc"), contains("mean"), contains("std"))


### summarize the data that was selected above by finding the mean 
### of each measurement per participant and related activity
results <- (selected%>%
                    group_by(participant,activityDesc) %>%
                    summarise_each(funs(mean)))

## write the results to a file named tidydata.txt to the working directory
write.table(results, "tidydata.txt", row.name=FALSE)

## print the results to the screen
print(results)
