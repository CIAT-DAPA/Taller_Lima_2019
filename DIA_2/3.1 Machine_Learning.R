#Juan Camilo Rivera
#28 Octubre 2019


library(rpart)


#Leer archivo 

datos_machine <- read.csv("CURSO ANALISIS/DIA_2/Base_Datos_ML.csv")
datos_machine$CategoriaRendimiento <- as.factor(datos_machine$CategoriaRendimiento)



#Conjunto de entrenamiento
set.seed(666)



indexes = sample(1:nrow(datos_machine), size=floor((2/3)*nrow(datos_machine)))

entrenamiento = datos_machine[indexes,]
colnames(entrenamiento)

#Conjunto de entrenamiento



#Modelo 
fit <- rpart(CategoriaRendimiento ~ MoraEspinas + Ciudad + Pendiente + TempM_0 +SR_0 ,  data = datos_machine,method="class")

