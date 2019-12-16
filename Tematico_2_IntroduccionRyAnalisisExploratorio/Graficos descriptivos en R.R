
# Graficos descriptivos en R


# Diagrama de dispersion

edad     <- c(21,34,10,15,37,58)
 
estatura <- c(1.8,1.7,1.5,1.4,1.7,1.6)

plot(edad,estatura,col="red",pch=16,main= 'Estatura vs edad', 
     xlab = 'Edad (A?os)', ylab = 'Estatura (mts)')

# Tiempo

dia <- c(1:10)

lempira <- c(22.1,22.3,22.5,23,22.9,23.4,24,21,21.1,21)

plot(dia,lempira,type='b',las=1,main='Valor del dolar en la lempira de Honduras')

# Histograma de rendimeinto

x <- rnorm(700,mean = 5000, sd = 30 )

hist(x,xlab = 'Rendimiento (kg/ha)',main = 'Histograma rendimiento en arroz' ,col='gray')

# Diagrama de barras

cultivos <- c(array('caf?',20),array('arroz',15),array('platano',11))

tabcultivos <- table(cultivos)

barplot(tabcultivos, ylim=c(0,25), main = 'Diagrama de barras de cultivos',ylab='Frecuencia')
box()

# Grouped Bar Plot

counts <- table(mtcars$cyl, mtcars$carb)
barplot(counts, main="Car Distribution by cylinders and carburetors",
        xlab="Number of cylinders", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

# Boxplot



boxplot(mtcars$mpg,main='Consumo de combustible',
        ylab='Miles/(US) gallon',col='cornsilk')


boxplot(mpg~am,data=mtcars,main='Consumo de combustible por tipo de trasmisi?n',
        ylab='Miles/(US) gallon',col='cornsilk',xlab='Transmisi?n')

# Ggplot2

library(ggplot2)

trigo <- read.csv('DATOS/baseTrigo.csv',header = T)

ggplot(trigo,aes(x= Variedad,y=Rend,fill="red"))+geom_boxplot()+facet_grid(.~ubicacion)+
  theme_bw()+ylab('Rendimiento (ton/ha)')+xlab('Variedad')

ggplot(trigo,aes(x=Rend))+geom_histogram(bins = 20,colour='green',fill='yellow')+ggtitle('Histograma de rendimiento de trigo')+ylab('rendimiento en kg/ha')


ggplot(trigo,aes(x=tiemp,y =Rend ))+geom_point(aes(colour=Variedad))+geom_smooth(aes(colour=Variedad))


ggplot(trigo,aes(x=tiemp,y =Rend ))+geom_point()+geom_smooth()+facet_grid(.~ubicacion) +theme_bw()+
  ggtitle('Distrubucion Rendimiento por locacion')



ggplot(iris,aes(x=Sepal.Length,y=Petal.Length))+geom_point(aes(color = Species, size = Petal.Width),alpha=0.7)


