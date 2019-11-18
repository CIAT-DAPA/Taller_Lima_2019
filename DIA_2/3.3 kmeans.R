
library(cluster)

datos_machine <- read.csv("CURSO ANALISIS/DIA_2/Base_Datos_ML.csv")


summary(datos_machine)


#Tomar las variables nmerica 
baseDatos_reducida <- datos_machine[, 5:16]
summary(baseDatos_pca)


#PCA
baseDatos_pca<- prcomp(baseDatos_reducida ,
                 center = TRUE,
                 scale. = TRUE) 


#Datos

datos_pca <- baseDatos_pca$x[,1:2]
plot(datos_pca, main = "Componentes Principales")

summary(baseDatos_pca)

fit2       <- kmeans(datos_pca, 2)
y_cluster2 <- fit2$cluster


clusplot(datos_pca, fit2$cluster, color=TRUE, shade=TRUE, labels=2, lines=0, main="Numero de grupos")

fit3       <- kmeans(datos_pca, 3)
y_cluster3 <- fit3$cluster

clusplot(datos_pca, fit3$cluster, color=TRUE, shade=TRUE, labels=2, lines=0, main="Numero de grupos")


d <- daisy(datos_pca) 
resultados <- rep(0, 10)
for (i in c(2,3,4,5,6,7,8,9,10))
{
  fit           <- kmeans(datos_pca, i)
  y_cluster     <- fit$cluster
  sk            <- silhouette(y_cluster, d)
  resultados[i] <- mean(sk[,3])
}

plot(2:10,resultados[2:10],type="o",col="blue",pch=0,xlab="Numbero de clusters",ylab="Silueta")


