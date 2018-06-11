# phpMyAdmin - usage

#### ajouter un utilisateur

- VIA L'INTERFACE GRAPHIQUE dans l'onglet **Home > comptes uilisateur**


    INFORMATIONS POUR LA CONNEXIONS
    > nom utilisateur 
    > hote ==  D'où peut on se connecter à la base de données (local/tout(%)/ saisi)
    > on peut créer une bdd automatiquement associé à cet utilisateur 
    > les privilèges == choisir pspécifiquement ce que peut faire l'utilisateur
    > ssl , pas forcément nécessaire
   
- VIA LA CONSOLE SQL
  **Home > SQL** 
  
  
## tables
#### types
  - NOMBRES  
     * TINYINT (1o : -127+128)
     * SMALLINT (2o : +-65 000)
     * MEDIUMINT (3o : +-16 000 000)
     * INT (4o : +- 2 000 000 000) 
     * BIGINT (8o : +- 9 trillions)
       Intervalle précis : -(2^(8*N-1)) -> (2^8*N)-1
       /!\ INT(2) = "2 chiffres affichés" -- ET NON PAS "nombre à 2 chiffres"
    
   * FLOAT(M,D) DOUBLE(M,D) FLOAT(D=0->53) 
       /!\ 8,3 -> 12345,678 -- PAS 12345678,123!
    
   - DATES 
       * TIME (HH:MM) 
       * YEAR (AAAA) 
       * DATE (AAAA-MM-JJ) 
       * DATETIME (AAAA-MM-JJ HH:MM; années 1000->9999)
       * TIMESTAMP (comme date, mais 1970->2038, compatible Unix)
    
   - TEXTES
        * VARCHAR(ligne) 
        * TEXT (multi-lignes; taille max=65535) 
        * BLOB (binaire; taille max=65535)
        * TINY (max=255) 
        * MEDIUM (max=~16000) 
        * LONG (max=4Go)
      Ex : TINYTEXT, LONGBLOB, MEDIUMTEXT
        * ENUM ('valeur1', 'valeur2', ...) -- (default NULL, ou '' si NOT NULL)

#### interclassement
- utf_unicode_ci

#### Attributs
- unsigned permet de dire que l'élément est sans signe (ex: -)
- on update CURRENT_TIMESTANP renvois récupère la valeur actuelle lorsque de la maj de la table

#### NULL == contrainte
permet de rendre la colonne optionnel CONTRAIRE contrainte **NOT NULL**
#### index 
permet de donner l'ordre / dictionnaire ordonné
- primary (primary key == clef primaire)
- UNIQUE sur une table, vous ne mettez pas seulement un index, vous ajoutez surtout une contrainte.

- index
- spatial 

- FULLTEXT est utilisé pour faire des recherches de manière puissante et rapide sur un texte. On n'utilise donc ce type d'index que sur les colonnes de type CHAR, VARCHAR ou TEXT.

#### 
myIsam ne fait pas :
integrite entre les tables
fulltext a été intégré à innoDB

#### console SQL
DML - voir le fichier [createClasseHoc.sql]('createClasseHoc.sql');

