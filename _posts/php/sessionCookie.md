---
layout: page
title: Session, Base de données et Cookies
parent: php
---
# [Session](https://openclassrooms.com/fr/courses/918836-concevez-votre-site-web-avec-php-et-mysql/4239476-conservez-des-donnees-grace-aux-sessions-et-aux-cookies), Base de données et Cookies

---

### differences entre Cookies et Base de données Mysql
- Base de données == stockage sur serveur
- cookie == local du client

Les deux ont des avantages: le stockage sur serveur peut permettre au client final d'enregister son panier/ses infos, mais pour le l'optimisation de la place sur le serveur il est préférable de stocker les données 'temporaires' en cookie == cache (temporary).

Dans le cas du 'Panier' il est donc préférable de stocker en Local, car il n'est pas nécessaire d'enregistrer et donc pas besoin de vider/supprimer la base de données temporaire créée lors de l'ajout de l'élément au "Panier". :x

