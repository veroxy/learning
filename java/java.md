# java - premiers pas

----

> ref [wiki]('https://fr.wikipedia.org/wiki/Java_(langage)')

- java est un langage compilé
- Pkg
fr.houseofcode.dap.date.interval
(pays.nom_entreprise.nom_projet_.ft1.ft2)
- rappel : class qui appel une/des interfaces (ensemble de methodes)
- java est un langage typé qui ne varie jamais.
-

-----------------------------
0. [codinGame]('https://www.codingame.com/start')
    - TYPE MIME
      > Le type MIME est utilisé dans de nombreux protocoles internet pour associer un type de média (html, image, vidéo, ...) avec le contenu envoyé. Ce type MIME est généralement déduit de l'extension du fichier à transférer.

    - Type MIME (application/acad),	Type de fichier (Fichiers AutoCAD ), Extension associée (dwg)




    - concaténation avec "+"


// les String === Objet et les int === primitif



1. eclipse

2. types
> on traduit une chose de la vie réelle dans un programme /en langage informatique
    - une Class est une description d'un élément (message, facture)
    - String, est un tableau de caractères que Oracle à créé qui traduit une chaine de caractères
    - Map (HashMap, TreeMap)est un dictionnaire avec son entré et sa définition avec une Key et une Value associée à cette clef

3. Heritage
> on a un héritage simple (0/1), ctd d'une seule Class. Toutes les classe hérite la class Object de Java et peut hériter de la description d'une autre class
Lors de l'instantiation d'une Class on la déclare comme suit :
```
    Client cci = new Client();
    cci.getName("minou");
```

4. Variables
> Java est un lanage typé, les variables on défini leur "genre"
  - String
  - int

5. Immuabilité
> le contenu d'une variable est non modifiable ensuite, ctd on supprime le contenu de la variable.
on ne peut comparer deux objets entre elle (cci == poleemploi),  la méthode ".equals(poleemploi)"
```
    if(cci == poleemploi){} // FAUX
    if(cci.equals(poleemploi)){}
```