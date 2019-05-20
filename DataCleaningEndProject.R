dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url, "tech.zip")
unzip("tech.zip", exdir = "tech")

#needed for munipulating dataframes
library(dplyr)


#reads test as data frame
#complete list of variables of each feature vector
FEATURES<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/features.txt", sep = "", dec = ".")

#new var names
newNames<-vector()
newNames<- FEATURES[ ,2]



#reads Test set
TESTx<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/test/X_test.txt", sep = "", dec = ".")



#labeling test set columns
colnames(TESTx)<- newNames


#reads Test labels
TESTy<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/test/y_test.txt", sep = "", dec = ".")


#rename test labels before compiling test data
TESTy<- rename(TESTy, replace= c("V1"= "activities"))


#reads test subjects as data frame
#Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
TESTsub<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/test/subject_test.txt", sep = "", dec = ".")


#rename data test labels before compiling data
TESTsub<- rename(TESTsub, replace= c("V1"= "subject" ))


#add test label and test subjects in to test data frame
TESTx<- cbind2(TESTx, TESTy)
TESTx<- cbind2(TESTx, TESTsub)





#reads test as data frame
#Trianing set
TRAINx<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/train/X_train.txt", sep = "", dec = ".")


#labeling training columns same as test data
colnames(TRAINx)<- newNames

#reads train subjects as data frame
#identifies the subject who performed the activity
TRAINsub<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/train/subject_train.txt", sep = "", dec = ".")


#name this data test training subject before compiling data
TRAINsub<- rename(TRAINsub, replace=c("V1"= "subject" ))


#reads trainy as data frame
#Training  activity labels
TRAINy<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/train/y_train.txt", sep = "", dec = ".")

#name this data training labels before compiling data
TRAINy<- rename(TRAINy, replace= c("V1"= "activities"))

#add training lables and test subjects in to training data frame
TRAINx<- cbind2(TRAINx, TRAINy)
TRAINx<- cbind2(TRAINx, TRAINsub)




#merge test and training together
# DATA is one data set with all data
DATA<- rbind2(TESTx,TRAINx)



#tidying up data


#reading in activity labels
ActLabels<- read.table("C:/Users/witte/datasciencecoursera/tech/UCI HAR Dataset/activity_labels.txt", sep = "", dec = ".") 
activities<- ActLabels[ ,2]

# loop to replace numeric label with corrisponding activity name
for (i in 1:length(activities) ){

  DATA$activities<- gsub(i,activities[i], DATA$activities)
  }



#removes uppercase and "-" from var names
names(DATA)<- tolower(names(DATA))
names(DATA)<- gsub("-", "",names(DATA))



# extract only mean and std measurements
meanAndstd<- grep("mean|std", names(DATA))

#keeping subjects and acivities
sub<- grep("subject", names(DATA) )
activ<- grep("activities", names(DATA) )

#creates vector of data to keep wanted data as well as subjects and activities
extract<- append(meanAndstd , sub) 
extract<- append(extract, activ)



#creating data frame with only measurements of mean and std
DATA<- DATA[ ,extract]




### creating second data frame##

library(plyr)


#a vetor of the var names
columnList<- names(DATA)

#measuement data are in col 1:86, 
#activities is col 88  subject is col 87
wantedCol<-length(columnList)-2
shortlist<-columnList[1:86]



#create data frame from DATA which is the column means grouped by subject 
DataSub<- aggregate(DATA[,shortlist], list(DATA$subject), mean)

#aggregate function named column grouped by to Group.1 
#rename column back to subject 
DataSub<- rename(DataSub, replace=c("Group.1"= "subject"))


#create data frame from DATA which is the column means grouped by activity

DataAct<- aggregate(DATA[ ,shortlist], list(DATA$activities), mean)

#aggregate function named column grouped by to Group.1 
#rename column to activity 
DataAct<- rename(DataAct, replace=c("Group.1"= "activity"))

#merging subject and activity data keeping unmatched data
DATA2<-merge.data.frame(DataSub, DataAct, all.x = TRUE, all.y = TRUE)

#move subject col to first position and activity to 2nd position
DATA2<-DATA2[,c(87:88, 1:86)]
#arrange data frame order by assending subject numbers then activities
DATA2<- arrange(DATA2,subject,activity)



