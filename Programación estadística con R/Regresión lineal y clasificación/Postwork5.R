#A partir del conjunto de datos de soccer de la liga española de las temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame SmallData, que contenga las columnas date, home.team, home.score, away.team y away.score; esto lo puede hacer con ayuda de la función select del paquete dplyr. Luego establece un directorio de trabajo y con ayuda de la función write.csv guarda el data frame como un archivo csv con nombre soccer.csv. Puedes colocar como argumento row.names = FALSE en write.csv.

#Importar csvs 
laLiga2019 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2019-2020.csv")
laLiga2018 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2018-2019.csv")
laLiga2017 <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Manipulación de datos en R/Data/LaLiga/LaLiga2017-2018.csv")

#Cargar la libreria
library(dplyr)

#Nombre del dataframe va primero. 
LaLiga2019 <-select(laLiga2019, date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam, away.score = FTAG) # Date, HomeTeam, AwayTeam, FTHG, FTAG 
LaLiga2018 <-select(laLiga2018, date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam, away.score = FTAG)
LaLiga2017 <-select(laLiga2017, date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam, away.score = FTAG)

#Arreglamos la fecha 
LaLiga2019Date <- mutate(LaLiga2019, date = as.Date(date, "%d/%m/%Y"))
LaLiga2018Date <- mutate(LaLiga2018, date = as.Date(date, "%d/%m/%Y"))
LaLiga2017Date <- mutate(LaLiga2017, date = as.Date(date, "%d/%m/%y"))

#Ponemos todos los data frames en una lista
LaLiga <- list(LaLiga2019Date, LaLiga2018Date, LaLiga2017Date)

#Combinar los dataframes en uno solo
SmallData <- do.call(rbind, LaLiga)
SmallData  

#Guardar csv
write.csv(x = SmallData, file = "soccer.csv", row.names = FALSE)

#Con la función create.fbRanks.dataframes del paquete fbRanks importe el archivo soccer.csv a R y al mismo tiempo asignelo a una variable llamada listasoccer. Se creará una lista con los elementos scores y teams que son data frames listos para la función rank.teams. Asigna estos data frames a variables llamadas anotaciones y equipos.
install.packages("fbRanks")
library(fbRanks)
listasoccer <- create.fbRanks.dataframes(scores.file = "~/Desktop/Data-Science-Course/Programación estadística con R/Regresión lineal y clasificación/Data/soccer.csv")
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams
