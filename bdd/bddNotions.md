#Base de données et structures, NOTIONS

##distribution
 - WAMP/MAMP/LAMP/XAMP == STACK (pile) pour eviter les pbs sur WINDOWS installer la version 32bits

Pour optimiser le serveur pour prendre plus de place, pour que 'exécustion soit plus rapide et alouer plus de mémoire aux données (cache, retc...)

    MLD Modèle logique de données(précedents)
    dictionnaire des données
    MCD Modèle conceptuel de données ->



 - SGBDR (System de Gestion de Bases de Données Relationnelles):

    MLD Modèle logique de données(précedents)

Server
|>
BDD
     |>
     TABLE     -> users / produit / article /  catégorie     -> COLONNES ( nom | prenom | age etc)

exemples de relations:

    "j'ai une école avec des classes contiennent des élèves;
    j'ai des professeurs;
    un professeur enseigne à une classe"

### FORMES NORMALES
> permet de structurer les données et ne pas faire d'erreurs => il y a plusieurs sorte de formes normal. C'est un niveau de complexité de structuration;

Normalisation de schémas:

###1. Une information Atomique (1NF),
**elle ne peut être divisée par son information** ctd que le Niveau d'une classe ou l'age d'un élève n'est pas divisible alors que professeurs ou matières ne sont pas des infos unique que l'on ne peut diviser.

###Relations:
- ECOLE == Professeurs + classes
- professeur -> classe
- classe <- professeur

    * classe :  nb eleves, niveau, professeur, filles, garcons, nom, matières, identifiant(unique INT auto incrémentation)
    * professeur :  nom, prenomn matière, classe, date de naissance, adresse, , identifiant(unique INT auto incrémentation)
    * eleve: nom, prenom, date de naissance, classe, niveau, adresse, genre, inscrit cantine, identifiant(unique INT auto incrémentation)
    * matiere:  nom (html css, javascript, graphisme, base de donnée, php, java, mobile, softskills)
    * telephone : numero ,
    * email: adresse,
    * type_email:
    * allergie :  alimentaire,


###2. Dépendance fonctionnelles DF (2NF),
à partir d'une information, j'ai accès à d'autres informations;
> [propriété de départ]-> (donner accès à d'autres propriétés) -> [propiété d'arriver]
- UUID : exemple -> clef wifi sous la forme e5656-10f45...
- ou CLEF PRIMAIRE -> chaque classe a une valeur de clef unique, elle permet de définir de façon claire et précise
- CLEF PRIMAIRE COMPOSITE :   il y a plusieurs champs (plusieurs identifiants),
- CLEF ETRANGERES

###3. 3NF (non indispensable)
>elle ressemble à la 2eme mais à l'inverse:  on ne doit pas déduire le résultat d'un champs par l’addition de plusieurs autres champs;
- Selon les besoins des requêtes -> si une requêtes est souvent appelée on peut écraser la 3NF ()
- Lors de la création d'une table on peu créer une clef primaire exemple dans une table de VILLES avec des noms de ville et en valeur primaires 1

### dictionnaire des données
- N: numérique
- A: Alpha/string
- AN: AlphaNumerique
- B: Booléen (true./false 0/1)

se construit sous une forme de tableau

### MCD Modèle conceptuel de données
Comment on va concevoir la base de données , pour identifier visuellement les entités

    | CLASSE
    ---
    | classe_id
    | niveau
    | nom

    | PROFESSEUR
    ---
    | prof_id
    | nom
    | prenom
    | datedenaissance
    
    | ELEVE
    ---
    | eleve_id
    | nom
    | prenom
    | adresse
    | datenaissance


   - ELEVE ->(1,1) ETUDIER DANS (1,N) -> CLASSE
   -  PROFESSEUR -> (1,1) (un professeur a une seule classe) ENSEIGNER (1,N) (une classe a plusieur professeur)-> CLASSE
        * ou PROFESSEUR -> (1,1) (un professeur a une seule classe) ENSEIGNER + DATE ARRIVER (1,N) (une classe a plusieur professeur)-> CLASSE ==> DF de prof_id, class_id -> DATE ARRIVER  ( elle créera / déduira une nouvelle table dateArrivé)


------

ennoncé
- un prod :
    * nom (pk)
    * prix
    * visuel
    * plusieurs catégories
- categories:
    * nom
    * plusieurs produits 
    * date (cle etrangere)> produit
- système de produits similaires, qui permette d'associer des produits entre eux pour pouvoir les porposer une même page
- un degré dde similarité entre 2 produits

----

## WAMP
> min param MYSQL == v 5.7
#### réinitialiser mot de passe root Mysql
dans un fichier `mysql-init.txt`
```~
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('MyNewPass);
```~
```
    C:\> cd "C:\Program Files\MySQL\MySQL Server 5.7\bin"
    C:\> mysqld --init-file=C:\\mysql-init.txt
```

----
