#Juan Camilo Rivera 
#Analisis Descriptivo 

#librerias 
library(psych)


#Lectura de la base de datos. Vamos a ver que pasa sin header = False
datos <- read.csv("DATA/Base_Datos.csv", header = T)

#Nombre de las columnas 
colnames(datos)


#Resumen de las variables 
summary(datos[c(2,3,4,5,6,15)])

#Cambiar las variables cualitativas
datos$MoraEspinas <- as.factor(datos$MoraEspinas)

#Cambiar las etiquetas de 1 = Espinas y 0 = No Espinas
levels(datos$MoraEspinas) <- c("Espinas", "NoEspinas")

#Cambiar de cualitativas a numericas 
#Cambiar comas por puntos
datos$SR_1 <- gsub(",", ".", datos$SR_1)
#Convertirlo a numerico 
datos$SR_1 <- as.numeric(datos$SR_1)

#Convertir las palabras en una sola Ica y Loreto
#Para mas info https://stringr.tidyverse.org/articles/regular-expressions.html

#Eliminar espacios en blanco

datos$Departamento <- as.character(datos$Departamento)
datos$Departamento <- gsub("[[:space:]]", "", datos$Departamento)
#Encontrar todos los que comience con I. "^Af*\\w+",

#Una forma de hacerlo
datos$Departamento <- gsub("Ica", "ICA", datos$Departamento)
datos$Departamento <- gsub("I ca", "ICA", datos$Departamento)
datos$Departamento <- gsub("I cca", "ICA", datos$Departamento)
datos$Departamento <- gsub("I cca", "ICA", datos$Departamento)
datos$Departamento <- gsub("L ore to", "Loreto", datos$Departamento)
datos$Departamento <- gsub("LoreTo", "Loreto", datos$Departamento)
datos$Departamento <- gsub("oreTo", "Loreto", datos$Departamento)


#Version reducida
datos$Departamento <- gsub("^*L\\w+", "Loreto", datos$Departamento)
datos$Departamento <- gsub("^*o\\w+", "Loreto", datos$Departamento)
datos$Departamento <- gsub("^*I\\w+", "Ica", datos$Departamento)

#Convertirlo a factor
datos$Departamento <- as.factor(datos$Departamento)

#Resultado Final 
summary(datos[c(2,3,4,5,6,15)])

#Boxplot 
boxplot(datos$Elevacion, main= "Distribucion de la Elevación", col= "yellow")


#Estimadores 
media <- mean(datos$Elevacion)
mediana <- mean(datos$Elevacion)
media_recortada <- mean(datos$Elevacion, trim = 0.05)
media_winsorizada <- winsor.mean(datos$Elevacion, trim = 0.05)
rango_intercuartiilico <- IQR(datos$Elevacion)
desviacion_estandar <- sd(datos$Elevacion)

#Estiamdores como un dataframe
Estimadores <- c("media", "mediana", "media_recortada", "media_winsorizada", "rango_intercuartilico", "desviacion_estandar")
tabla_clima <-  data.frame(Estimador = Estimadores, Valor = c(media, mediana, media_recortada, media_winsorizada, rango_intercuartiilico, desviacion_estandar))

#Histograma 
hist(datos$Elevacion, main= "Histograma de la Elevación", col= "yellow", xlab= "metros")

