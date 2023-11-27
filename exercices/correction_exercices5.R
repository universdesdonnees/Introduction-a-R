###############
# Exercices
###############

# Chargement des libraries et des données
library(dplyr)
library(nycflights13)
data(flights)
data(airports)
data(airlines)

##
## Exercice 1
##

resultat_ex1 <- list(
  dixieme_aeroport = airports[10, ],
  cinq_premieres_compagnies = airlines %>% head(5),
  aeroport_altitude_min = airports %>% arrange(alt) %>% head(1),
  vols_juillet = flights %>% filter(month == 7),
  vols_retard_5_15 = flights %>% filter(arr_delay >= 5, arr_delay <= 15),
  vols_compagnies = flights %>% filter(carrier %in% c("DL", "UA", "AA")),
  flights_tries = flights %>% arrange(desc(dep_delay)),
  airports_sans_tz_tzone = airports %>% select(-tz, -tzone),
  colonnes_delay = flights %>% select(ends_with("delay")),
  rename_columns = airports %>% 
    rename(altitude = alt, fuseau_horaire = tzone)
)

##
## Exercice 2
##

resultat_ex2 <- list(
  # Réécriture de l'exercice 1 avec pipe
  dixieme_aeroport = airports %>% slice(10),
  cinq_premieres_compagnies = airlines %>% slice(1:5),
  aeroport_altitude_min = airports %>% 
    arrange(alt) %>% 
    slice(1),
  vols_juillet = flights %>% filter(month == 7),
  vols_retard_5_15 = flights %>% 
    filter(arr_delay >= 5 & arr_delay <= 15),
  vols_compagnies = flights %>%
    filter(carrier %in% c("DL", "UA", "AA")),
  flights_tries = flights %>% 
    arrange(desc(dep_delay)),
  airports_sans_tz_tzone = airports %>%
    select(-tz, -tzone),
  colonnes_delay = flights %>%
    select(ends_with("delay")),
  rename_columns = airports %>% 
    rename(altitude = alt, fuseau_horaire = tzone),
  
  # Nouvelles requêtes utilisant le pipe
  vols_SFO = flights %>% filter(dest == "SFO") %>% 
    arrange(desc(dep_delay)),
  vols_sept_oct = flights %>% 
    filter(month %in% c(9, 10)) %>%
    select(dest, dep_delay) %>%
    mutate(retard_h = dep_delay / 60) %>%
    arrange(desc(retard_h)) %>%
    slice(1:5)
)

##
## Exercice 3
##

resultat_ex3 <- list(
  nb_vols_par_mois = flights %>%
    group_by(month) %>%
    summarize(nb_vols = n()),
  distance_moyenne_par_origin = flights %>% 
    group_by(origin) %>% 
    summarize(distance_moyenne = mean(distance, na.rm = TRUE)),
  vols_LAX_par_mois = flights %>% 
    filter(dest == "LAX") %>% 
    group_by(month) %>% 
    summarize(nb_vols = n()),
  nb_vols_par_mois_et_dest = flights %>% 
    group_by(month, dest) %>% 
    summarize(nb_vols = n()),
  dest_max_vols_par_mois = flights %>% 
    group_by(month) %>% 
    count(dest) %>% top_n(1),
  pourcentage_vols_par_mois = flights %>% 
    group_by(month) %>% 
    summarize(nb_vols = n()) %>%
    mutate(pourcentage = nb_vols / sum(nb_vols)),
  duree_moyenne_par_origin_dest = flights %>%
    group_by(origin, dest) %>% 
    summarize(duree_moyenne = mean(air_time, na.rm = TRUE)) %>%
    group_by(origin) %>%
    top_n(1, duree_moyenne)
)

##
## Exercice 4
##

resultat_ex4 <- list(
  join_flights_airlines = flights %>% 
    left_join(airlines, by = "carrier"),
  retard_moyen_par_compagnie = flights %>% 
    left_join(airlines, by = "carrier") %>% 
    group_by(name) %>% 
    summarize(retard_moyen = mean(dep_delay, na.rm = TRUE)) %>% 
    arrange(desc(retard_moyen)),
  join_flights_airports = flights %>% 
    left_join(airports, by = c("dest" = "faa")),
  aeroport_min_vols_par_mois = flights %>%
    left_join(airports, by = c("dest" = "faa")) %>% 
    group_by(month, name) %>% summarize(nb_vols = n()) %>% 
    arrange(nb_vols) %>% 
    slice(1),
  table_depart_arrivee = flights %>% 
    left_join(airports, by = c("origin" = "faa")) %>% 
    left_join(airports, by = c("dest" = "faa")) %>% 
    select(name.x, name.y)
)

##
## Exercice 5
##

flights_dest <- flights %>% 
  group_by(dest) %>% 
  summarize(nb_vols = n()) %>% 
  left_join(airports, by = c("dest" = "faa"))


library(leaflet)

leaflet(data = flights_dest) %>%
  addTiles() %>%
  addCircles(lng = ~lon, lat = ~lat,
             radius = ~nb_vols * 10, popup = ~name)
