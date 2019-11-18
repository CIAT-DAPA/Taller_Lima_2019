#Solucion
library(ggplot2)
#Discusion 
rm(list = ls())
#Ejerecicio 2

datos_mora <- read.csv("DATA/Base_Datos.csv")
class(datos_mora)
datos_mora[,c(1,2)]












summary(datos_mora)

#Cambiar la variables numericas
datos_mora$SR_0 <- as.numeric(gsub(",", ".", datos_mora$SR_0))
datos_mora$SR_1 <- as.numeric(gsub(",", ".", datos_mora$SR_1))

#Cambiar las variables a factor
datos_mora$MoraEspinas <- as.factor(datos_mora$MoraEspinas)

#Version reducida 
datos_mora$Departamento <- as.character(datos_mora$Departamento)
datos_mora$Departamento <- gsub("[[:space:]]", "", datos_mora$Departamento)
datos_mora$Departamento <- gsub("^*L\\w+", "Loreto", datos_mora$Departamento)
datos_mora$Departamento <- gsub("^*o\\w+", "Loreto", datos_mora$Departamento)
datos_mora$Departamento <- gsub("^*I\\w+", "Ica", datos_mora$Departamento)
datos_mora$Departamento <- as.factor(datos_mora$Departamento)

#Cambiar los nombres de las ciudades 
datos_mora$Ciudad <- as.character(datos_mora$Ciudad)
datos_mora$Ciudad <- gsub("[[:space:]]", "", datos_mora$Ciudad)
datos_mora$Ciudad <- gsub("^*P\\w+", "Patras", datos_mora$Ciudad)
datos_mora$Ciudad <- gsub("^*N\\w+", "Nauta", datos_mora$Ciudad)
datos_mora$Ciudad <- gsub("^*I\\w+", "Iquitos", datos_mora$Ciudad)
datos_mora$Ciudad <- gsub("^*A\\w+", "Atenas", datos_mora$Ciudad)
datos_mora$Ciudad <- gsub("^*a\\w+", "Atenas", datos_mora$Ciudad)
datos_mora$Ciudad <- as.factor(datos_mora$Ciudad)

#Calcular:
#Estimadores 
media <- mean(datos_mora$Rendimiento)
mediana <- mean(datos_mora$Rendimiento)
media_recortada <- mean(datos_mora$Rendimiento, trim = 0.05)
media_winsorizada <- winsor.mean(datos_mora$Rendimiento, trim = 0.05)
rango_intercuartiilico <- IQR(datos_mora$Rendimiento)
desviacion_estandar <- sd(datos_mora$Rendimiento)

#Estiamdores como un dataframe
Estimadores <- c("media", "mediana", "media_recortada", "media_winsorizada", "rango_intercuartilico", "desviacion_estandar")
tabla_clima <-  data.frame(Estimador = Estimadores, Valor = c(media, mediana, media_recortada, media_winsorizada, rango_intercuartiilico, desviacion_estandar))


#ggplot 2
#1
ggplot(datos_mora, aes(x=MoraEspinas, y=Rendimiento)) + geom_boxplot()

#2
ggplot(datos_mora, aes(x=Departamento, y=Rendimiento)) + geom_boxplot()


#3
ggplot(datos_mora, aes(x=SR_0, y=Rendimiento, fill = Ciudad)) + geom_point(size=2, shape=23)

#4
ggplot(datos_mora, aes(x=HR_0, y=Rendimiento, fill = Departamento)) + geom_point(size=2, shape=23)







