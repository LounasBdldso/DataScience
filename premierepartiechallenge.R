## chargement des données 
data <- read.csv("/Users/funkyflava/Downloads/farms_train.csv", header = TRUE, sep = ",")

# Chargement des libraririe necessaires pour la visualisations des données
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggplot2)
library(GGally)


# 2)nous nettoyons les données par précaution même si ce n'est pas très nécessaire avec le jeu de données actuel

# Supprimer NA si besoin
data <- na.omit(data)

# nous supprimons des potentiels doublons pour notre jeu de données
data <- data %>% distinct()

# Nous verifions la structure des données
str(data)



# 3) Visu classique

## 1- Répartition de la variable  cible diff, diagrammes en barre classique pour commencer la visualisation, sert à vérifier si les deux classes sont équilibrées en effectif.
ggplot(data, aes(x = factor(DIFF))) +
  geom_bar(fill = "purple") +
  labs(title = "Répartition de la variable cible DIFF",
       x = "Classe (0 = non, 1 = oui)", y = "Nombre d'observations") +
  theme_minimal()
# RESULTATS : Si une classe est beaucoup plus représentée que l’autre, le modèle risque de prédire toujours la classe majoritaire mauvais apprentissage.Les barres sont de hauteur proche les classes sont équilibrées, ce qui est une bonne base pour construire un modèle de classification fiable.



## 2- Histogrammes de la distribution des variables explicatives
data %>%
  pivot_longer(cols = c(R2, R7, R8, R17, R22, R32),
               names_to = "Variable", values_to = "Valeur") %>%
  ggplot(aes(x = Valeur, fill = Variable)) +
  geom_histogram(bins = 30, alpha = 0.6, color = "black") +
  facet_wrap(~Variable, scales = "free", ncol = 3) +
  labs(title = "Distribution des variables explicatives") +
  theme_minimal() +
  theme(legend.position = "none")
# RESULTATS Cette visualisation montre la distribution de chaque variable explicative grâce à des histogrammes. Elle sert à vérifier la variabilité des données et à repérer des valeurs extrêmes. On voit que R17 est concentrée autour de petites valeurs, alors que R22 est beaucoup plus dispersée. Ces informations nous aident à anticiper quelles variables seront plus ou moins utiles pour la classification et le choxi des modèles





