---
layout: page
title: java - premiers pas
parent: html
---

# java - premiers pas
----
> ref [wiki]('https://fr.wikipedia.org/wiki/Java_(langage)')
 - java est un langage compilé
 - Pkg
    fr.houseofcode.dap.date.interval
    (pays.nom_entreprise.nom_projet_.ft1.ft2)
 - rappel : class qui appel une/des interfaces (ensemble de methodes)
 - java est un langage typé qui ne varie jamais.


----

## INSTALL
- [jdk]('http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html')
- [eclipse]('http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-win32-x86_64.zip')

## [codinGame]('https://www.codingame.com/start')
    - TYPE MIME
      > Le type MIME est utilisé dans de nombreux protocoles internet pour associer un type de média (html, image, vidéo, ...) avec le contenu envoyé. Ce type MIME est généralement déduit de l'extension du fichier à transférer.

    - Type MIME (application/acad),	Type de fichier (Fichiers AutoCAD ), Extension associée (dwg)
    - concaténation avec "+"
// les String === Objet et les int === primitif


## eclipse


## le langage
### types
> on traduit une chose de la vie réelle dans un programme /en langage informatique

- une Class est une description d'un élément (message, facture)
- String, est un tableau de caractères que Oracle à créé qui traduit une chaine de caractères
- Map (HashMap, TreeMap)est un dictionnaire avec son entré et sa définition avec une Key et une Value associée à cette clef

### Heritage
> on a un héritage simple (0/1), ctd d'une seule Class. Toutes les classe hérite la class Object de Java et peut hériter de la description d'une autre class
Lors de l'instantiation d'une Class on la déclare comme suit :
```java
    Client cci = new Client();
    cci.getName("minou");
```

### Variables
> Java est un lanage typé, les variables on défini leur "genre"
  - String
  - int

### Immuabilité
> le contenu d'une variable est non modifiable ensuite, ctd on supprime le contenu de la variable.
on ne peut comparer deux objets entre elle (cci == poleemploi),  la méthode ".equals(poleemploi)"
```java
    if(cci == poleemploi){} // FAUX
    if(cci.equals(poleemploi)){}
```


* getService(Internal UserId == BOB) == userKey
* mesage().list(GoogleUser == "me") = /{xxxxxx}


### les logs

retourne le journal de connexion (modifications, ajouts, errors)
il est conseillé quelque soit le langage d'utiliser une API de log
> api de log pour Java: Log4J
les retours se font par décrémentation , du plus FORT au MONT IMPORTANT
- error: qui fait planter ou non l'app
- warning: indique une anomalie
- info: informatifs
- config:
- FINE / debug: retour technique
- FINEST / debug: retour technique verbeux
> fr.houseofcode.dap est un dossier
**fr.houseofcode.dap.[client]**  est une categorie et
**fr.houseofcode.dap.[admin]** en est une autre
 1. category
 2. appender
> retouner les logs dans un contexte pas unique une phrase "banale" , un complement précis permet de voir là où l'app fails.
