---
layout: page
title: requêtes préparées et procédures stockées
parent: php
---

# requêtes préparées et procédures stockées [manuel PHP](http://php.net/manual/fr/pdo.prepared-statements.php)

> ce sont des requetes qui sont implémentés dans le php et dont les paramètres peuvents êtres variabilisés

## KEZAKO ?
d'une façon générale faire des requêtes SQL à la BDD sans être procédural: ctd que l'on stock les appels appels à la BDD dans des fonctions ou des déclarations (statements)
- cela permet d'éxécuter la requette plusieurs fois
- elle optimise le parsing du fichier
- appeler plusieurs fois la methode avec des paramètres différentes peut ralentir le processus mais reste optimisé

>  On utilise la class PDO qui permet de tester la connexion

 0. [PDO](pdo.md)
    ici on stock dans `$dbh` les requetes MySql :
     - sur le `localhost`
     - avec l'utilisateur et son mot de passe `mysql -u root -p (root)`,
     - on utilise la base de données `USE blog`
     - soit MySql parvient à se connecté soit on lève une exception
    ```php
     <?php
             try {
               $dbh = new PDO('mysql:host=localhost; dbname=blog; charset=utf-8', 'root', 'root'));
               echo "Connecté\n";
             } catch (Exception $e) {
               die("Impossible de se connecter : " . $e->getMessage());
             }
    ?>
    ```
 1. préparation
 on stock dans `$stmt`(statement) la prépartion qui utilise la methode `prepare("ACTION mytable (columnName1,columnName2,etc) VALEURS (valueOfColumn1, valueOfColumn2, etc...) ")` de PDO.
 on peut part ailleurs remplacer la partie valeurs par `VALUES (?, ?)")`
 Dans la requette suivante on veut faire une insertion par ligne et non par colonne. Où la colonne est mis en valeur par la syntax `:columnName` et la valeur est une valeur;
 on `execute()` la délcaration (`$stmt`)
     ```php
     <?php
     $stmt = $dbh->prepare("INSERT INTO REGISTRY (name, value) VALUES (:name, :value)");
     $stmt->bindParam(':name', $name);
     $stmt->bindParam(':value', $value);

     // insertion d'une ligne
     $name = 'one';
     $value = 1;
     $stmt->execute();

     // insertion d'une autre ligne avec des valeurs différentes
     $name = 'two';
     $value = 2;
     $stmt->execute();
    ?>
     ```
 2.