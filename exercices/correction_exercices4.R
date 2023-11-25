###############
# Exercices
###############


##
## Exercice 1
##

# Chargement de la bibliothèque stringr pour la manipulation des chaînes
library(stringr)

# Texte fourni
Texte <- "Contactez-nous à contact@exemple.com ou à support@email.org pour toute question.
Visitez notre site web à http://www.mon-site-web.com. Les hashtags #Rstats, #DataScience et 
#Analytics sont populaires sur les réseaux sociaux. Appelez-nous au 
(123) 456-7890 ou envoyez un SMS au (555) 123-4567 pour plus d'informations.
Les événements auront lieu les 25/12/2023, 31/01/2024 et 15/08/2024. 
Suivez @Utilisateur1 et @Utilisateur2 sur Twitter pour les dernières mises à jour. 
Consultez notre site web à https://www.mon-site-web.com ou visitez http://www.example.com pour plus d'informations.
Les codes postaux des États-Unis incluent 90210, 10001, et 60601. 
Les fichiers de données sont stockés dans data1.txt, data2.csv, et rapport.txt."

# 1. Extraction des adresses e-mail
emails <- str_extract_all(Texte, "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")

# 2. Remplacement des hashtags par des espaces
Texte_sans_hashtags <- str_replace_all(Texte, "#\\S+", " ")

# 3. Extraction des numéros de téléphone
telephones <- str_extract_all(Texte, "\\(\\d{3}\\) \\d{3}-\\d{4}")

# 4. Extraction des dates au format dd/mm/yyyy
dates <- str_extract_all(Texte, "\\d{2}/\\d{2}/\\d{4}")

# 5. Extraction des noms d'utilisateur Twitter
utilisateurs_twitter <- str_extract_all(Texte, "(?<=\\s|^)@\\w+\\b")

# 6. Extraction des URL
urls <- str_extract_all(Texte, "https?://[\\w\\.-]+")

# 7. Extraction des codes postaux américains
codes_postaux <- str_extract_all(Texte, "\\b\\d{5}\\b")

# 8. Extraction des noms de fichiers avec l'extension ".txt"
fichiers_txt <- str_extract_all(Texte, "\\b\\w+\\.txt\\b")

##
## Exercice 2 
##

# Liste des commentaires
commentaires_series <- list(
  "Cette série est incroyable, je suis accro !",
  "Le dernier épisode était décevant, l'intrigue est devenue ennuyeuse.",
  "J'adore les personnages de cette série, ils sont si bien écrits.",
  "Les effets spéciaux sont incroyables, c'est du grand spectacle !",
  "Cette série est tellement ennuyeuse, je ne peux pas la regarder.",
  "Je recommande vivement cette série à tous les fans de science-fiction."
)

# Création de deux vecteurs vides pour stocker les commentaires positifs et négatifs
commentaires_positifs <- vector("list")
commentaires_negatifs <- vector("list")

# Mots-clés pour l'analyse de sentiment
mots_cles_positifs <- c("incroyable", "j'adore", "bien écrits", "grand spectacle", "recommande")
mots_cles_negatifs <- c("décevant", "ennuyeuse", "ne peux pas")

# Analyse de sentiment
for (i in seq_along(commentaires_series)) {
  commentaire <- tolower(commentaires_series[[i]])
  if (any(str_detect(commentaire, mots_cles_positifs))) {
    commentaires_positifs <- c(commentaires_positifs, commentaire)
  } else if (any(str_detect(commentaire, mots_cles_negatifs))) {
    commentaires_negatifs <- c(commentaires_negatifs, commentaire)
  }
}

# Affichage des résultats
print("Commentaires Positifs:")
print(commentaires_positifs)
print("Commentaires Négatifs:")
print(commentaires_negatifs)

##
## Exercice 3
##

### Étape 1 : Création d'un objet Corpus

library(tm)
library(tidyverse)
library(wordcloud)
library(RColorBrewer)

# Supposons que le texte du roman est stocké dans un fichier texte
texte <- readLines("../data/orgueil_et_prejuges.txt", encoding = "UTF-8")  

# Création d'un Corpus
corpus <- VCorpus(VectorSource(texte))

### Étape 2 : Prétraitement des Données Textuelles
corpus <- tm_filter(corpus, function(x) length(words(x)) > 0)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("french"))
corpus <- tm_map(corpus, PlainTextDocument)

### Étape 3: Identification des Mots les Plus Fréquents
dtm <- TermDocumentMatrix(corpus)
findFreqTerms(dtm, lowfreq = 50)  # Modifier 'lowfreq' selon les besoins

### Étape 4 : Analyse de la Distribution des Mots

# Génération d'un nuage de mots
wordcloud(words = dtm$dimnames$Terms, freq = colSums(as.matrix(dtm)), 
          scale = c(3, 0.5), max.words = 100, random.order = FALSE, 
          colors = brewer.pal(8, "Dark2"))

