#Juan Camilo Rivera
#knn 

#Librerias 
library(VIM)


#Leer los archivos
leer_archivos <- read.table("CURSO ANALISIS/DIA_2/qc00150209.txt")
summary(leer_archivos)

colnames(leer_archivos) <- c("Anho", "Mes", "Dia", "P")
leer_archivos <- leer_archivos[,1:4]

#Ponerlo formato fecha 
leer_archivos$Fecha <- paste(leer_archivos$Anho, leer_archivos$Mes, leer_archivos$Dia, sep ="-")
leer_archivos$Fecha <- as.Date(leer_archivos$Fecha, format = "%Y-%m-%d")

#Seleccione de tiempo
#2013-12-01 hasta 2013-12-30

datos_fechas <- subset(leer_archivos, Fecha >="2013-12-01" & Fecha <= "2013-12-30")
#Ubicacion de los valores erroneos 
indices <- which(datos_fechas$P == -99.9)
datos_fechas$P[indices] <- NA

#Imputar los valores 
datos_completos <- kNN(datos_fechas, k=3)
datos_completos
summary(datos_completos)
datos_finales <- datos_completos[, c("Fecha", "P")]
datos_finales
