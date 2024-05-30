---
layout: page
title: proxy
parent: reseau
---

# proxy
[dailysecurity](https://www.dailysecurity.fr/server-side-request-forgery/)

> mandataire, procuration, intermédiaire

>un serveur proxy est un serveur qui servirait d’intermédiaire ou un serveur que l’on mandaterait pour faire quelque chose.

### schemas
1. ORDINATEUR <=> INTERNET
     - Votre ordinateur est connecté à Internet : c’est lui qui va directement chercher les pages
     - L’inconvénient principal de ce fonctionnement est que votre ordinateur est directement exposé sur Internet. Mais il y a d’autres inconvénients que je vous expliquerai plus loin.
 
2. ORDINATEUR <=> serveur proxy <=> INTERNET
     - Votre ordinateur demande les pages au Proxy.
         Celui-ci va chercher les pages et les retourne à votre ordinateur.
     - On voit très bien sur ce schéma que votre ordinateur n’accède par directement à Internet.
 