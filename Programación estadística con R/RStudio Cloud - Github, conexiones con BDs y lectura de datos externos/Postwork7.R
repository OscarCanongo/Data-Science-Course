#Alojar el fichero data.csv en una base de datos llamada match_games, nombrando al collection como match
install.packages("mongolite")
library(mongolite)

match=data.table::fread("C:/Users/end user/OneDrive/Escritorio/DataScience/Sesion7/Data/data.csv")

#Conexión
conexion <- mongo(
  collection = "match",
  db = "match_games",
  url = "mongodb+srv://admin:oscar@cluster0.laeuo.mongodb.net/bedu?retryWrites=true&w=majority",
  verbose = FALSE,
  options = ssl_options()
)

#Agregando información 
conexion$insert(match)

#Una vez hecho esto, realizar un count para conocer el número de registros que se tiene en la base
conexion$count()

#Realiza una consulta utilizando la sintaxis de Mongodb, en la base de datos para conocer el número de goles que metió el Real Madrid el 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió ó fue goleada?
conexion$find('{"Date":"2015-12-20","HomeTeam":"Real Madrid"}')

# Cerrando la conexión
rm(my_collection)
