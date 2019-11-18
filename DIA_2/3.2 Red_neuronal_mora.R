
#Ejercicion Redes Neuronales en R
#Hugo Andres Dorado B.
#30 Mayo 2017


#install.packages("caret")
#install.packages("nnet")

rm(list=ls())

library(caret)
library(nnet)

setwd(".")

datos_mora <- read.csv("CURSO ANALISIS/DIA_2/mora_toyset.csv",row.names = 1)

#Particion

set.seed(123)

inTrain  <- createDataPartition(y=datos_mora$Yield, p=0.7, list=F)

training <- datos_mora[inTrain,]

testing  <- datos_mora[-inTrain,]

#Normalizacion

norm_training <- preProcess(training,method = "range")

training_norm <- predict(norm_training,training)

testing_norm  <- predict(norm_training,testing)

#Optimizacion de parametros

ctrl <- expand.grid(size = c(2,4,6) ,decay = c(0.1,0.5,0.8) )

#Entrenamiento

model <- train(Yield~.,data=training_norm,method = "nnet",
               tuneGrid = ctrl, trControl = trainControl(method = "cv",number = 10),
               lineout =T)


model

#Desempe?o del modelo

pred_val <- predict(model,testing_norm)

postResample(pred_val,testing_norm$Yield)

plot(pred_val,testing_norm$Yield,col="red",pch=19, main = "Predicciones", xlab="Predicciones", ylab= "Real")

abline(0,1,lty=2)

#Relevancia de variables

varImp <- varImp(model)

plot(varImp)


