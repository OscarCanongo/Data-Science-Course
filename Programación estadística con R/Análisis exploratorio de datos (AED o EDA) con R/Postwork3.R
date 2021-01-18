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
fthg = LaLigaFinal$FTHG
(table(fthg)/dim(LaLigaFinal)[1])*100

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)
ftag = LaLigaFinal$FTAG
(table(ftag)/dim(LaLigaFinal)[1])*100

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)
(table(ftag, fthg)/dim(LaLigaFinal)[1])*100

