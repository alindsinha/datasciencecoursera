STEP 1
a)All the required data =has been read from both the train as well as test directories ,for the given samsung data set
b)The working directory contains the uncompressed data set directory
c)the variable names used are self explanatory for eg X_test is for data read from test directory for X

STEP 2
a)Once the data is read,the individual dataset X,Y and subject data set for both test and train are merged using rbind
b)thus 3 datasets are created as final_X,final_Y and subject_final
c) Then the names of the columns for X are assigned after they are read from features.txt

STEP 3
a)Once the column names are assigned to final_X,all the columns which are used to calculate mean and standard
deviation are extracted using regular expression matching for "mean()" and "std()"
b) the 66 columns thus extracted are sued to crate a subset of data X in X_subset


STEP 4
a) then the subset is then merged with final_Y and subject_final to crate a single dataset
b)the single dataset is then melts using the columns "Activity and Subject"
c)the melted data is is then dcasted to calculate the mean for each combination of Activity and Subject,thus creating 180 rows

STEP 5
a)This final data set is then used to rename the columns(labels) by removing the characters like "(),-"
b)the final outcome is written to a data file my.df.txt.