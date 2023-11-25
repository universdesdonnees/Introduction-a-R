###############
# Exercices
###############

##
## Exercice 1
##


# 1) Boucle pour afficher les numéros de 1 à 5
for(i in 1:5) {
  cat(sprintf("Numéro %d\n", i))
}

# 2) Création d'un vecteur contenant les lettres A à Z avec des répétitions croissantes
vec4 <- rep(LETTERS, 1:26)
cat(sprintf("La longueur de vec4 est %d\n", length(vec4)))

# 3) Fonction pour retourner le maximum de deux nombres
maximum_de_deux <- function(a, b) {
  return(max(a, b))
}

# 4) 
factorielle <- function(n) {
  result <- 1
  for(i in 1:n) {
    result <- result * i
  }
  return(result)
}

# ou fonction récursive pour calculer la factorielle d'un nombre
factorielle <- function(n) {
  if(n <= 0) {
    return(1)
  } else {
    return(n * factorielle(n-1))
  }
}

##
## Exercice 2
##

# Génération d'un vecteur de 100 nombres aléatoires entre 1 et 100
donnees <- sample(1:100, 100, replace = TRUE)

# 1) Fonction pour calculer la médiane d'un vecteur
mediane <- function(x) {
  return(median(x))
}
cat(sprintf("La médiane est : %g ", mediane(donnees)))

# 2) Fonction pour compter le nombre d'éléments d'un vecteur dans un intervalle donné
nombre_elements_intervalle <- function(interval, data) {
  return(sum(data >= interval[1] & data <= interval[2]))
}

nombre_elements_intervalle(interval = c(10,20), donnees)

##
## Exercice 3
##

# Création de vecteurs pour les produits et leurs prix
produits <- c("pommes", "bananes", "cerises", "dates", "figues")
prix <- c(0.5, 0.6, 1.2, 2.0, 2.5)


# 1) Fonction pour ajouter une vente et retourner le montant de la vente dans le vecteur ventes

ventes <- numeric(length(produits))

ajouter_vente <- function(nom_produit, quantite) {
  index <- which(produits == nom_produit)
  ventes[index] <- ventes[index] + quantite
  return(prix[index] * quantite)
}

print(ajouter_vente("pommes", 3))

# 2) Boucle pour simuler 3 ventes de chaque produit et afficher le total
total_ventes <- 0
for(i in 1:length(produits)) {
  total_ventes <- total_ventes + ajouter_vente(produits[i], 3)
}
cat(sprintf("Total des ventes : %g\n", total_ventes))

##
## Exercice 4
##

# Création d'une liste d'étudiants et leurs notes
etudiants <- list(Jean = c(12, 14, 15, 13, 16),
                  Marie = c(15, 16, 14, 15, 16),
                  Paul = c(10, 9, 11, 10, 12))

# 1) Fonction pour calculer la moyenne d'un étudiant
moyenne_etudiant <- function(nom) {
  return(mean(etudiants[[nom]]))
}

moyenne_etudiant(("Jean"))

# 2) Fonction pour calculer la moyenne d'une matière pour tous les étudiants
moyenne_matiere <- function(matiere_index) {
  return(mean(sapply(etudiants, function(x) x[matiere_index])))
}

moyenne_matiere(1)

# 3) Utilisation de lapply pour calculer la moyenne de chaque étudiant
moyennes <- lapply(etudiants, mean)
print(moyennes)

##
## Exercice 5
##

# Création d'une dataframe pour une bibliothèque
bibliotheque <- data.frame(Titre = c("Livre1", "Livre2", "Livre3"), 
                           Auteur = c("Auteur1", "Auteur2", "Auteur3"), 
                           Année_de_Publication = c(1999, 2005, 2015), 
                           Emprunte = c(TRUE, FALSE, TRUE))

# 1) Fonction pour emprunter un livre
emprunter <- function(titre, biblio) {
  biblio$Emprunte[biblio$Titre == titre] <- TRUE
  return(biblio)
}

# 2) Fonction pour retourner un livre
retourner <- function(titre, biblio) {
  biblio$Emprunte[biblio$Titre == titre] <- FALSE
  return(biblio)
}

