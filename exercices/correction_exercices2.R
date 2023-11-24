###
### Exercice 1 . Les vecteurs
###


# 1)	
vec1 <- c(1:12, 16,17,18)

# a.
print(vec1[-3])

# b.	
vec1 [vec1 > 7]

# c.
vec1_pair <- vec1[vec1 %% 2 == 0]
vec1_impair <- vec1[vec1 %% 2 != 0]

# 2)
sort(sample(1:100, 20))
sort(sample(1:100, 20), decreasing = TRUE)

# 3)	
x <- 0:10
vec3 <- rep(x, each = 3)

# 4)
vec4 <- rep(letters, 1:26)
length(vec4)

# 5)	
vec5 <- paste0("individu",1:100)

# 6
vect <- c(82, 98, 34, 23, 76, 54) 
variance <- sum((vect - mean(vect))**2) / (length(vect) -1)
ecart_type <- sqrt(variance)

var(vect)
sd(vect)

###
### Exercice 2 
###

# 1) Création de deux matrices A et B de dimensions 3x3
A <- matrix(1:9, nrow=3, ncol=3, byrow = TRUE)

B <- matrix(9:1, nrow=3, ncol=3)

# Afficher les matrices A et B
print("Matrice A:")
print(A)

print("Matrice B:")
print(B)

# 2) Opérations sur les matrices

# a) Addition de A et B
print("Addition de A et B:")
print(A + B)

# b) Produit matriciel de A par B
print("Produit matriciel de A par B:")
print(A %*% B)

# c) Transpose de la matrice A
print("Transpose de la matrice A:")
print(t(A))

# 3) Mettre des 0 sur la diagonale de la matrice A
diag(A) <- 0
print("Matrice A avec des 0 sur la diagonale:")
print(A)


###
### Exercice 3
###

# 1)
# Création d'une matrice 5x5 avec des nombres 
# Crée une séquence aléatoires entre -1 et 1 de nombres de -1 à 1 par incréments de 0.01
values <- seq(-1, 1, by = 0.01)  
mat <- matrix(sample(values, 25, replace=TRUE), nrow=5)
print(mat)
# ou tirer 25 valeurs dans une loi uniforme
mat <- matrix(runif(25, -1, 1), nrow=5)

# a) Indices des éléments supérieurs à 0,5
# b) Nouvelle matrice binaire
mat[mat > 0.5] <- 1 
mat[mat <= 0.5] <- 0 
mat_binaire <- mat

# ou 
mat_binaire <- ifelse(mat <= 0.5, 0, 1)

# c) Moyenne des éléments de chaque ligne de la matrice binaire
moy_lignes <- apply(mat_binaire, 1, mean)
# ou 
moy_lignes <- rowMeans(mat_binaire)

# 2)
# Création d'une matrice X 4x3 avec des valeurs aléatoires entre 1 et 100
X <- matrix(runif(12, 1, 100), nrow=4)

# a) Extraction de la première ligne et de la première colonne
premiere_ligne <- X[1,]
premiere_colonne <- X[,1]

# b) Somme de chaque colonne
somme_colonnes <- apply(X, 2, mean)
somme_colonnes <- colMeans(X)

# c) Moyenne de chaque ligne
moyenne_lignes <- rowMeans(X)

# d) Modification de la dernière colonne
X[,3] <- rowSums(X)

# e) Normalisation de la matrice
# Calculer les moyennes et écarts-types pour chaque colonne
moyennes <- colMeans(X)
ecarts_types <- sqrt(colMeans((X - moyennes)^2))

# Normaliser la matrice
X_norm <- (X - moyennes) / ecarts_types

###
### Exercice 4
###

# 1) Création de deux listes
liste1 <- list(a=1, b=2, c=3)
liste2 <- list(d=4, e=5, f=6)

# 2) Fusion des deux listes
liste_combinee <- c(liste1, liste2)

# 3) Ajout de noms à chaque élément
names(liste_combinee) <- c("elem1", "elem2", "elem3", "elem4", "elem5", "elem6")


###
### Exercice 5
###

# 1) Création de la liste" université"

# a. Liste Etudiants
etudiants <- list(
  Prenom = c("Luc", "Julie", "Samir"),
  Age = c(20, 22, 21)
)

# b. Liste cours
cours <- list(
  nom = c("Mathématiques", "Physique", "Histoire"),
  Professeur = c("Dr. Dupont", "Dr. Leclerc", "Mme. Berger")
)

# Liste université
universite <- list(Etudiants = etudiants, Cours = cours)

# 2) Extraction et affichage
age_julie <- universite$Etudiants$Age[universite$Etudiants$Prenom == "Julie"]
prof_histoire <- universite$Cours$Professeur[universite$Cours$nom == "Histoire"]

