
# Die benötigten Librarys werden importiert
library(tidyverse)

  
  
# Datenset für training!


# Welche Spalten sind metrsich welche kategotisch

sapply(training_daten,is.integer)
sapply(training_daten,is.factor)

str(training_daten)

# Mehrere Spalten als Factor umwandeln. Dafür erstellen wir zuerst einen Vektor
set_factor <- c( "balcony",  "basement" , "bath_tube" ,"cabletv", "cheminee"  , "elevator", "first_time"  ,"furnished",  
                 "home_type", "kids_friendly","laundry","minergie","new_building","newly_built","oldbuilding",
                 "oven","parking_indoor","parking_outside","playground","pool","raised_groundfloor","rooms","sale","street"     
                  ,"terrace","topstorage","veranda","wheelchair", "building_plot",  "ceiling", "quiet", "sunny" , "municipality",
                  "Gemeindename", "Kantonskürzel", "year", "year_built", "Ortschaftsname", "zipcode") 

# Sämtliche True False Spalten mit 1 0 ersetzen
training_daten$building_plot <- as.integer(as.logical(training_daten$building_plot))
training_daten$ceiling <- as.integer(as.logical(training_daten$ceiling))
training_daten$quiet<- as.integer(as.logical(training_daten$quiet))
training_daten$sunny <- as.integer(as.logical(training_daten$sunny))
#  Alle NAs mit 0 ersetzen
training_daten[is.na(training_daten)] = 0

view(training_daten)

#  Nun kann die Umwandlung in Factor stattfinden
training_daten[,set_factor] <- lapply(training_daten[,set_factor], factor) 

# Überprüfen ob die Datentypen nun stimmen: 
str(training_daten)


# Den vorhergesagten Wert als Zahl umwandeln!
training_daten$price <- as.numeric(gsub("\\CHF", "", training_daten$price) )

# Unnötige Spalten entfernen
training_daten$Sprache <- NULL
training_daten$Zusatzziffer  <- NULL
  







############################################################################################################################
# Datenset für test!


# Welche Spalten sind metrsich welche kategotisch

sapply(test_daten,is.integer)
sapply(test_daten,is.factor)

str(test_daten)

# Mehrere Spalten als Factor umwandeln. Dafür erstellen wir zuerst einen Vektor
set_factor <- c( "balcony",  "basement" , "bath_tube" ,"cabletv", "cheminee"  , "elevator", "first_time"  ,"furnished",  
                 "home_type", "kids_friendly","laundry","minergie","new_building","newly_built","oldbuilding",
                 "oven","parking_indoor","parking_outside","playground","pool","raised_groundfloor","rooms","sale","street"     
                 ,"terrace","topstorage","veranda","wheelchair", "building_plot",  "ceiling", "quiet", "sunny" , "municipality",
                 "Gemeindename", "Kantonskürzel", "year", "year_built", "Ortschaftsname", "zipcode") 

# Sämtliche True False Spalten mit 1 0 ersetzen
test_daten$building_plot <- as.integer(as.logical(test_daten$building_plot))
test_daten$veranda <- as.integer(as.logical(test_daten$veranda))
#  Alle NAs mit 0 ersetzen
training_daten[is.na(training_daten)] = 0

view(training_daten)

#  Nun kann die Umwandlung in Factor stattfinden
test_daten[,set_factor] <- lapply(test_daten[,set_factor], factor) 

# Überprüfen ob die Datentypen nun stimmen: 
str(test_daten)


# Den vorhergesagten Wert als Zahl umwandeln!
training_daten$price <- as.numeric(gsub("\\CHF", "", training_daten$price) )

# Unnötige Spalten entfernen
training_daten$Sprache <- NULL
training_daten$Zusatzziffer  <- NULL



