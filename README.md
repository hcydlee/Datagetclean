Getting and Cleaning Data
=============================
### Introduction

This repo contains the scripts, datasets and other related files to resolve the quizs and course project of 
getting and Cleaning Data. The following parts contains the description of each scripts.

### quiz1.R, quiz2.R, quiz3.R & quiz4.R

Each part with a number after pound(#) sign telling the problem number of quiz. 

### run_analysis.R
* Read in datasets and assign column names for each column according to features.txt.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set: merge dataset and activity by activity id
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### datasets
* UCIHARDATA.txt
        The tidy dataset with measurements on the mean and standard deviation for each measurement----The first tidy dataset.
* UCIHARDATA-AVE.txt
        The tidy dataset with the average of each variable for each activity and each subject----The second tidy dataset.