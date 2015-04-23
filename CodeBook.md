---
title: "CodeBook geting and cleaning data project"
author: "vigu59"
date: "Wednesday, April 23, 2015"
output: html_document
---

## Context

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
 Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
 wearing a smartphone (Samsung Galaxy S II) on the waist. 
 Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
 The experiments have been video-recorded to label the data manually. 
 The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
 The sensor acceleration signal, which has gravitational and body motion components,
 was separated using a Butterworth low-pass filter into body acceleration and gravity.
 The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
 From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Raw Data

The raw data sets are store in differents files, explanation about the content of each files are détailed in the 
README.TXT file include in the source zipfile.
For summarize we can kepp in mind the following :

The are 2 set off measures data, one call the test data set wich include the measures recorded with 9 subjects.
and the train data set concerning recorded measures from 21 subjects.

For each record it is provided :

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

_For our purpose we use the 561-feature vector, its activity label and idetifier of the subject._

The detail description of the 561-feature vector is available in the file 'features_info.txt':

Names of signal features:

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

The estimated values from these signals are: 

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

Additional vectors are obtained by averaging the signals in a signal window sample.
These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Therefore the complete list of the 561 variables is obtain by composition of the set of signals and set of estimated values.

For example, using the first signal "tBodyAcc-X" which stand for time signal, body acceleration axis X, the following variables are calculated and part of the 561 vector features :

* tBodyAcc-mean()-X       
* tBodyAcc-std()-X        
* tBodyAcc-mad()-X        
* tBodyAcc-max()-X        
* tBodyAcc-min()-X        
* tBodyAcc-energy()-X     
* tBodyAcc-iqr()-X        
* tBodyAcc-entropy()-X    
* tBodyAccJerk-mean()-X   
* tBodyAccJerk-std()-X    
* tBodyAccJerk-mad()-X    
* tBodyAccJerk-max()-X    
* tBodyAccJerk-min()-X    
* tBodyAccJerk-energy()-X 
* tBodyAccJerk-iqr()-X    
* tBodyAccJerk-entropy()-X


## Process data

The Raw datas are subset to keep only variables representing the mean value and standard deviation of each set of features. 

Variables names have been properly set :
* First letter : t or f for time or frequency
* end of variable name:
    * mean : Mean value 
    * std: Standard deviation
    * -x : axis x
    * -y : axis y
    * -z : axis z
* Only lowercase character
* Parenthesis removed

The values of activity variable are label instead of number.

For each activity of each subject the average of each variable is calculated and available in the data set.
The 2 first columns of the table specify the subject and activity, the rest of the column the value of the mean calculated for each variable.

List of variables names:
<style>
table,tr,td { border: 1px solid black; padding:5px;}
</style>

