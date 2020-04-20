
# Die Daten werden importiert
library(readr)
training <- read_csv("data/training.csv")
View(training)


library(readr)
X_test <- read_csv("data/X_test.csv")
View(X_test)


# Untersuchen, ob der trainingsdatenset wirklich nur eine Spalte mehr hat  
length(colnames(training))
length(colnames(X_test))


# Die Adressdaten sind hier zu unsauber. Ich hole mir Hilfe von OpenData und lade mir folgendes Datenset herunter

library(readr)
PLZO_CSV_LV95 <- read_delim("data/OpenData/PLZO_CSV_LV95/PLZO_CSV_LV95.csv", 
                            ";", escape_double = FALSE, trim_ws = TRUE)
View(PLZO_CSV_LV95)

# Im Prinzip könnten wir hier diese Tabelle normalisieren. Jedoch wird dies hier nicht berücksichtigt.


training$price <- NULL 