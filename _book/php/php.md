# PHP
  * [source univ-orleans](https://www.univ-orleans.fr/iut-orleans/informatique/intra/tuto/php/ "source")
  * [td 1 première année](https://www.univ-orleans.fr/iut-orleans/informatique/intra/tuto/php/td/cvrh/2015/td1.pdf "td1")
    * [n2](https://www.univ-orleans.fr/iut-orleans/informatique/intra/tuto/php/td/cvrh/2015/td1.pdf "td2")
    * [n3](https://www.univ-orleans.fr/iut-orleans/informatique/intra/tuto/php/td/cvrh/2015/td3.pdf "td3")
    * [n4](https://www.univ-orleans.fr/iut-orleans/informatique/intra/tuto/php/td/cvrh/2015/td3.pdf "td3")
  * [td 2 deuxième année](https://www.univ-orleans.fr/iut-orleans/informatique/intra/tuto/php/td/2A/2015/td1Web.pdf "td2")

250 millions de sites environ sont réalisés à travers le monde en PHP
---
~~~
~~~

### HISTOIRE : v1 & v2
  * d’abord Personal Home Pages puis HypertextPreProcessor.

  * Rasmus Lerdorf, un programmeur Groenlandais avec la nationalité canadienne, crée PHP en
  1994 pour analyser les connexions sur son site Web.

  * nous sommes maintenant à la version 7 depuis novembre 2015 sotant la [v6]
  [v6]:https://www.phproundtable.com/episode/what-happened-to-php-6

  >des dizaines de millions de sites Web l’utilisent à travers le monde…
  Comme Le Monde , Facebook ou Yahoo

### PHP7
* Facebook a publié en 2011 HipHop Virtual Machine dit HHVM, une machine virtuelle
permettant de pré-compiler le code PHP en bytecode à la manière de Java (JIT Compiler).

* En 2014, Facebook sort le langage Hack, s’exécutant grace à HHVM et apportant des
fonctionnalités comme le typage fort, des classes paramétrables, une API de collections
plus riche et cohérente, des traitements asynchrones et davantage de sécurité avec
l’extension XHP.

* Le framework PHP Phalcon (extension PECL de PHP), propose Zephir (Zend Engine
PHp Intermediate) (https ://github.com/phalcon/zephir) qui permet la création d’extensions
rapides en PHP (codées en C) de manière simplifiée (sans écrire du C directement).

* La société Zend a réagi face à HHVM en accélérant le développement de la nouvelle
mouture de PHP 7 et en améliorant ses performances avec un mécanisme de compilation
AOT (Ahead of Time)

### CMS  & FRAMEWORK PHP
De nombreux CMS (Content Management System) et Frameworks de développement Web sont disponibles en PHP:

|cms|framework      |
|---|--------------:|
|Wordpress  |Symfony|
|Joomla     |Zend   |
|Drupal     |Laravel|
|Prestashop |Phalcon|
|Magento    |Yii    |
| |Yaf              |

### INSTALL
avant nettoyer l'environnement (Ubuntu 16...) il rentre en conflit avec les composant d'installation voici comment les supprimer
~~~
$ sudo apt-get purge mysql-server apache2 php (php7) php-mysql phpmyadmin
~~~
|LAMP | INSTALLATION*|
|----- |:--- |
|Linux| Apache2|
|Apache|  php|
|MySQL| Installer MySQL (client et serveur)|
|PHP|Installer PHPMyAdmin |
| |verifier php.ini|

\*suivre les instruction sur la documention
~~~
$ sudo apt-get install apache2 php mysql-server libapache2-mod-php php-mysql

$ cat /opt/lampp/etc/php.ini

~~~
----
### SIMILARITÉ DES FONCTION EN C & PHP
> **FUNCTION COUNT() vs SIZEOF** <br />
I would use count() if they are the same, as in my experience it is more common, and therefore will cause less developers reading your code to say "sizeof(), what is that?" and having to consult the documentation. <br />
I think it means sizeof() does not work like it does in C (calculating the size of a datatype). It probably made this mention explicitly because PHP is written in C, and provides a lot of identically named  wrappers for C functions (strlen(), printf(), etc)

En gros PHP est écrit en C c'est alors normal qu'il reste des vestige du langage C dans sa syntax (strlen, printf, sizeof, strcomp, etc...)

### SQL AVEC MySql WORKBENCH
Logiciel de modélisation de BDD: permet l'export en .sql / xml.

##### Workbench
  1. on créer la map de BDD
  2. export
    * le fichier avec "CREAT SCRIPT"
    * cocher la fonction ne pas cree les liaisons
    * copier le contenu de la fenêtre / + sauvegarder
    * coller / importer dans > PHPMYADMIN > SQL > past > GO

##### SQL
  1. Table
    * NOM DE "MA_TABLE"
      * |--> MyIsam (permet de (si) créer de formulaire de recherche enrichie)
      * |--> UTF8_general_ci

  2. génération
  Lors de la création de la table chaque colonne (phpmyadmin)est représenté par une ligne à la mannière d'un checklist.
    * WORKBENCH || phpmyadmin || REQUETE
    * UNE LINE == UNE COLONNE == DATA

| MyTable    |case a cohe|typage|
| :------------- |--|--|
| une colonne == une donné|valeur| int/varchar(sizeof)/text|
| id|PQ NN AI|INT|
| username|UQ|VARCHAR(255)|


| Header One     | colonne 2     | colonne 3     |
| ------------- | :-------------:|-------------: |
| Item One       | Item Two       | Item Two     |

### LOGIN PASSWORD
