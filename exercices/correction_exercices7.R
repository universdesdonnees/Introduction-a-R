###############
# Exercices
###############

### Exercice 1: Graphique en ligne

library(plotly)

x <- c(1, 2, 3, 4, 5)
y <- c(5, 4, 3, 2, 1)
plot_ly(x = x, y = y, type = 'scatter', mode = 'lines')

### Exercice 2: Nuage de Points

plot_ly(x = x, y = y, type = 'scatter', mode = 'markers')

### Exercice 3: Diagramme à Barres

plot_ly(x = x, y = y, type = 'bar')

### Exercice 4: Graphique à Bulles

plot_ly(x = x, y = y, type = 'scatter', 
        mode = 'markers', 
        marker = list(size = c(10, 20, 30, 40, 50), 
                      color = c("red", "green", "blue", "yellow", "purple")))

### Exercice 5: Carte de Chaleur (Heatmap)

plot_ly(z = volcano, type = "heatmap")

### Exercice 6: Graphique en Aires

plot_ly(x = x, y = y, fill = 'tozeroy')

### Exercice 7: Ajout de y3 au Nuage de Points

y3 <- c(2, 3, 4, 5, 6)
plot_ly(x = x, y = y, type = 'scatter', mode = 'markers') %>%
  add_trace(y = y3, mode = 'markers')

### Exercice 8: Transformation en Légende

plot_ly(x = x, y = y, type = 'scatter', mode = 'markers') %>%
  add_trace(y = y3, mode = 'markers') %>%
  layout(showlegend = TRUE, legend = list(x = 1, y = 1, bgcolor = "red"))

### Exercice 9: Ajout des Axes

plot_ly(x = x, y = y, type = 'scatter', mode = 'markers') %>%
  layout(xaxis = list(nticks = 40, showline = TRUE, title = "X Axis", mirror = "all"),
         yaxis = list(nticks = 40, showline = TRUE, title = "Y Axis", mirror = "all"))

### Exercice 10: Modification des Axes

plot_ly(x = x, y = y, type = 'scatter', mode = 'markers') %>%
  layout(xaxis = list(nticks = 20, showgrid = TRUE, zeroline = TRUE, showline = FALSE),
         yaxis = list(nticks = 20, showgrid = TRUE, zeroline = TRUE, showline = FALSE))
