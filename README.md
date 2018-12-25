# Getting-and-Cleaning-Data-Course-Project

## Initial data for research

The purpose of this script is analysis and extraction of useful data from UCI HAR Dataset.

The relevant files:
	1.'features_info.txt': Shows information about the variables used on the feature vector.
	2.'features.txt': List of all features.
	3.'activity_labels.txt': Links the class labels with their activity name.
	4.'train/X_train.txt': Training set.
	5.'train/y_train.txt': Training labels.
	6.'test/X_test.txt': Test set.
	7.'test/y_test.txt': Test labels.
	8.'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
	9.'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
	10.'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
	11.'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## Script workflow:

1. Reads the features and activities information. For example, X_train.txt is loaded as a data frame, column names are clarified, subject and activity ids are added from y_train.txt and subject_train.txt.

2. The process is repeated with test dataset. 

3. Mean and standards deviation measurements are extracted.

4. Descrivite values for activity labels are added to dataset via activitylevels, that is a factor variable with levels mentioned in file activity_labels.txt 

5. Mean values for all variables are calculated grouped by activity and subject using dcast() function and tidy data frame is created.