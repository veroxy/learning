---
layout: page
title: PDO - PHP Data Objects
parent: php
---
# PDO - PHP Data Objects

---

id (INT)  | username (VARCHAR) | title (VARCHAR) | description ()


**PDO** > permet de créer une connexion à la BDD evite de faire:
```
  $ ./mysql -up root -p root (mysqlstart user:root passwor:root; dans le ternminal)
```

1. le PDO est objet (comme en js):
- le nom d'hôte : localhost ;
- la base de données : partage_de_recettes ;
- l'identifiant (login) : root ;
- le mot de passe (Sous XAMPP, il n’y a pas de mot de passe par défaut. Pour cela, nous utiliserons la chaîne de caractères vide.).

on encadre dans un try catch poyr permettre de renvoyer ue error avec le message.

```php
<?php
try {
    $connexion = new PDO('mysql:host=localhost(ou port); dbnale=blog; charset=utf-8', 'root', 'root');
} catch (Exception $e) {
  die('erreur': . $e->getMessage());
}
?>
```
2. je requete via dans ma bdd
```php
<?php
  $requete = "SELECT * FROM slw";
  $resultats = $connexion->query($requete);
?>
```

