# Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

#Importar csvs 
laLiga2019 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2019-2020.csv")
laLiga2018 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2018-2019.csv")
laLiga2017 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2017-2018.csv")

#Cargar la libreria
library(dplyr)

#Nombre del dataframe va primero. 
LaLiga2019 <-select(laLiga2019, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) # Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR
LaLiga2018 <-select(laLiga2018, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
LaLiga2017 <-select(laLiga2017, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

#Arreglamos la fecha 
LaLiga2019Date <- mutate(LaLiga2019, Date = as.Date(Date, "%d/%m/%Y"))
LaLiga2018Date <- mutate(LaLiga2018, Date = as.Date(Date, "%d/%m/%Y"))
LaLiga2017Date <- mutate(LaLiga2017, Date = as.Date(Date, "%d/%m/%y"))

#Ponemos todos los data frames en una lista
LaLiga <- list(LaLiga2019Date, LaLiga2018Date, LaLiga2017Date)

#Combinar los dataframes en uno solo
LaLigaFinal <- do.call(rbind, LaLiga)
LaLigaFinal

#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
fthg <- LaLigaFinal$FTHG
FTHG <- (table(fthg)/dim(LaLigaFinal)[1])
GolesCasa <- data.frame(FTHG)
colnames(GolesCasa)[1] <- "Goles"
colnames(GolesCasa)[2] <- "Probabilidad"
GolesCasa

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)
ftag <- LaLigaFinal$FTAG
FTAG <- (table(ftag)/dim(LaLigaFinal)[1])
GolesVisita <- data.frame(FTAG)
colnames(GolesVisita)[1] <- "Goles"
colnames(GolesVisita)[2] <- "Probabilidad"
GolesVisita

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)
Goles <- (table(ftag, fthg)/dim(LaLigaFinal)[1])
Goles
GolesTotales <- data.frame(Goles)
colnames(GolesTotales)[1] <- "Local"
colnames(GolesTotales)[2] <- "Visita"
colnames(GolesTotales)[3] <- "Probabilidad"
GolesTotales
library(ggplot2)

#Un gr�fico de barras para las probabilidades marginales estimadas del n�mero de goles que anota el equipo de casa
ggplot(GolesCasa, aes(x=Goles, y=Probabilidad)) + 
  geom_bar(stat = "identity", fill = "#3498DB") +
  ggtitle("Probabilidad de gol equipo de casa")

#Un gr�fico de barras para las probabilidades marginales estimadas del n�mero de goles que anota el equipo visitante.
ggplot(GolesVisita, aes(x=Goles, y=Probabilidad)) + 
  geom_bar(stat = "identity", fill = "#3498DB") +
  ggtitle("Probabilidad de gol equipo de visita")

#Un HeatMap para las probabilidades conjuntas estimadas de los n�meros de goles que anotan el equipo de casa y el equipo visitante en un partido.
ggplot(GolesTotales, aes(x = Local, y = Visita, fill = Probabilidad)) + geom_tile() + ggtitle("Probabilidad de Resultado")

#Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un partido. Obtén una tabla de cocientes al dividir estas probabilidades conjuntas por el producto de las probabilidades marginales correspondientes.
tablaCocientes <- (Goles/outer(FTAG,FTHG,'*'))
tablaCocientes

#Mediante un procedimiento de boostrap, obtén más cocientes similares a los obtenidos en la tabla del punto anterior. Esto para tener una idea de las distribuciones de la cual vienen los cocientes en la tabla anterior. Menciona en cuáles casos le parece razonable suponer que los cocientes de la tabla en el punto 1, son iguales a 1 (en tal caso tendríamos independencia de las variables aleatorias X y Y).
install.packages("rsample")
library(rsample)
set.seed(4566264)
booty=bootstraps(tablaCocientes,times=100)
booty1=booty$splits[[100]]
booty2=as.data.frame(booty1)
booty2
booty1
plot(booty2)

