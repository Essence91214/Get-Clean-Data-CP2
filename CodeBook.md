This is the CodeBook for the tidy data in 'TidySummary'
=================================================================


###Brief description of the original-source-dataset 

The tidy data presented in **TidySummary** is a summary derived from 
the Dataset 'Human Activity Recognition' (HAR) collected Using Smartphones Dataset, 
Version 1.0. Here is a brief description of the original dataset. The experiments were conducted with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING- UPSTAIRS, WALKING- DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope.  3-axial linear acceleration and 3-axial angular  velocity data were captured at a constant rate of 50Hz. The obtained dataset was randomly partitioned into test and training datasets, which we merged together for our analysis. This dataset had some raw data and some processed data containg mean, standard deviation, and six other summaries.  For this study we picked only the mean and standard deviation values of the signals from the table, which was 79 of the 561 variables in the original data set. Our tidy data set contains these values averaged over each of the 30 subjects while performing  one of the 6 activities. More detail about the original dataset including a reference to a publication, is presented at the end of this document. 

###Names of varibles in the tidy dataset 'TidySummary'

SubjectAcitivitySummary, our tidy data set has 14220 observations of 4 variables.
Each observation gives the average measurement (column 4) of a feature (column 3) for one of the 30 subjects (column 1) performing one of the 6 activities (column 2). There are no row names and a description of the column names are presented below.

1. **Column 1**  

Subject:  is an integer value between 1 to 30, which are code names for the 30 subjects in the HAR experiment.

2. **Column 2**

Activity: one of six labels WALKING, WALKING- UPSTAIRS, WALKING- DOWNSTAIRS, SITTING, STANDING, LAYING

3. **Columns 3**

Feature Name: Names of features and belongs to a factor class with 79 levels, each of which is an average reading of a feature selected from the original HAR dataset. The feature  have names of the form "MEAN-[feature]" where [feature] is one of 561 features presented in thei original HAR dataset and deacribed in their documentation. How the 79 of the 561 features were selected to be included in this tidy dataset is explained in the README. For the readers convenience, the relevant parts of the document are presented below.  

4. **Column 4** 

Value: Value of the feature named in column 3 for the subject whose ID is in column 1 while performing the activity mentioned in column 2. 


###Units 

Note that since we only averaged these features for each subject and activity the units for these variables stay the same as the units in the original dataset.

###Information extracted from the original documentation of 'Human Activity Recognition Using Smartphones Dataset' Version 1.0
 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features- info.txt' for more details. 

###For each record is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561- feature vector with time and frequency domain variables, details provided below. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

###Complete list of features is in 'festures.txt'


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware- friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.