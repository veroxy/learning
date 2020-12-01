#DATABASE slw JSON

---

id (INT)  | username (VARCHAR) | title (VARCHAR) | description ()


**PDO** > permet de créer une connexion à la BDD evite de faire:
```
  $ ./mysql -up root -p root (mysqlstart user:root passwor:root; dans le ternminal)
```

1// le PDO est objet (comme en js):
```php
<?php
try {
    $connexion = new PDO('mysql:host=localhost(ou port); dbnale=blog; charset=utf-8', 'root', 'root');
} catch (Exception $e) {
  die('erreur': . $e->getMessage());
}
?>
```
2// je requete via dans ma bdd
```php
<?php
  $requete = "SELECT * FROM slw";
  $resultats = $connexion->query($requete);
?>
~~
