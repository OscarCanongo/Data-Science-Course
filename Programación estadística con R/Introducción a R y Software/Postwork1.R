# Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

laLiga <- read.csv("~/Desktop/Data-Science-Course/Programación estadística con R/Introducción a R y Software/data/2019-2020.csv")
laLiga

#Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)

fthg = laLiga$FTHG
fthg

ftag = laLiga$FTAG
ftag