##
## Exercice 4
##

library(lubridate)

reunions <- list(
  c(debut = "2023-11-06 09:00:00", fin = "2023-11-06 10:30:00"),
  c(debut = "2023-11-07 14:00:00", fin = "2023-11-07 16:00:00"),
  c(debut = "2023-11-08 10:30:00", fin = "2023-11-08 12:00:00")
)

duree_totale <- 0

for(reunion in reunions){
  
  debut <- ymd_hms(reunion["debut"])
  fin <-  ymd_hms(reunion["fin"])
  duree_totale <- duree_totale + (fin - debut)
  
}

cat(" La durée totale des réunions était de : ", as.duration(duree_totale) / 3600, "heures")


##
## Exercice 5
##

library(lubridate)

dates <- list("2023-11-06", "2023-11-07", "2023-11-10", "2023-11-15")
date_reference <- ymd("2023-11-09")

# Conversion de la liste en vecteur de dates
dates_vecteur <- ymd(dates)

# Trouver la date la plus proche
date_proche <- dates_vecteur[which.min(abs(dates_vecteur - date_reference))]


##
## Exercice 6
##

# Fonction pour générer des dates en fonction des jours de la semaine
generer_dates_jours_semaine <- function(jours_semaine, annee_debut, annee_fin) {
  dates <- seq(ymd(paste0(annee_debut, "-01-01")), 
               ymd(paste0(annee_fin, "-12-31")), 
               by = "day")
  jours_indices <- match(jours_semaine, wday(dates,week_start = 1, label = TRUE, abbr = FALSE))
  dates[wday(dates) %in% jours_indices]
}

# Utilisation de la fonction
jours_semaine <- c("lundi", "mercredi")
annee_debut <- 2023
annee_fin <- 2024
dates_jours_semaine <- generer_dates_jours_semaine(jours_semaine, annee_debut, annee_fin)

##
## Exercice 7
##

# Fonction pour générer une séquence de dates et heures régulières
generer_sequence_dates_heures <- function(date_debut, date_fin, intervalle) {
  seq(from = ymd_hms(date_debut), to = ymd_hms(date_fin), by = intervalle)
}

# Utilisation de la fonction
date_debut <- "2023-01-01 00:00:00"
date_fin <- "2023-01-02 00:00:00"
intervalle <- "30 min"

sequence_dates_heures <- generer_sequence_dates_heures(date_debut, date_fin, intervalle)


##
## Exercice 8
##

# Fonction pour générer un calendrier mensuel
generer_calendrier_mensuel <- function(annee, mois) {
  browser()
  # Créer une date du premier jour du mois
  date_debut <- as.Date(paste(annee, mois, "01", sep = "-"))
  
  # Obtenir le dernier jour du mois
  dernier_jour <- as.Date(paste(annee, mois, days_in_month(mois),
                                sep = "-"))
  
  # Créer une séquence de dates pour le mois
  jours_du_mois <- seq(date_debut, dernier_jour, by = "1 day")
  
  # Formater le calendrier en une matrice 7x5 (7 jours, 5 semaines)
  calendrier <- data.frame (dates = jours_du_mois, 
                            jours = sapply(jours_du_mois, wday))
  
  
  # Imprimer le calendrier
  print(calendrier)
}

# Utilisation de la fonction pour générer un calendrier mensuel
generer_calendrier_mensuel(2023, 12)


##
## Exercice 9
##

library(stringr)

crypterMot <- function(mot) {
  motCrypte <- ""
  
  # Découpage du mot lettres par lettres
  
  for (lettre in strsplit(mot, "")[[1]]) {
    
    # Vérifie que la lettre est en majuscules
    
    if (lettre %in% LETTERS) {
      
      # Calcul du nombre d'occurences de la lettre
      
      nbOccurences <- sum(str_count(mot, lettre))
      
      # Calcul du décalage selon le nombre d'occurences
      
      kDecalage <- ifelse(nbOccurences %% 2 != 0, 2 * nbOccurences, nbOccurences %/% 2)
      
      # Calcul de la lettre cryptée
      
      lettreCryptee <- LETTERS[(which(LETTERS == lettre) + kDecalage - 1) %% 26 + 1]
      
      # Ajout de la lettre cryptée dans la variable motCrypte
      
      motCrypte <- paste0(motCrypte, lettreCryptee)
    } else {
      
      # Si la lettre n'est pas en majuscule alors elle n'est pas cryptée
      
      motCrypte <- paste0(motCrypte, lettre)
    }
  }
  
  return(motCrypte)
}

# Exemple d'utilisation

motOriginal <- "HAPPY"
motCrypte <- crypterMot(motOriginal)
cat("Mot original :", motOriginal, "\n")
cat("Mot crypté   :", motCrypte, "\n")


