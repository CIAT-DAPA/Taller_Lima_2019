
# Alienacion de datos

ID <- c(1,2,3)
x1 <- c(3,2,3)
x2 <- c(5,3,1)
x3 <- c(7,5,3)  

library(tidyr)

data <- data.frame(id,x1,x2,x3)

# Gather

data_gather <- gather(data,var,value,-id)

data_gather

# Spread

spread(data_gather,var,value )

# Separate

data_gather$pais_ciudad <- paste('Honduras',c(rep('copan',4),rep('tegucicalpa',5)),sep='_') 

data_gather

separate(data_gather,pais_ciudad,c('pais','ciudad'),sep = '_')

# Funcion ddply


library(plyr)

id_evento     <- c(43,43,44,44,44,46,46,46)
cantidad_prod <- c(300,225,300,250,100,300,234,550)

data <- data.frame(id_evento,cantidad_prod)

data

ddply(data,~id_evento,summarise,acmProd = sum(cantidad_prod),
      freqProd=length(cantidad_prod),avg = length(cantidad_prod))

# merge


id_evento <- 1:9
id_suelos <- c(1,1,2,2,2,3,4,4,4)

fecha_siembra <- c("1/5/2015","8/10/2015","4/7/2015","12/11/2014","1/8/2015",
                   "12/11/2014","12/11/2016","1/11/2016","11/11/2016")

fecha_cosecha <- c("11/9/2015","4/1/2015","15/12/2015","12/3/2015","9/1/2016",
                   "12/2/2015","12/1/2017","1/2/2017","11/2/2017")

enventos_cosecha <- data.frame(id_evento,id_suelos,fecha_siembra,fecha_cosecha)

id_suelos <- 1:5
textura   <- c("Franco","Arena","Arcilla","Arena",'Limoso')
prof_efectiva <- c(60,80,50,70,90)

suelo <- data.frame(id_suelos,textura,prof_efectiva)

merge(enventos_cosecha,suelo,by.x='id_suelos',by.y='id_suelos',all.x=T,all.y=F,sort=T)


