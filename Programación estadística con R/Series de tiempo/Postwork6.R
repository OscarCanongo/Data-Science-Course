#Importar el csv
matches <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Series de tiempo/Data/match.csv")

#Agrega una nueva columna sumagoles que contenga la suma de goles por partido.
library(dplyr)
matches <- mutate(matches, sumagoles = home.score + away.score)

#Obtén el promedio por mes de la suma de goles.

Matches <- matches %>% 
  mutate(date = as.Date(date, "%Y-%m-%d")) %>%
  mutate(Mes = format(date, "%Y-%m"))

golesMes <- Matches %>% 
  group_by(Mes) %>%                  # date
  summarise(totales = mean(sumagoles)       # promediamos los goles totales
  )

#Crea la serie de tiempo del promedio por mes de la suma de goles hasta diciembre de 2019.
serie <- ts(golesMes$totales, start = 1, frequency = 10)

#Grafica la serie de tiempo.
ts.plot(serie)
