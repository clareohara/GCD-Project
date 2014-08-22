GCD-Project
===========

Getting and Cleaning Data Course Project

read files using read.table

check dimensions

column bind test data (number of rows identical)

column bind train data

row bind train, test

transpose feature columns to rows

convert matrix back to data frame

select row 2 of data frame (i.e. row containing names)

add subject and activity headings

bind all headings 

add headings to traintest data frame

identify mean and sd column indices 
check meanFreq not present by comparing:

subset traintest by traintest_mean_sd

replace numbers 1-6 with activity names

tidy up variable names using gsub

use as column headings

use aggregate to find mean for each column by activity and subject

write data frame into text file

