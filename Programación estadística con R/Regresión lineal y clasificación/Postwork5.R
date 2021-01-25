#A partir del conjunto de datos de soccer de la liga española de las temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame SmallData, que contenga las columnas date, home.team, home.score, away.team y away.score; esto lo puede hacer con ayuda de la función select del paquete dplyr. Luego establece un directorio de trabajo y con ayuda de la función write.csv guarda el data frame como un archivo csv con nombre soccer.csv. Puedes colocar como argumento row.names = FALSE en write.csv.

#Importar csvs 
laLiga2019 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2019-2020.csv")
laLiga2018 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2018-2019.csv")
laLiga2017 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2017-2018.csv")

#Cargar la libreria
library(dplyr)

#Nombre del dataframe va primero. 
LaLiga2019 <-select(laLiga2019, Date, HomeTeam, FTHG, AwayTeam, FTAG) # Date, HomeTeam, AwayTeam, FTHG, FTAG 
LaLiga2018 <-select(laLiga2018, Date, HomeTeam, FTHG, AwayTeam, FTAG)
LaLiga2017 <-select(laLiga2017, Date, HomeTeam, FTHG, AwayTeam, FTAG)

#Arreglamos la fecha 
LaLiga2019Date <- mutate(LaLiga2019, Date = as.Date(Date, "%d/%m/%Y"))
LaLiga2018Date <- mutate(LaLiga2018, Date = as.Date(Date, "%d/%m/%Y"))
LaLiga2017Date <- mutate(LaLiga2017, Date = as.Date(Date, "%d/%m/%y"))

#Ponemos todos los data frames en una lista
LaLiga <- list(LaLiga2019Date, LaLiga2018Date, LaLiga2017Date)

#Combinar los dataframes en uno solo
SmallData <- do.call(rbind, LaLiga)
SmallData  

#Guardar csv
write.csv(x = SmallData, file = "soccer.csv", row.names = FALSE)
