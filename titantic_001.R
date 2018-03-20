#robleeanalyst@gmail.com
# training ref https://www.youtube.com/watch?v=Zx2TguRHrJE

#import datasets

setwd("C:/Users/Rob/Desktop/py_r_ral/r_projects/titanic")

titantic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE, header=TRUE)
titantic.test <- read.csv(file = "test.csv", stringsAsFactors = FALSE, header=TRUE)

#combind datasets for cleaning

titantic.train$IsTrainSet <- TRUE #id column
titantic.test$IsTrainSet <- FALSE #id column

titantic.test$Survived <- NA #add column for rbind, equalizing columns

ncol(titantic.train) #test count
ncol(titantic.test) #test count

titanic.all<- rbind (titantic.train, titantic.test) #combine datasets

## Cleaning up missing values

sapply (titanic.all, function(x) any(is.na(x))) # Test dataset for missing values

table (is.na(titanic.all$Embarked)) #missing values filter
titanic.all[titanic.all$Embarked=="","Embarked"]<-"S" #filler

table(is.na(titanic.all$Age)) 
median.age<-median (titanic.all$Age, na.rm=TRUE ) #dynamic filler
titanic.all[is.na(titanic.all$Age),"Age"] <-median.age

table(is.na(titanic.all$Fare))
median.fare<-median(titanic.all$Fare, na.rm=TRUE)
titanic.all[is.na(titanic.all$Fare),"Fare"]<-median.fare

#categorical casting

titanic.all$Pclass<- as.factor (titanic.all$Pclass)
titanic.all$Sex<- as.factor (titanic.all$Sex)
titanic.all$Embarked<- as.factor (titanic.all$Embarked)
titanic.all$Fare <- as.factor (titanic.all$Fare)
titanic.all$Parch <- as.ordered (titanic.all$Parch)
titanic.all$SibSp <- as.ordered (titanic.all$SibSp)


# Split data back out after cleaning

titantic.train<-titanic.all[titanic.all$IsTrainSet==TRUE,] 
titantic.test<-titanic.all[titanic.all$IsTrainSet==FALSE,] 

titantic.train$Survived <- as.factor (titantic.train$Survived)

survived.equation <- "Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked"
survived.formula <- as.formula (survived.equation)
library (randomForest)

randomForest(Survived~.)