# 3) Fonction pour afficher les livres disponibles
livres_disponibles <- function(biblio) {
  return(biblio$Titre[!biblio$Emprunte])
  
}

# 4) Simulation d'emprunt et de retour de livres
bibliotheque <- emprunter(titre = "Livre2", biblio = bibliotheque)
bibliotheque <- retourner("Livre1", biblio = bibliotheque)
cat(sprintf("Livres disponibles : %s\n",
            paste(livres_disponibles(biblio = bibliotheque), collapse=", ")))

# 5) Fonction pour calculer la moyenne d'un nombre variable d'arguments
moyenne <- function(...) {
  args <- list(...)
  return(mean(unlist(args)))
}
moyenne(3, 7, 9, 198)


##
## Exercice 6
##

### Chiffrement de César
# Le principe du chiffrement de César est simple : chaque lettre du 
# texte d'origine est remplacée par une lettre située à un certain 
# nombre de positions plus loin dans l'alphabet.
# Si le décalage dépasse la fin de l'alphabet, on repart du début.

# Par exemple, avec un décalage de 3 :
# 
# - A devient D
# - B devient E
# - Z devient C
# ... et ainsi de suite.
# 
# 1. La Fonction *decale* :
# Cette fonction prend en entrée une lettre (minuscule ou majuscule) et un décalage,
# puis renvoie la lettre décalée en fonction du chiffrement de César. Donc :
# 
# - Si la lettre est en minuscule, la fonction utilise 
# le vecteur letters (qui contient les lettres de l'alphabet en minuscules) 
# pour déterminer la lettre décalée.
# - Si la lettre est en majuscule, la fonction utilise le vecteur LETTERS 
# (qui contient les lettres de l'alphabet en majuscules).
# - Si le caractère donné n'est pas une lettre (par exemple, un espace, 
#                                               une ponctuation, etc.), il est renvoyé tel quel.
#   

# 1) Fonction pour décaler une lettre selon le chiffrement de César
# Le %% 26 permet de gérer le z pour revenir à 0 et a pour revenir à 26

decale <- function(lettre, shift) {
  # si minuscule
  if(lettre %in% letters) {
    return(letters[(which(letters == lettre) + shift - 1) %% 26 + 1])
    # si majuscule
  } else if(lettre %in% LETTERS) {
    return(LETTERS[(which(LETTERS == lettre) + shift - 1) %% 26 + 1])
    # si autre qu'une lettre
  } else {
    return(lettre)
  }
}


# 2. La Fonction *crypter* :
#   Cette fonction prend en entrée un mot et un décalage, 
# et renvoie le mot crypté en utilisant le chiffrement de César.
# 
# etape 1 - La fonction divise d'abord le mot en lettres uniques.
# etape 2 - Pour chaque lettre, elle utilise la fonction decale pour obtenir la lettre décalée.
# etape 3 - Enfin, elle combine les lettres décalées pour former le mot crypté.
# 

# 2) Fonction pour crypter un mot selon le chiffrement de César
crypter <- function(mot, shift) {
  # obtenir les lettres uniques
  lettre_uniques <- strsplit(mot, "")[[1]]
  # decaler chaque lettre
  lettre_uniques_decalees <- sapply(lettre_uniques, decale, shift)
  # coller et retourner les lettres decallées
  return(paste(lettre_uniques_decalees, collapse = ""))
}

# 3. Programme principal, combinaison de *decale* et  *crypter*
# Le programme principal permet à l'utilisateur de saisir une phrase et un décalage, 
# puis utilise la fonction crypter pour afficher la phrase cryptée. 
# Ensuite, il décrypte la phrase cryptée en utilisant un décalage négatif et affiche le résultat.

# 3) Programme principal pour crypter et décrypter une phrase

phrase <- "Je serais à la gare à 10h"
shift <- 100

# crypter
phrase_cryptee <- crypter(phrase, shift)
cat(sprintf("Phrase cryptée : %s\n", phrase_cryptee))

# decrypter 
phrase_decryptee <- crypter(phrase_cryptee, -shift)
cat(sprintf("Phrase décryptée : %s\n", phrase_decryptee))