<table style=C >
<tbody>
<tr><td>raw names</td> <td>process names</td></tr>
<tr><td></td><td> subject</td></tr>                    
<tr><td></td><td> activity</td></tr>                   
<tr><td>tBodyAcc-mean()-X</td><td>tbodyacc-mean-x</td></tr>        
<tr><td>tBodyAcc-mean()-Y</td><td>tbodyacc-mean-y</td></tr>         
<tr><td>tBodyAcc-mean()-Z</td><td>tbodyacc-mean-z</td></tr>          
<tr><td>tBodyAcc-std()-X</td><td>tbodyacc-std-x</td></tr>           
<tr><td>tBodyAcc-std()-Y</td><td>tbodyacc-std-y</td></tr>        
<tr><td>tBodyAcc-std()-Z</td><td>tbodyacc-std-z</td></tr>           
<tr><td>tGravityAcc-mean()-X</td><td>tgravityacc-mean-x</td></tr>       
<tr><td>tGravityAcc-mean()-Y</td><td>tgravityacc-mean-y</td></tr>       
<tr><td>tGravityAcc-mean()-Z</td><td>tgravityacc-mean-z</td></tr>       
<tr><td>tGravityAcc-std()-X</td><td>tgravityacc-std-x</td></tr>        
<tr><td>tGravityAcc-std()-Y</td><td>tgravityacc-std-y</td></tr>        
<tr><td>tGravityAcc-std()-Z</td><td>tgravityacc-std-z</td></tr>        
<tr><td>tBodyAccJerk-mean()-X</td><td>tbodyaccjerk-mean-x</td></tr>      
<tr><td>tBodyAccJerk-mean()-Y</td><td>tbodyaccjerk-mean-y</td></tr>      
<tr><td>tBodyAccJerk-mean()-Z</td><td>tbodyaccjerk-mean-z</td></tr>      
<tr><td>tBodyAccJerk-std()-X</td><td>tbodyaccjerk-std-x</td></tr>       
<tr><td>tBodyAccJerk-std()-Y</td><td>tbodyaccjerk-std-y</td></tr>       
<tr><td>tBodyAccJerk-std()-Z</td><td>tbodyaccjerk-std-z</td></tr>       
<tr><td>tBodyGyro-mean()-X</td><td>tbodygyro-mean-x</td></tr>         
<tr><td>tBodyGyro-mean()-Y</td><td>tbodygyro-mean-y</td></tr>         
<tr><td>tBodyGyro-mean()-Z</td><td>tbodygyro-mean-z</td></tr>         
<tr><td>tBodyGyro-std()-X</td><td>tbodygyro-std-x</td></tr>          
<tr><td>tBodyGyro-std()-Y</td><td>tbodygyro-std-y</td></tr>          
<tr><td>tBodyGyro-std()-Z</td><td>tbodygyro-std-z</td></tr>          
<tr><td>tBodyGyroJerk-mean()-X</td><td>tbodygyrojerk-mean-x</td></tr>     
<tr><td>tBodyGyroJerk-mean()-Y</td><td>tbodygyrojerk-mean-y</td></tr>     
<tr><td>tBodyGyroJerk-mean()-Z</td><td>tbodygyrojerk-mean-z</td></tr>     
<tr><td>tBodyGyroJerk-std()-X</td><td>tbodygyrojerk-std-x</td></tr>      
<tr><td>tBodyGyroJerk-std()-Y</td><td>tbodygyrojerk-std-y</td></tr>      
<tr><td>tBodyGyroJerk-std()-Z</td><td>tbodygyrojerk-std-z</td></tr>      
<tr><td>tBodyAccMag-mean()</td><td>tbodyaccmag-mean</td></tr>         
<tr><td>tBodyAccMag-std()</td><td>tbodyaccmag-std</td></tr>          
<tr><td>tGravityAccMag-mean()</td><td>tgravityaccmag-mean</td></tr>      
<tr><td>tGravityAccMag-std()</td><td>tgravityaccmag-std</td></tr>       
<tr><td>tBodyAccJerkMag-mean()</td><td>tbodyaccjerkmag-mean</td></tr>     
<tr><td>tBodyAccJerkMag-std()</td><td>tbodyaccjerkmag-std</td></tr>      
<tr><td>tBodyGyroMag-mean()</td><td>tbodygyromag-mean</td></tr>        
<tr><td>tBodyGyroMag-std()</td><td>tbodygyromag-std</td></tr>         
<tr><td>tBodyGyroJerkMag-mean()</td><td>tbodygyrojerkMag-mean</td></tr>    
<tr><td>tBodyGyroJerkMag-std()</td><td>tbodygyrojerkMag-std</td></tr>     
<tr><td>fBodyAcc-mean()-X</td><td>fbodyacc-mean-x</td></tr>          
<tr><td>fBodyAcc-mean()-Y</td><td>fbodyacc-mean-y</td></tr>          
<tr><td>fBodyAcc-mean()-Z</td><td>fbodyacc-mean-z</td></tr>          
<tr><td>fBodyAcc-std()-X</td><td>fbodyacc-std-x</td></tr>           
<tr><td>fBodyAcc-std()-Y</td><td>fbodyacc-std-y</td></tr>           
<tr><td>fBodyAcc-std()-Z</td><td>fbodyacc-std-z</td></tr>           
<tr><td>fBodyAccJerk-mean()-X</td><td>fbodyaccjerk-mean-x</td></tr>      
<tr><td>fBodyAccJerk-mean()-Y</td><td>fbodyaccjerk-mean-y</td></tr>      
<tr><td>fBodyAccJerk-mean()-Z</td><td>fbodyaccjerk-mean-z</td></tr>      
<tr><td>fBodyAccJerk-std()-X</td><td>fbodyaccjerk-std-x</td></tr>       
<tr><td>fBodyAccJerk-std()-Y</td><td>fbodyaccjerk-std-y</td></tr>       
<tr><td>fBodyAccJerk-std()-Z</td><td>fbodyaccjerk-std-z</td></tr>       
<tr><td>fBodyGyro-mean()-X</td><td>fbodygyro-mean-x</td></tr>         
<tr><td>fBodyGyro-mean()-Y</td><td>fbodygyro-mean-y</td></tr>         
<tr><td>fBodyGyro-mean()-Z</td><td>fbodygyro-mean-z</td></tr>         
<tr><td>fBodyGyro-std()-X</td><td>fbodygyro-std-x</td></tr>          
<tr><td>fBodyGyro-std()-Y</td><td>fbodygyro-std-y</td></tr>          
<tr><td>fBodyGyro-std()-Z</td><td>fbodygyro-std-z</td></tr>          
<tr><td>fBodyAccMag-mean()</td><td>fbodyaccmag-mean()</td></tr>         
<tr><td>fBodyAccMag-std()</td><td>fbodyaccmag-std</td></tr>          
<tr><td>fBodyBodyAccJerkMag-mean()</td><td>fbodybodyaccjerkmag-mean</td></tr> 
<tr><td>fBodyBodyAccJerkMag-std()</td><td>fbodybodyaccjerkmag-std</td></tr>  
<tr><td>fBodyBodyGyroMag-mean()</td><td>fbodybodygyromag-mean</td></tr>    
<tr><td>fBodyBodyGyroMag-std()</td><td>fbodybodygyromag-std</td></tr>     
<tr><td>fBodyBodyGyroJerkMag-mean()</td><td>fbodybodygyrojerkmag-mean</td></tr>
<tr><td>fBodyBodyGyroJerkMag-std()</td><td>fbodybodygyrojerkmag-std</td></tr> 
</tbody>
</table>
