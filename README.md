# GACD_FinalProject
==================================================================
Human Activity Recognition Using Smartphones 
Summary Dataset and R Script - Getting and Cleaning Data in R final programming assignment

==================================================================
Based on data collected by
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

==================================================================
This R Script collects, merges, tidies and summarises data on Human Activity Recognition Using Smartphones as Activity Sensors.

The data pertain to experiments carried out by Reyes-Ortiz et al. with a group of 30 volunteers aged between 19 and 48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on their waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

A full description of the original data colected by Reyes-Ortiz et al. is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


======================================
The summarised dataset, 'tidydata.txt', selects the mean and standard deviation for each measure obtained in Reyes-Ortiz's experiment, and then summarises them (using the mean() function) by subject and by activity (walking, sitting, laying, etc.) such that each record in the dataset represents:

- The mean of the mean and standard deviations across Reyes-Ortiz et al.'s 561-feature vectors with time and frequency domain variables. 
- An activity label. 
- An activity code.
- An identifier of the subject who carried out the experiment.

=========================================
The dataset includes the following files:


- 'README.txt': this file describing the nature of the data and the project

- run_analysis.R: The R script that carries out the transformation of the data

- 'tidydata.txt': The final dataset produced by the run_analysis.R script

- 'CodeBook.txt': Describes the variables, the data, and any transformations or work performed to clean up the data


=========================================
For more information about the original dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
