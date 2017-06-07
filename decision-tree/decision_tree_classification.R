library(rpart)
titanic_data <- read.csv("A:\\sem-2 - spring-2017\\Advance-Data-Science\\Assignments\\Assignment-3\\Titanic_train.csv", header = TRUE, sep = ",")
head(titanic_data)
table(titanic_data$Survived)
titanic_data_tree <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = titanic_data, method = "class")
library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(titanic_data_tree)
prp(titanic_data_tree)

prediction <- predict(titanic_data_tree, titanic_data, type = "class")
solution <- data.frame(Pclass = titanic_data$Pclass, Age = titanic_data$Age, Sex= titanic_data$Sex, 
                       SibSp = titanic_data$SibSp ,Parch = titanic_data$Parch, Fare = titanic_data$Fare, 
                       Embarked= titanic_data$Embarked, Survived = prediction)

my_tree_prediction <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
                       data = solution, method = "class", control = rpart.control(minsplit = 50, cp = 0))
prp(my_tree_prediction)
fancyRpartPlot(my_tree_prediction)


