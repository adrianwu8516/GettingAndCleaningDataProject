Codebook
========

In this codebook, we will take a brief look into the tidy dataset that we generate in this project.

Input data
----------
The program used the following files to generate the final tidy data.
* ../train/X_train.txt
* ../test/X_test.txt
* ../train/y_train.txt
* ../test/y_train.txt
* ../test/subject_test.txt
* ../train/subject_train.txt
* activity_labels.txt
* features.txt

They are available at:
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`.

Data Cleaning
-------------
In the data cleaning process, we did the fellowing 5 steps to get our final tidy dataset.
For more information you can check the R code of this part at 'run_analysis.R'

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Dataset structure
-----------------


```r
str(tidy_data)
```

```
## 'data.frame':	180 obs. of  68 variables:
##  $ subject                    : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ activity                   : chr  "LAYING" "LAYING" "LAYING" "LAYING" ...
##  $ tBodyAcc-mean()-X          : num  0.222 0.281 0.276 0.264 0.278 ...
##  $ tBodyAcc-mean()-Y          : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...
##  $ tBodyAcc-mean()-Z          : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...
##  $ tBodyAcc-std()-X           : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...
##  $ tBodyAcc-std()-Y           : num  -0.837 -0.98 -0.962 -0.942 -0.969 ...
##  $ tBodyAcc-std()-Z           : num  -0.826 -0.984 -0.964 -0.963 -0.969 ...
##  $ tGravityAcc-mean()-X       : num  -0.249 -0.51 -0.242 -0.421 -0.483 ...
##  $ tGravityAcc-mean()-Y       : num  0.706 0.753 0.837 0.915 0.955 ...
##  $ tGravityAcc-mean()-Z       : num  0.446 0.647 0.489 0.342 0.264 ...
##  $ tGravityAcc-std()-X        : num  -0.897 -0.959 -0.983 -0.921 -0.946 ...
##  $ tGravityAcc-std()-Y        : num  -0.908 -0.988 -0.981 -0.97 -0.986 ...
##  $ tGravityAcc-std()-Z        : num  -0.852 -0.984 -0.965 -0.976 -0.977 ...
##  $ tBodyAccJerk-mean()-X      : num  0.0811 0.0826 0.077 0.0934 0.0848 ...
##  $ tBodyAccJerk-mean()-Y      : num  0.00384 0.01225 0.0138 0.00693 0.00747 ...
##  $ tBodyAccJerk-mean()-Z      : num  0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ...
##  $ tBodyAccJerk-std()-X       : num  -0.958 -0.986 -0.981 -0.978 -0.983 ...
##  $ tBodyAccJerk-std()-Y       : num  -0.924 -0.983 -0.969 -0.942 -0.965 ...
##  $ tBodyAccJerk-std()-Z       : num  -0.955 -0.988 -0.982 -0.979 -0.985 ...
##  $ tBodyGyro-mean()-X         : num  -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ...
##  $ tBodyGyro-mean()-Y         : num  -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ...
##  $ tBodyGyro-mean()-Z         : num  0.149 0.145 0.138 0.17 0.16 ...
##  $ tBodyGyro-std()-X          : num  -0.874 -0.988 -0.975 -0.973 -0.979 ...
##  $ tBodyGyro-std()-Y          : num  -0.951 -0.982 -0.977 -0.961 -0.977 ...
##  $ tBodyGyro-std()-Z          : num  -0.908 -0.96 -0.964 -0.962 -0.961 ...
##  $ tBodyGyroJerk-mean()-X     : num  -0.107 -0.102 -0.1 -0.105 -0.102 ...
##  $ tBodyGyroJerk-mean()-Y     : num  -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ...
##  $ tBodyGyroJerk-mean()-Z     : num  -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ...
##  $ tBodyGyroJerk-std()-X      : num  -0.919 -0.993 -0.98 -0.975 -0.983 ...
##  $ tBodyGyroJerk-std()-Y      : num  -0.968 -0.99 -0.987 -0.987 -0.984 ...
##  $ tBodyGyroJerk-std()-Z      : num  -0.958 -0.988 -0.983 -0.984 -0.99 ...
##  $ tBodyAccMag-mean()         : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
##  $ tBodyAccMag-std()          : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...
##  $ tGravityAccMag-mean()      : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
##  $ tGravityAccMag-std()       : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...
##  $ tBodyAccJerkMag-mean()     : num  -0.954 -0.988 -0.979 -0.97 -0.98 ...
##  $ tBodyAccJerkMag-std()      : num  -0.928 -0.986 -0.976 -0.961 -0.977 ...
##  $ tBodyGyroMag-mean()        : num  -0.875 -0.95 -0.952 -0.93 -0.947 ...
##  $ tBodyGyroMag-std()         : num  -0.819 -0.961 -0.954 -0.947 -0.958 ...
##  $ tBodyGyroJerkMag-mean()    : num  -0.963 -0.992 -0.987 -0.985 -0.986 ...
##  $ tBodyGyroJerkMag-std()     : num  -0.936 -0.99 -0.983 -0.983 -0.984 ...
##  $ fBodyAcc-mean()-X          : num  -0.939 -0.977 -0.981 -0.959 -0.969 ...
##  $ fBodyAcc-mean()-Y          : num  -0.867 -0.98 -0.961 -0.939 -0.965 ...
##  $ fBodyAcc-mean()-Z          : num  -0.883 -0.984 -0.968 -0.968 -0.977 ...
##  $ fBodyAcc-std()-X           : num  -0.924 -0.973 -0.984 -0.952 -0.965 ...
##  $ fBodyAcc-std()-Y           : num  -0.834 -0.981 -0.964 -0.946 -0.973 ...
##  $ fBodyAcc-std()-Z           : num  -0.813 -0.985 -0.963 -0.962 -0.966 ...
##  $ fBodyAccJerk-mean()-X      : num  -0.957 -0.986 -0.981 -0.979 -0.983 ...
##  $ fBodyAccJerk-mean()-Y      : num  -0.922 -0.983 -0.969 -0.944 -0.965 ...
##  $ fBodyAccJerk-mean()-Z      : num  -0.948 -0.986 -0.979 -0.975 -0.983 ...
##  $ fBodyAccJerk-std()-X       : num  -0.964 -0.987 -0.983 -0.98 -0.986 ...
##  $ fBodyAccJerk-std()-Y       : num  -0.932 -0.985 -0.971 -0.944 -0.966 ...
##  $ fBodyAccJerk-std()-Z       : num  -0.961 -0.989 -0.984 -0.98 -0.986 ...
##  $ fBodyGyro-mean()-X         : num  -0.85 -0.986 -0.97 -0.967 -0.976 ...
##  $ fBodyGyro-mean()-Y         : num  -0.952 -0.983 -0.978 -0.972 -0.978 ...
##  $ fBodyGyro-mean()-Z         : num  -0.909 -0.963 -0.962 -0.961 -0.963 ...
##  $ fBodyGyro-std()-X          : num  -0.882 -0.989 -0.976 -0.975 -0.981 ...
##  $ fBodyGyro-std()-Y          : num  -0.951 -0.982 -0.977 -0.956 -0.977 ...
##  $ fBodyGyro-std()-Z          : num  -0.917 -0.963 -0.967 -0.966 -0.963 ...
##  $ fBodyAccMag-mean()         : num  -0.862 -0.975 -0.966 -0.939 -0.962 ...
##  $ fBodyAccMag-std()          : num  -0.798 -0.975 -0.968 -0.937 -0.963 ...
##  $ fBodyBodyAccJerkMag-mean() : num  -0.933 -0.985 -0.976 -0.962 -0.977 ...
##  $ fBodyBodyAccJerkMag-std()  : num  -0.922 -0.985 -0.975 -0.958 -0.976 ...
##  $ fBodyBodyGyroMag-mean()    : num  -0.862 -0.972 -0.965 -0.962 -0.968 ...
##  $ fBodyBodyGyroMag-std()     : num  -0.824 -0.961 -0.955 -0.947 -0.959 ...
##  $ fBodyBodyGyroJerkMag-mean(): num  -0.942 -0.99 -0.984 -0.984 -0.985 ...
##  $ fBodyBodyGyroJerkMag-std() : num  -0.933 -0.989 -0.983 -0.983 -0.983 ...
```

Summary of variables
--------------------


```r
summary(tidy_data)
```

```
##     subject       activity         tBodyAcc-mean()-X tBodyAcc-mean()-Y  
##  Min.   : 1.0   Length:180         Min.   :0.2216    Min.   :-0.040514  
##  1st Qu.: 8.0   Class :character   1st Qu.:0.2712    1st Qu.:-0.020022  
##  Median :15.5   Mode  :character   Median :0.2770    Median :-0.017262  
##  Mean   :15.5                      Mean   :0.2743    Mean   :-0.017876  
##  3rd Qu.:23.0                      3rd Qu.:0.2800    3rd Qu.:-0.014936  
##  Max.   :30.0                      Max.   :0.3015    Max.   :-0.001308  
##  tBodyAcc-mean()-Z  tBodyAcc-std()-X  tBodyAcc-std()-Y   tBodyAcc-std()-Z 
##  Min.   :-0.15251   Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877  
##  1st Qu.:-0.11207   1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498  
##  Median :-0.10819   Median :-0.7526   Median :-0.50897   Median :-0.6518  
##  Mean   :-0.10916   Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756  
##  3rd Qu.:-0.10443   3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306  
##  Max.   :-0.07538   Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090  
##  tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z
##  Min.   :-0.6800      Min.   :-0.47989     Min.   :-0.49509    
##  1st Qu.: 0.8376      1st Qu.:-0.23319     1st Qu.:-0.11726    
##  Median : 0.9208      Median :-0.12782     Median : 0.02384    
##  Mean   : 0.6975      Mean   :-0.01621     Mean   : 0.07413    
##  3rd Qu.: 0.9425      3rd Qu.: 0.08773     3rd Qu.: 0.14946    
##  Max.   : 0.9745      Max.   : 0.95659     Max.   : 0.95787    
##  tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z
##  Min.   :-0.9968     Min.   :-0.9942     Min.   :-0.9910    
##  1st Qu.:-0.9825     1st Qu.:-0.9711     1st Qu.:-0.9605    
##  Median :-0.9695     Median :-0.9590     Median :-0.9450    
##  Mean   :-0.9638     Mean   :-0.9524     Mean   :-0.9364    
##  3rd Qu.:-0.9509     3rd Qu.:-0.9370     3rd Qu.:-0.9180    
##  Max.   :-0.8296     Max.   :-0.6436     Max.   :-0.6102    
##  tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
##  Min.   :0.04269       Min.   :-0.0386872    Min.   :-0.067458    
##  1st Qu.:0.07396       1st Qu.: 0.0004664    1st Qu.:-0.010601    
##  Median :0.07640       Median : 0.0094698    Median :-0.003861    
##  Mean   :0.07947       Mean   : 0.0075652    Mean   :-0.004953    
##  3rd Qu.:0.08330       3rd Qu.: 0.0134008    3rd Qu.: 0.001958    
##  Max.   :0.13019       Max.   : 0.0568186    Max.   : 0.038053    
##  tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z
##  Min.   :-0.9946      Min.   :-0.9895      Min.   :-0.99329    
##  1st Qu.:-0.9832      1st Qu.:-0.9724      1st Qu.:-0.98266    
##  Median :-0.8104      Median :-0.7756      Median :-0.88366    
##  Mean   :-0.5949      Mean   :-0.5654      Mean   :-0.73596    
##  3rd Qu.:-0.2233      3rd Qu.:-0.1483      3rd Qu.:-0.51212    
##  Max.   : 0.5443      Max.   : 0.3553      Max.   : 0.03102    
##  tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
##  Min.   :-0.20578   Min.   :-0.20421   Min.   :-0.07245  
##  1st Qu.:-0.04712   1st Qu.:-0.08955   1st Qu.: 0.07475  
##  Median :-0.02871   Median :-0.07318   Median : 0.08512  
##  Mean   :-0.03244   Mean   :-0.07426   Mean   : 0.08744  
##  3rd Qu.:-0.01676   3rd Qu.:-0.06113   3rd Qu.: 0.10177  
##  Max.   : 0.19270   Max.   : 0.02747   Max.   : 0.17910  
##  tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
##  Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855  
##  1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609  
##  Median :-0.7890   Median :-0.8017   Median :-0.8010  
##  Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164  
##  3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106  
##  Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649  
##  tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
##  Min.   :-0.15721       Min.   :-0.07681       Min.   :-0.092500     
##  1st Qu.:-0.10322       1st Qu.:-0.04552       1st Qu.:-0.061725     
##  Median :-0.09868       Median :-0.04112       Median :-0.053430     
##  Mean   :-0.09606       Mean   :-0.04269       Mean   :-0.054802     
##  3rd Qu.:-0.09110       3rd Qu.:-0.03842       3rd Qu.:-0.048985     
##  Max.   :-0.02209       Max.   :-0.01320       Max.   :-0.006941     
##  tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
##  Min.   :-0.9965       Min.   :-0.9971       Min.   :-0.9954      
##  1st Qu.:-0.9800       1st Qu.:-0.9832       1st Qu.:-0.9848      
##  Median :-0.8396       Median :-0.8942       Median :-0.8610      
##  Mean   :-0.7036       Mean   :-0.7636       Mean   :-0.7096      
##  3rd Qu.:-0.4629       3rd Qu.:-0.5861       3rd Qu.:-0.4741      
##  Max.   : 0.1791       Max.   : 0.2959       Max.   : 0.1932      
##  tBodyAccMag-mean() tBodyAccMag-std() tGravityAccMag-mean()
##  Min.   :-0.9865    Min.   :-0.9865   Min.   :-0.9865      
##  1st Qu.:-0.9573    1st Qu.:-0.9430   1st Qu.:-0.9573      
##  Median :-0.4829    Median :-0.6074   Median :-0.4829      
##  Mean   :-0.4973    Mean   :-0.5439   Mean   :-0.4973      
##  3rd Qu.:-0.0919    3rd Qu.:-0.2090   3rd Qu.:-0.0919      
##  Max.   : 0.6446    Max.   : 0.4284   Max.   : 0.6446      
##  tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std()
##  Min.   :-0.9865      Min.   :-0.9928        Min.   :-0.9946      
##  1st Qu.:-0.9430      1st Qu.:-0.9807        1st Qu.:-0.9765      
##  Median :-0.6074      Median :-0.8168        Median :-0.8014      
##  Mean   :-0.5439      Mean   :-0.6079        Mean   :-0.5842      
##  3rd Qu.:-0.2090      3rd Qu.:-0.2456        3rd Qu.:-0.2173      
##  Max.   : 0.4284      Max.   : 0.4345        Max.   : 0.4506      
##  tBodyGyroMag-mean() tBodyGyroMag-std() tBodyGyroJerkMag-mean()
##  Min.   :-0.9807     Min.   :-0.9814    Min.   :-0.99732       
##  1st Qu.:-0.9461     1st Qu.:-0.9476    1st Qu.:-0.98515       
##  Median :-0.6551     Median :-0.7420    Median :-0.86479       
##  Mean   :-0.5652     Mean   :-0.6304    Mean   :-0.73637       
##  3rd Qu.:-0.2159     3rd Qu.:-0.3602    3rd Qu.:-0.51186       
##  Max.   : 0.4180     Max.   : 0.3000    Max.   : 0.08758       
##  tBodyGyroJerkMag-std() fBodyAcc-mean()-X fBodyAcc-mean()-Y 
##  Min.   :-0.9977        Min.   :-0.9952   Min.   :-0.98903  
##  1st Qu.:-0.9805        1st Qu.:-0.9787   1st Qu.:-0.95361  
##  Median :-0.8809        Median :-0.7691   Median :-0.59498  
##  Mean   :-0.7550        Mean   :-0.5758   Mean   :-0.48873  
##  3rd Qu.:-0.5767        3rd Qu.:-0.2174   3rd Qu.:-0.06341  
##  Max.   : 0.2502        Max.   : 0.5370   Max.   : 0.52419  
##  fBodyAcc-mean()-Z fBodyAcc-std()-X  fBodyAcc-std()-Y   fBodyAcc-std()-Z 
##  Min.   :-0.9895   Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872  
##  1st Qu.:-0.9619   1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459  
##  Median :-0.7236   Median :-0.7470   Median :-0.51338   Median :-0.6441  
##  Mean   :-0.6297   Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824  
##  3rd Qu.:-0.3183   3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655  
##  Max.   : 0.2807   Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871  
##  fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
##  Min.   :-0.9946       Min.   :-0.9894       Min.   :-0.9920      
##  1st Qu.:-0.9828       1st Qu.:-0.9725       1st Qu.:-0.9796      
##  Median :-0.8126       Median :-0.7817       Median :-0.8707      
##  Mean   :-0.6139       Mean   :-0.5882       Mean   :-0.7144      
##  3rd Qu.:-0.2820       3rd Qu.:-0.1963       3rd Qu.:-0.4697      
##  Max.   : 0.4743       Max.   : 0.2767       Max.   : 0.1578      
##  fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z
##  Min.   :-0.9951      Min.   :-0.9905      Min.   :-0.993108   
##  1st Qu.:-0.9847      1st Qu.:-0.9737      1st Qu.:-0.983747   
##  Median :-0.8254      Median :-0.7852      Median :-0.895121   
##  Mean   :-0.6121      Mean   :-0.5707      Mean   :-0.756489   
##  3rd Qu.:-0.2475      3rd Qu.:-0.1685      3rd Qu.:-0.543787   
##  Max.   : 0.4768      Max.   : 0.3498      Max.   :-0.006236   
##  fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
##  Min.   :-0.9931    Min.   :-0.9940    Min.   :-0.9860   
##  1st Qu.:-0.9697    1st Qu.:-0.9700    1st Qu.:-0.9624   
##  Median :-0.7300    Median :-0.8141    Median :-0.7909   
##  Mean   :-0.6367    Mean   :-0.6767    Mean   :-0.6044   
##  3rd Qu.:-0.3387    3rd Qu.:-0.4458    3rd Qu.:-0.2635   
##  Max.   : 0.4750    Max.   : 0.3288    Max.   : 0.4924   
##  fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean()
##  Min.   :-0.9947   Min.   :-0.9944   Min.   :-0.9867   Min.   :-0.9868   
##  1st Qu.:-0.9750   1st Qu.:-0.9602   1st Qu.:-0.9643   1st Qu.:-0.9560   
##  Median :-0.8086   Median :-0.7964   Median :-0.8224   Median :-0.6703   
##  Mean   :-0.7110   Mean   :-0.6454   Mean   :-0.6577   Mean   :-0.5365   
##  3rd Qu.:-0.4813   3rd Qu.:-0.4154   3rd Qu.:-0.3916   3rd Qu.:-0.1622   
##  Max.   : 0.1966   Max.   : 0.6462   Max.   : 0.5225   Max.   : 0.5866   
##  fBodyAccMag-std() fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
##  Min.   :-0.9876   Min.   :-0.9940            Min.   :-0.9944          
##  1st Qu.:-0.9452   1st Qu.:-0.9770            1st Qu.:-0.9752          
##  Median :-0.6513   Median :-0.7940            Median :-0.8126          
##  Mean   :-0.6210   Mean   :-0.5756            Mean   :-0.5992          
##  3rd Qu.:-0.3654   3rd Qu.:-0.1872            3rd Qu.:-0.2668          
##  Max.   : 0.1787   Max.   : 0.5384            Max.   : 0.3163          
##  fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std()
##  Min.   :-0.9865         Min.   :-0.9815       
##  1st Qu.:-0.9616         1st Qu.:-0.9488       
##  Median :-0.7657         Median :-0.7727       
##  Mean   :-0.6671         Mean   :-0.6723       
##  3rd Qu.:-0.4087         3rd Qu.:-0.4277       
##  Max.   : 0.2040         Max.   : 0.2367       
##  fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
##  Min.   :-0.9976             Min.   :-0.9976           
##  1st Qu.:-0.9813             1st Qu.:-0.9802           
##  Median :-0.8779             Median :-0.8941           
##  Mean   :-0.7564             Mean   :-0.7715           
##  3rd Qu.:-0.5831             3rd Qu.:-0.6081           
##  Max.   : 0.1466             Max.   : 0.2878
```
