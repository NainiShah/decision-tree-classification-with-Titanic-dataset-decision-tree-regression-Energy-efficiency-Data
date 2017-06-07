library(rpart)
Energy_efficiency <- read.csv("A:\\sem-2 - spring-2017\\Advance-Data-Science\\Assignments\\Assignment-3\\Energy_Efficiency_data.csv", header = TRUE, sep = ",")
head(Energy_efficiency)
data_y1 <- rpart(Y1~X1 + X2 + X3 + X4 +X5 + X6 +X7 +X8, method="anova", data=Energy_efficiency)
data_y2 <- rpart(Y2~X1 + X2 + X3 + X4 +X5 + X6 +X7 +X8, method="anova", data=Energy_efficiency)

printcp(data_y1)
plotcp(data_y1) 
printcp(data_y2) 
plotcp(data_y2) 
library(rattle)
library(rpart.plot)
library(RColorBrewer)
prp(data_y2)
fancyRpartPlot(data_y1)

.......................................................................................................................................................................................