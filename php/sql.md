# SQL


---

### BASES DE DONNÉES
Voir les bases de données et les selectionner et voir les tables .
```sql
  SHOW DATABASES;
  USE members
  SHOW TABLES;
```

### TABLE
 - SQL

 créer une table avec les noms des colonnes (ce sont les entrées que l'on va remplir)
  ```sql
  CREATE TABLE users(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                    username VARCHAR(30) UNIQUE KEY,
                    firstname VARCHAR(30),
                    lastname VARCHAR(255),
                    age DATE,
                    sexe INT(30),
                    email VARCHAR(255) UNIQUE KEY
                     );
  ```
  - Afficher les séléments de 'users'
  ```sql
    DESCRIBE users;
  ```

  - Inserrer des éléments dans 'users'. Les entrées que l'on met en premiers sont les noms des colonnes (ci-dessus) on les rempli avec les valeur (VALUES) qui sont entre guillemets.
  ```sql
    INSERT INTO users (`id`, `username`,`firstname`, `lastname`, `email`) VALUES (NULL, 'ruskova', 'inna', 'saribekova', 'inna.saribeko@gùail.com');
  ```
  - Sélectionner une colonnes
SELECT `username` FROM users;

SELECT * FROM users WHERE `firstname`='inna';
SELECT `email` FROM users WHERE `firstname`='inna';
UPDATE users SET `email`='inna.saribekova@gmail.com' WHERE `id`=1;

INSERT INTO users (`id`, `username`,`firstname`, `lastname`, `email`) VALUES (NULL, 'veroxy', 'vero', 'lafaverges', 'v.lafaverges@gmail.com');
