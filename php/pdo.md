  #DATABASE slw JSON

---

id (INT)  | username (VARCHAR) | title (VARCHAR) | description ()


**PDO** > permet de créer une connexion à la BDD evite de faire:
~~~shell
  $ ./mysql -up root -p root (mysqlstart user:root passwor:root; dans le ternminal)
~~~

1. le PDO est objet (comme en js):
~~~php
<?php
try {
    $connexion = new PDO('mysql:host=localhost(ou port); dbnale=blog; charset=utf-8', 'root', 'root');
} catch (Exception $e) {
  die('erreur': . $e->getMessage())
}
?>
~~~
TRY / CATCH / DIE permet de verifier les erreurs lors de la connexion et de les afficher selon ce que l'on désir.

3. inserrer des données dans la BDD.<BR />
il faut créer une condition pour vérifier le contenu rempli/ou non(ici formulaire).
~~~php
  <?php
    if isset($_POST['username']) && isset($_POST['firstname']) && isset($_POST['lastname']) && isset($_POST['email'] && isset($_POST['email'] && isset($_POST['age'] && isset($_POST['datesuscribe']){
      $username = $_POST['username'];
      $firstname = $_POST['firstname'];
      $lastname = $_POST['lastname'];
      $email = $_POST['email'];
      $age = $_POST['age'];
      $datesuscribe = $_POST['datesuscribe'];
      $qInsertion = "INSERT INTO users (username, firstname, lastname, email, age, datesuscribe)";
      $rq = $connexion->prepare;
    };
  ?>
~~~

2. je requete via dans ma bdd:
~~~php
<?php
  $requete = "SELECT * FROM users "
  $resultats = $connexion->query($requete);
?>
~~~
