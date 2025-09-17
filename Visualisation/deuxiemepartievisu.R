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


## 3- Boxplots par classe cible
data %>%
  pivot_longer(cols = c(R2, R7, R8, R17, R22, R32),
               names_to = "Variable", values_to = "Valeur") %>%
  ggplot(aes(x = factor(DIFF), y = Valeur, fill = factor(DIFF))) +
  geom_boxplot() +
  facet_wrap(~Variable, scales = "free", ncol = 3) +
  labs(title = "Distribution des variables selon DIFF",
       x = "Classe DIFF", y = "Valeur") +
  theme_minimal() +
  theme(legend.position = "none")
#EXPLICATIONS ET RESULTATS Nous avons créé des boxplots à l’aide de la librairie ggplot2 et de la fonction geom_boxplot().Cette visualisation permet de comparer la distribution de chaque variable explicative (R2, R7, R8, R17, R22, R32) selon les deux classes de la variable cible DIFF (0 et 1).
#RESULTATS Grâce a cette visu on peut rapidement identifier des différences entre classes R2 et R32 présentent des médianes plus élevées pour la classe 1,R7 et R17 ont des médianes plus élevées pour la classe 0,R22 et R8 montrent des médianes très proches entre classes moins discriminantes.
#RESULTATS Cette visualisation permet de déterminer quelles variables sont potentiellement utiles pour la classification car elles séparent mieux les classes, et lesquelles apportent moins d’information.






# Colonnes à inclure (cible + variables explicatives)
cols_all <- c("DIFF","R2","R7","R8","R17","R22","R32")

# Matrice de scatterplots (couleur = classe DIFF) Nous avons utilisé la librairie GGally (extension de ggplot2) et la fonction ggpairs() afin de générer une matrice de visualisations multivariées
p <- ggpairs(
  data,
  columns = match(cols_all, names(data)),   # inclut DIFF + features
  aes(color = factor(DIFF), alpha = 0.6),
  diag = list(continuous = "densityDiag", discrete = "barDiag"), # densité ou barres
  upper = list(continuous = "points"),      # nuages de points
  lower = list(continuous = "points", combo = "box_no_facet")    # boxplots avec DIFF
)
p

# Sauvegarde
ggsave("pairs_scatter_all.png", plot = p, width = 12, height = 10, dpi = 300)
#RESULTATS Cette visualisation est particulièrement utile car elle donne une vue d’ensemble elle permet de repérer les variables discriminantes, de voir les corrélations entre variables, et d’évaluer si une séparation linéaire est envisageable ou si des modèles plus complexes seront nécessaires
#Utilisation d une sauvegarde demander par une IA pour avoir accès a l'image sous format pdf étant donné la quantité des données.