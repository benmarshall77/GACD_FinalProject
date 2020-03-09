The run_analysis.R script in this folder performs the following 5+1 steps as required by the Coursera Getting and Cleaning Data project instructions.

Preparatory step - Ensure required packages are installed and loaded into R.

Step 1 - Download the dataset, extract relevant files,  assigns data to variables and merges the training and the test sets to create one data set

Assign each data to variables:
- features <- features.txt (561 rows, 2 columns) The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

- activity_labels <- activity_labels.txt (6 rows, 2 columns) List of activities performed when the corresponding measurements were taken and its codes (labels)

- subject_test <- test/subject_test.txt (2947 rows, 1 column) contains test data of 9/30 volunteer test subjects being observed

- x_test <- test/X_test.txt (2947 rows, 561 columns) contains recorded features test data

- y_test <- test/y_test.txt (2947 rows, 1 columns) contains test data of activities’ code labels

- subject_train <- test/subject_train.txt (7352 rows, 1 column) contains train data of 21/30 volunteer subjects being observed

- x_train <- test/X_train.txt (7352 rows, 561 columns) contains recorded features train data

- y_train <- test/y_train.txt (7352 rows, 1 columns) contains train data of activities’code labels

Merges the training and the test sets to create one data set

- test (2947 rows, 563 columns) created by merging x_test with y_test and subject_test using cbind() function

- train (7352 rows, 563 columns) created by merging x_train with y_train and subject_train using cbind() function

- data (10299 rows, 563 columns) merge of test and train data via rbind() function

Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement

- means_sd (10299 rows, 82 columns) is created by subsetting data, selecting only columns: subject and code and any other variable whose name contains the string 'mean' or 'std' (standard deviation) via grep() function. 

Step 3 - Uses descriptive activity names to name the activities in the data set

- An activity_label variable is computed by matching the code to the activity_labels text file.

Step 4 - Appropriately labels the data set with descriptive variable names

- All Acc in variable names replaced with Accelerometer

- All Gyro in variable names replaced with Gyroscope

- All BodyBody in variable names replaced with Body

- All Mag in variable names replaced with Magnitude

- All variable names starting with character f replaced with Frequency

- All variable names starting with character t replaced with Time

- All variable names with open and closed parentheses "()" have parentheses removed.

- code variable renamed to Activity_Code

Step 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- by_activity (10299 rows, 82 columns) A copy of means_sd data grouped by subject and activity via group_by() function

- tidydata (180 rows, 82 columns) created by summarising means_sd on the grouped dataset using summarise_all function with mean.

- Export tidydata into tidydata.txt file.


=================
Variable description of tidydata.txt 

The variables selected for tidydata.txt come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometer-XYZ and TimeGyroscope-XYZ as described by Reyes-Ortiz et al. here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The tidydata.txt reports a single mean score for a selection of Reyes-Ortiz et al.'s measurements for each subject carrying out each of the six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING

As adapted by Reyes-Ortiz et al.: "These time domain signals ere captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise."

The acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz."

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- TimeBodyAccelerometer-XYZ
- TimeGravityAccelerometer-XYZ
- TimeBodyAccelerometerJerk-XYZ
- TimeBodyGyroscope-XYZ
- TimeBodyGyroscopeJerk-XYZ
- TimeBodyAccelerometerMagnitude
- TimeGravityAccelerometerMagnitude
- TimeBodyAccelerometerJerkMagnitude
- TimeBodyGyroscopeMagnitude
- TimeBodyGyroscopeJerkMagnitude
- FrequencyBodyAccelerometer-XYZ
- FrequencyBodyAccelerometerJerk-XYZ
- FrequencyBodyGyroscope-XYZ
- FrequencyBodyAccelerometerMagnitude
- FrequencyBodyAccelerometerJerkMagnitude
- FrequencyBodyGyroscopeMagnitude
- FrequencyBodyGyroscopeJerkMagnitude

The data in the tidydata.txt file includes the Mean (mean) and Standard deviation (std) that were estimated from each of these signals.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- TimeBodyAccelerometerMean
- TimeBodyAccelerometerJerkMean
- TimeBodyGyroscopeMean
- TimeBodyGyroscopeJerkMean




