# To ease reviewing, please take notice that all 5 steps are there, and numberd as in the assignment page in coursera,
# but NOT in sequence

#step 0 (just building up the environment)

#load required libraries
library(dplyr)
library(reshape2)

#reading required files
test <- read.table ("./test/X_test.txt", sep = "")
ytest <- read.table ("./test/y_test.txt", sep = "")
stest <- read.table ("./test/subject_test.txt", sep = "")
train <- read.table ("./train/X_train.txt", sep = "")
ytrain <- read.table ("./train/y_train.txt", sep = "")
strain <- read.table ("./train/subject_train.txt", sep = "")

#reading the features' names
colnames <- read.table("./features.txt", sep = "")
# ______________________________________________________

#step 4

#assigning proper names for columns in the files (converting them from "V1, V2..etc" style to 
#                                                 "tBodyAcc-mean()-X, tBodyAcc-mean()-Y.. etc." style)
names(test) <- colnames[,2]
names(train) <- colnames[,2]
names(stest) <- "subject"
names(ytest) <- "movlabels"
names(ytrain) <- "movlabels"
names(strain) <- "subject"
# ______________________________________________________

#step 1

#binding all "test" columns together
X <- cbind(test,ytest,stest)
#binding all "train" columns together
Y <- cbind(train, ytrain,strain)
#binding all the rows of test and train data into one big and main dataframe
df <- rbind(X,Y)
# ______________________________________________________

#step 4

#refining the names of variables, making them lower cases with only alphanumeric characters
names(df) <- tolower(gsub("\\(|)|,|-", "", names(df)))
# ______________________________________________________

#step 3

#convert "movement labels" from number-baesd values to character-based values
df$movlabels <- factor(df$movlabels, levels = c(1,2,3,4,5,6), labels = c("walking",
                                                                         "walking_upstairs",
                                                                         "walking_downstairs",
                                                                         "sitting",
                                                                         "standing",     
                                                                         "laying") )
# ______________________________________________________

#step 2

#creating a table which only takes columns of means and standard deviations 
#(subject and movement variables had to be excluded for the select function to work)
means_stds <- select(tbl_df(df[,1:561]), contains("std"), contains("mean"))

#rebinding the subject and movement columns with the resulted dataframe
means_stds <- cbind(means_stds, subject = df$subject, movlabels = df$movlabels)
# ______________________________________________________

#step 5

# breaking down variables only according to subject and movement variables (melting)
nnt <- melt(means_stds, id.vars = c("subject", "movlabels"))
# building up the long frame -nnt- into a wide frame with all variables exhibited and sorted according to subject and movement
new_and_tidey <- dcast(nnt, subject + movlabels ~ variable, mean)
# ______________________________________________________

#step 6

#creating the output file with the required data "tidy.txt" in the directory folder
write.table(new_and_tidey, "tidy.txt", row.names=FALSE)
# ______________________________________________________
