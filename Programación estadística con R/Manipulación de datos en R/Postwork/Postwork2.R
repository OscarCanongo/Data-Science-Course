# Obten una mejor idea de las características de los data frames al usar las funciones: str, head, View y summary

#Importar csvs 
laLiga2019 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2019-2020.csv")
laLiga2018 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2018-2019.csv")
laLiga2017 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2017-2018.csv")

#str es una función que muestra de manera compacta la estructura interna de un objeto de R
str(laLiga2019)
str(laLiga2018)
str(laLiga2017)

#La función head devuelve la primera parte de un data frame, tabla, matriz, vector o función. 
head(laLiga2019)
head(laLiga2018)
head(laLiga2017)

#La función View aplicada a un objeto de R como un data frame, invoca un visor de datos al estilo de una hoja de cálculo.
View(laLiga2019)
View(laLiga2018)
View(laLiga2017)

#La función summary es una función genérica usada para obtener resumenes de diferentes objetos de R
summary(laLiga2019)
summary(laLiga2018)
summary(laLiga2017)

#Con la función select del paquete dplyr selecciona únicamente las columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada uno de los data frames. (Hint: también puedes usar lapply).

#instalar dplyr
install.packages('dplyr')

#Cargar la libreria
library(dplyr)

#Nombre del dataframe va primero. 
LaLiga2019 <-select(laLiga2019, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) # Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR
LaLiga2018 <-select(laLiga2018, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
LaLiga2017 <-select(laLiga2017, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

LaLiga2019
LaLiga2018
LaLiga2017