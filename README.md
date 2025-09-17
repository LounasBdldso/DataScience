<a name="readme-top"></a>

<div align="center">

# 🤖 Demi-journée de Data Science

**Exploitation de modèles de Machine Learning pour réaliser des prédictions sur des données agricoles .
Elles décrivent l’état financier d’exploitations agricoles à partir de plusieurs ratios financiers (capital investi, Dette à long et moyen terme, Charges financières ... )**  

![Analytics](https://img.icons8.com/color/500/combo-chart--v1.png)

</div>

---

## 📃 Table of Contents

- [📌 About the Project](#-about-the-project)
- [🎯 Objectifs](#-objectifs)
- [🛠 Tech Stack](#-tech-stack)
- [📂 Dataset](#-dataset)
- [🚀 Workflow](#-workflow)
- [📈 Results](#-results)
- [👥 Project Team](#-project-team)
- [🔑 License](#-license)

---

## 📌 À propos du projet

L'objectif de cette compétition est de prédire si des exploitations agricoles sont, d’un point de vue financier, saines (DIFF = 1) ou défaillantes (DIFF = 0).
Pour cela, différentes approches de Machine Learning ont été explorées afin d’identifier et sélectionner le modèle le plus performant possible.

---

## 🎯 Objectifs

- ✅ Explorer et préparer les données
- ✅ Normaliser les données (centrage & réduction) 
- ✅ Implémenter des modèle de classification  
- ✅ Optimiser les differents paramètres  
- ✅ Évaluer le modèle via **Accuracy** et **AUC / ROC**  
- ✅ Générer un fichier de **soumission finale** sur le jeu de test  

---

## 🛠 Tech Stack

| Outil / Librairie | Utilisation |
|-------------------|-------------|
| 🐍 **R** | Langage principal |
| 📦 **caret** | Partitionnement, normalisation, métriques |
| 📦 **class** | Implémentation du KNN |
| 📦 **rpart** | Arbres de décision |
| 📦 **ggplot2** | Visualisations |
| 📦 **pROC** | Courbes ROC et AUC |
| 📦 **readr/dplyr** | Gestion et manipulation des données |

---

## 📂 Dataset

- 📄 **farms_train.csv** → données d’apprentissage (features + cible `DIFF`)  
- 📄 **farms_test.csv** → données de test (features uniquement, soumission attendue)  

Features utilisées : `R2, R7, R8, R17, R22, R32`

---

## 🚀 Workflow

1. 📥 Chargement & exploration des données  
2. ✂️ Partitionnement **train (80%) / validation (20%)**  
3. ⚖️ **Normalisation** des features  
4. 🔍 Application du **KNN naïf (k fixe)**  
5. 📊 Recherche du **meilleur k** (1–20)  
6. 🧮 Évaluation avec **Accuracy** et **ROC / AUC**  
7. 📉 Application de l’**ACP (2 composantes)** et comparaison  
8. 📤 Génération du fichier **soumission_knn.csv**  

---

## 📈 Results

- 🏆 Meilleur **k = 10**  
- ✅ Accuracy atteinte : **87.5%**  
- 📊 AUC : **0.947** → excellente capacité discriminante  
- 🔎 ACP avec 2 composantes → meilleure visualisation, résultats comparables  

---

## 👥 Project Team

| Nom                | Rôle |
|---------------------|------|
| **Lounas CHIKHI**   | 📊 Implémentation KNN, ACP, soumission |
| *(Autres membres)*  | 🔍 Revue de code, rapport, présentation |

---

## 🔑 License

Projet distribué sous la licence [MIT](https://opensource.org/licenses/MIT).  

---

💬 *N’hésitez pas à ouvrir une issue pour toute remarque ou suggestion.*  
