##
## Exercice 1
##

# Créez une variable appelée temperature et attribuez-lui la valeur 25.
temperature <-  25
# Créez une autre variable appelée ville et attribuez-lui le nom de votre ville.
ville <-  "Toulouse"
# Affichez la valeur de la variable temperature dans la console.
print(temperature)
# Affichez la valeur de la variable ville dans la console.
print(ville)

##
## Exercice 2
##

# Créez deux variables prenom et nom contenant votre prénom et votre nom de famille.
prenom <- "Jean"
nom <- "Dupont"

# Utilisez la fonction paste() pour concaténer ces deux variables en une seule chaîne de caractères représentant votre nom complet.
identite <-  paste(prenom, nom, sep = " ")

# Affichez le résultat dans la console.
print(identite)

##
## Exercice 3
##

# Créez une variable chiffre contenant le nombre 42 sous forme de texte (chaîne de caractères).
chiffre <-  "42"

# Convertissez cette variable en un nombre entier (integer) en utilisant la fonction as.integer().
chiffre_numeric <- as.integer(as.character(chiffre))


# Affichez le résultat dans la console.
print(chiffre_numeric)

##
## Exercice 4
##

# Créez deux variables a et b contenant des nombres de votre choix.
a <- 40
b <- 30

# Utilisez ces variables pour effectuer les opérations suivantes : addition, soustraction, multiplication et division.
addition <- a + b
soustraction <- a - b
multiplication <- a * b
division <- a / b

# Affichez les résultats dans la console.
print(addition)
print(soustraction)
print(multiplication)
print(division)


##
## Exercice 5
##

# Créez une variable age contenant votre âge.
age <- 18
# Utilisez la fonction sprintf() pour créer une chaîne de caractères qui affiche votre âge sous la forme "J'ai X ans." où X est la valeur de la variable age.

sprintf("J'ai %d ans", age)

##
## Exercice 6
##

# Créez un vecteur nombres contenant les nombres de 1 à 10.

vecteur_nombre <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
vecteur_nombre <- 1:10

# Creation d d'une séquence de 1 à 10 par pas de 1
vecteur_nombre <- seq(1,10,by = 1)

# Creation d'une séquence par pas de 5
vecteur_nombre_pas_5 <- seq(1,10, by = 5)

# Utilisez la fonction length() pour déterminer la longueur du vecteur.
length(vecteur_nombre)

# Utilisez la fonction sum() pour calculer la somme de tous les éléments du vecteur.
sum(vecteur_nombre)

# Utilisez la fonction rev() pour inverser l'ordre des éléments du vecteur.
rev(vecteur_nombre)

# Affichez les résultats dans la console en utilisant la fonction print()
print(rev(vecteur_nombre))

##
## Exercice 7 
##

# Créer un objet que vous nommerez age qui contiendra, en valeur numérique, votre âge.
# Affichez dans la console la valeur de l’objet age.
age <- 18
print(age)

# Modifiez le contenu de l’objet age en lui ajoutant 10 ans. Affichez dans la console la valeur de l’objet age suite à la modification.
age <- age + 10

# Affichez la date actuelle : today <- Sys.Date()). Soutrayez 10. Que constatez-vous ?
# Définissez votre date de naissance : as.Date() et faite la différence entre la date d'aujourd'hui et de votre année de naissance : difftime()

today <- Sys.Date()
annee_de_naissance <-  as.Date("2023-01-01")
difftime(today, annee_de_naissance)

# En faisant appel à la fonction ls(), affichez le nom des objets existants dans l’environnement global.
ls()

# À l’aide de la fonction rm(), supprimez l’objet age, puis tentez d’afficher le contenu de l’objet age dans la console.
rm(age)

# Affichez à nouveau le nom des objets existants dans l’environnement global.
ls()







