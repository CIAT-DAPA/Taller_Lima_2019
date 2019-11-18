# Curso R Primera 
# Hugo Andres Dorado
# 20-Marzo-2019

123

# Almacenamiento y eliminacion de objetos

n <- 5 # Agregar valor a un objeto llamado n
n

m

N

rm(n) # Remover n

t <- 'inia'

t

# manipulacion de vectores en R

edad <- c(24,31,15,18,11)

edad[3]
edad[c(1,5)]
is(edad)

sexo <- c("M","M","F","M","F")
sexo
is(sexo)

# Aritementica vectorial

edad + 5

edad*8

produccion_ton <- c(90, 45,  54, 355,  27.0)

area <- c(10,5,6,40,3)

rendimiento <- produccion_ton/area

rendimiento^2

sqrt(rendimiento)

sum(produccion_ton)

prod(produccion_ton)

?hist # Ayuda en R


# Generación de sucesiones en R

1:20

seq(1,20,by = 2)

seq(1,3,length.out = 20)

rep(5,20)

# Reglas logicas

a <- c(2,3,4,3,2)

a==2

a!=3

a>=1

a[a>=3]

# Valores faltantes 

b <- c(a,NA,4,3)

is.na(b)

b

b[!is.na(b)]



# Crear data.frame

is(basetrigo)

df <- data.frame(id,sexo,edad)

df[3,]

df[3:5,]

df[1,3]

df$peso <- c(56,60,70,15,16)

(df$edad + df$peso)/2

write.csv(df,'estudiantes.csv',row.names = F)

# Crear Lista

ls_nueva <- list(df,basetrigo)

ls_nueva[[1]]

# Formato fechas

fechas <- c("20/3/2019","21/3/2019")
is(fechas)

fechas2 <- as.Date(fechas,"%d/%m/%Y")
is(fechas2)


# Leer base de datos 

basetrigo <- read.csv("baseTrigo.csv",sep = ",")

summary(basetrigo)

str(basetrigo)

getwd() # Verificar espacio de trabajo en R

setwd() # Mover espacio de trabajo

# Histograma

hist(basetrigo$Rend,xlab = "Rendimiento kg/ha",
     main = "Rendimiento en trigo", col = 'red' )

box()
abline(v=mean(basetrigo$Rend),lty=2,col='blue')