cat(sprintf("L'âge de Julie est %d ans et le professeur du cours d'Histoire est %s.\n", age_julie, prof_histoire))

# 3) Ajout de l'étudiante "Sophie"
universite$Etudiants$Prenom <- c(universite$Etudiants$Prenom, "Sophie")
universite$Etudiants$Age <- c(universite$Etudiants$Age, 23)

# 4) Modification de l'âge de "Luc"
universite$Etudiants$Age[universite$Etudiants$Prenom == "Luc"] <- 21

# 5) Suppression de "Samir"
index_samir <- which(universite$Etudiants$Prenom == "Samir")
universite$Etudiants$Prenom <- universite$Etudiants$Prenom[-index_samir]
universite$Etudiants$Age <- universite$Etudiants$Age[-index_samir]

# 6) Ajout du cours "Chimie"
universite$Cours$nom <- c(universite$Cours$nom, "Chimie")
universite$Cours$Professeur <- c(universite$Cours$Professeur, "Dr. Gautier")

# Affichage final de la liste universite pour vérification
print(universite)

###
### Exercice 6
###

# Charger les données
data(precip)

# 1) Liste des villes
villes <- names(precip)
print(villes)

# 2) Nombre de villes
nombre_villes <- length(villes)
cat(sprintf("Il y a %d villes pour lesquelles des mesures sont disponibles.\n", nombre_villes))

# 3) Niveau de précipitation des villes spécifiées
villes_specifiees <- c("Philadelphia", "Columbia", "Baltimore", "Sacramento")
niveaux_precipitation <- precip[villes_specifiees]
print(niveaux_precipitation)

### Exercice 7

# Création du dataframe
ventes <- data.frame(
  Produit = c("A", "B", "C", "D"),
  Prix = c(10.99, 15.50, 6.99, 12.78),
  Quantité = c(100, 67, 23, 80)
)

# 1) Produit le plus rentable et le moins rentable
ventes$Rentabilite <- ventes$Prix * ventes$Quantité
produit_plus_rentable <- ventes$Produit[which.max(ventes$Rentabilite)]
produit_moins_rentable <- ventes$Produit[which.min(ventes$Rentabilite)]

cat(sprintf("Le produit le plus rentable est %s et le produit le moins rentable est %s.\n", 
            produit_plus_rentable, produit_moins_rentable))

# 2) Chiffre d'affaires total
CA_total <- round(sum(ventes$Rentabilite), 2)
cat(sprintf("Le chiffre d'affaires total est de %g.\n", CA_total))

# 3) Statistiques sur les prix des produits
moyenne_prix <- mean(ventes$Prix)
ecart_type_prix <- sd(ventes$Prix)
mediane_prix <- median(ventes$Prix)

cat(sprintf("La moyenne des prix est de %f, l'écart-type est de %f et la médiane est de %f.\n",
            moyenne_prix, ecart_type_prix, mediane_prix))

### Exercice 8

# Installer et charger le package dplyr si nécessaire
if(!require(dplyr)) {
  install.packages("dplyr")
  library(dplyr)
}

# 1) Création du data frame
df <- data.frame(
  annees = c(2015, 2016, 2017, 2018, 2019, 2020, 2021),
  pib = c(549901.2, 558184.9, 574852.5, 591119.6, 610003.3, 577434.8, 624705.6)
)

# 2) Extraction des années aux positions 2 et 4
annees_2_4 <- df$annees[c(2,4)]
print(annees_2_4)

# 3) Dernier élément de la colonne "annees"
derniere_annee <- df$annees[length(df$annees)]
print(derniere_annee)

# 4) Années pour lesquelles le PIB est compris entre 560000 et 590000
annees_pib <- df$annees[df$pib > 560000 & df$pib < 590000]
print(annees_pib)

# 5) Taux de croissance du PIB entre 2015 et 2021
taux_croissance <- ((df$pib[df$annees == 2021] - df$pib[df$annees == 2015]) / df$pib[df$annees == 2015]) * 100
cat(sprintf("Taux de croissance du PIB entre 2015 et 2021: %f%%\n", taux_croissance))

# 6) Taux de croissance du PIB d'une année à l'autre avec lag()
attach(df) # pour ne pas avoir a mentionner df$ dans l'instruction suivante 
df$taux_croissance = round((pib - lag(pib, default = pib[1])) / lag(pib, default = pib[1]) * 100, 
                           digits = 2)
df$taux_croissance <- paste(df$taux_croissance, "%")
print(df)

# 7) Correction de la valeur du PIB pour 2016
df$pib[df$annees == 2016] <- 55963.2

# Affichage du dataframe pour vérification
print(df)

