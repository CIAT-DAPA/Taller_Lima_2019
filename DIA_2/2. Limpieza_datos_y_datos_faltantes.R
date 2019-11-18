
# Limpieza de datos en R
# Hugo Andres Dorado
# 29/10/2019

library(lubridate)
library(randomForest)
library(caret)

# install.packages('caret') Descargar por comando libreria

datosmaiz <- read.csv('DATOS/Dataset_Maize_Cordoba_Data_cleaning.csv',
                      row.names = 1)

summary(datosmaiz)

# Revisar y dar formato a las fechas

datosmaiz$Planting_Date <- as.Date(datosmaiz$Planting_Date,"%m/%d/%Y")

datosmaiz$Harvest_Date <- as.Date(datosmaiz$Harvest_Date,"%m/%d/%Y")

summary(datosmaiz)

hist( as.numeric(with(datosmaiz,Harvest_Date-Planting_Date)))

diasciclo <- as.numeric(with(datosmaiz,Harvest_Date-Planting_Date))

which(diasciclo < 70)

datosmaiz[52,]

datosmaiz[52,1] <- NA

hist( as.numeric(with(datosmaiz,Harvest_Date-Planting_Date)))

# Revisar atipicos en densidad de plantas

boxplot(datosmaiz$Plant_Density_20_days)

outlayers <-  !is.na(datosmaiz$Plant_Density_20_days) & datosmaiz$Plant_Density_20_days>300000

datosmaiz$Plant_Density_20_days[outlayers] <- c(60000,30000)

boxplot(datosmaiz$Plant_Density_20_days)

# Revisar formato en metodo de cosecha

datosmaiz$Harvest_Method <- factor(toupper(datosmaiz$Harvest_Method))

datosmaiz$Harvest_Method <- factor(gsub('MECAANIZADA','MECANIZADA',datosmaiz$Harvest_Method))

summary(datosmaiz)

# Dar formato a la variable rendimiento

datosmaiz$Yield <- as.numeric(gsub(',','.',datosmaiz$Yield))

# Datos procesados

summary(datosmaiz)

# Calcular dia Juliano

dia_anio <- yday(datosmaiz$Planting_Date)

dia_anio

datosmaiz2 <- datosmaiz[,c(-1,-2)]

head(datosmaiz2)

datosmaiz2 <- data.frame(dia_anio,datosmaiz2)

head(datosmaiz2)

?rfImpute

# Estimar datos faltantes

datosmaizcompletos <- rfImpute(Yield ~ . , data = datosmaiz2)

summary(datosmaizcompletos)

# Remover variables irrelevantes y rendundantes

nearZeroVar(datosmaizcompletos)

names(datosmaizcompletos)[c(28,40)]

datosmaizcompletos <- datosmaizcompletos[,-nearZeroVar(datosmaizcompletos)]

numvar <- sapply(datosmaizcompletos, is.numeric)

datosnumericos <- datosmaizcompletos[,numvar]

summary(datosnumericos)

cormat <- cor(datosnumericos)

plot(datosnumericos[,1:5])

cormat

findCorrelation(cormat,cutoff = 0.6)

names(datosnumericos)[c(18,14)]

names(datosmaizcompletos)[c(18,14)]

datosmaizcompletos <- datosmaizcompletos[,c(-18,-14)]

head(datosmaizcompletos)

write.csv(datosmaizcompletos,'RESULTADOS/datos_procesados_maiz.csv')
