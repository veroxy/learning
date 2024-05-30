---
layout: page
title: Images pour le web
parent: graphisme-webdesign
date:   2024-05-30 23:12
---

# Images pour le web
---

> Lorsque que l'on produits des images/contenu multimédia pour le web il connaitre les différentes contraintes qui les définissent. D'une part car toutes les images ne conviennent pas à toutes les utilisations et d'autre part, toutjours pas soucios de performance (UX).

## resolutions genérales
- 72 -> web
- 150 -> n&b / web retina (minimum)
- 300 -> hd Print

la différence se fait au niveau dans la densité des pixels plus la résolution est basse moins il y a de pixel au pouce.

La couleur dans le web est en RVB (Red Green Blue) alors que dans le print c'est le CMJN (Cyan Magenta Yellow Black). Les couleurs sont beaucoup plus lumineuses et peuvent avoir un rendu totalement différent si l'on imprime le document


Le calibrage de couleur peut être fait plus ou moins assurée via l'homogénéité du code hexadécimal : #00ffcc; #2222ff etc seront casiement le même rendu quelque soit les écran alors que #ef5dc1.


## les format d'images
1. GIF
avantage majeurs TRANSPARENCE et poids LEGER
    -  boutons
    - logos
    - icones
    - animations
    - perte de qualité

2. JPEG
    * photos
    * images fixes
    * photos riches en couleur
    * mais n est pas en transparent

3. PNG
    * transparent
    * qualité
    * images destinés web
    * logo
    * et supporte bien les dégradés et les niveaux de gris
    * mais très lourd

4.  SVG
    * format vectoriel
    * pas de perte de qualités
    * risque de bugs

----
des problématique très variables comme les poids et taille d'ecran
* poids moyen ==  2.3 Mo 2017
* norme de taille  == 1024/768([ligne de flottaison](../outils/GLOSSARY.md#ligne-de-flottaison)) VIEWPORT
* 768px est la hauteur de la visu sans la barre de navigation
* lors du scroll on arrive sur une section de 768px pour que le message soit aussi impactant
* 2018  - 1280px -> 2019 - 1440px
    -> voir statcounter.com GlobakStats afin de voir les usages des supports (tablette desktop mobile)
    -> Device atlas

## SITE/APPLICATION/SOFT
1. site
    *  site vitrine
    * e-commerce
    * blog
    * corporate
    * e-business
    * événementiel
    * tv conneceté
    * born interative

2. publicité
    > gallery.smartadserver exemples d'intégrations de pub
    * leadboard (au dessus du menu 728/90)
    * pop under
    * expand
3. Cover reseau sociaux
Guide
    * facebook
    * twitter
    * linkedin
    * youtube

## UI ELEMENTS & GUIDELINES
charte des éléments avec tous les éléments du sites == specs design
    * code couleurs
    * éléments et leur css
    * events et css

## formulaires
voir la video de Stéphanie Walter - blendWebMix > "aidez moi à remplir vos formulaires"