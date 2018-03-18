#robleeanalyst@gmail.com
# training ref https://www.youtube.com/watch?v=Zx2TguRHrJE

setwd("C:/Users/Rob/Desktop/py_r_ral/r_projects/titanic")

titantic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE, header=TRUE)
titantic.test <- read.csv(file = "test.csv", stringsAsFactors = FALSE, header=TRUE)

titantic.train$IsTrainSet <- TRUE #id column
titantic.test$IsTrainSet <- FALSE #id column

titantic.test$Survived <- NA #add column for rbind

ncol(titantic.train) #test
ncol(titantic.test) #test

titanic.all<- rbind (titantic.train, titantic.test) #combine datasets

## Cleaning up missing values

sapply (titanic.all, function(x) any(is.na(x))) # Test for missing values

table (is.na(titanic.all$Embarked)) #missing values filter
titanic.all[titanic.all$Embarked=="","Embarked"]<-"S" #filler

table(is.na(titanic.all$Age)) 
median.age<-median (titanic.all$Age, na.rm=TRUE ) #dynamic filler
titanic.all[is.na(titanic.all$Age),"Age"] <-median.age

table(is.na(titanic.all$Fare))
median.fare<-median(titanic.all$Fare, na.rm=TRUE)
titanic.all[is.na(titanic.all$Fare),"Fare"]<-median.fare
