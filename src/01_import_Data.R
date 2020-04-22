
# Die benötigten Librarys werden importiert
library(readr)
library(tidyverse)

# Die benötigten Daten werden importiert

training <- read_csv("data/training.csv")
View(training)

X_test <- read_csv("data/X_test.csv")
View(X_test)


# Die Adressdaten sind hier zu unsauber. Ich hole mir Hilfe von OpenData und lade mir folgendes Datenset herunter

PLZO_CSV_LV95 <- read_delim("data/OpenData/PLZO_CSV_LV95/PLZO_CSV_LV95.csv", 
                            ";", escape_double = FALSE, trim_ws = TRUE, locale = locale(encoding = "Latin1"))
# Diese Spalten werden von diesem Datensatz nicht benötigt

PLZO_CSV_LV95$E <- NULL
PLZO_CSV_LV95$N <- NULL
PLZO_CSV_LV95$`BFS-Nr` <- NULL


# ALle als Dataframe umwandeln
PLZO_CSV_LV95 <- as.data.frame(PLZO_CSV_LV95)
PLZ_bereinigt <- PLZO_CSV_LV95[!duplicated(PLZO_CSV_LV95$PLZ),]

training <- as.data.frame(training)
X_test <- as.data.frame(X_test)


# Ironischerweise haben wir mit rätromanisch am wenigsten Duplikaten
test_daten <- left_join(X_test,PLZ_bereinigt,  by = c("zipcode" = "PLZ")) 
training_daten <- left_join(training,PLZ_bereinigt,  by = c("zipcode" = "PLZ")) 


# 5 Zeilen endeckt die NAs aufweisen
summary(is.na(test_daten$Kantonskürzel))

# Bemerkt das wir Probleme mit der Region Biel haben. Im urpsrünglichen Datenset wurde Biel angepasst (Dort war die PLZ 2502 und haben dies mit 2500 überschrieben)
view(test_daten  %>% filter(is.na(Kantonskürzel) == TRUE))

# Problem mit der Postleitzahl Luzern! Auch hier im Datenset Luzern hinzugefügt. 
view(training_daten %>% filter(is.na(Kantonskürzel) == TRUE))



# überprüfen ob es duplikatte gibt

view(test_daten %>% group_by(id) %>% filter(n() > 1))


View(PLZO_CSV_LV95)

# Im Prinzip könnten wir hier diese Tabelle normalisieren. Jedoch wird dies hier nicht berücksichtigt.

# Dafür benötigen wir eine saubere Postleitzahl! Wurde festgestellt, dass die Postleitzahlen korrekt sind
str(X_test$zipcode)
str(training$zipcode)
summary(is.na(X_test$zipcode))
summary(is.na(training$zipcode))




view(test_daten  %>% filter(is.na(Kantonskürzel) == TRUE))

# Untersuchen, ob der trainingsdatenset wirklich nur eine Spalte mehr hat  
length(colnames(training))
length(colnames(X_test))

colnames(training)
colnames(X_test)



