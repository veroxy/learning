SHOW TABLES;

CREATE TABLE users(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                  username VARCHAR(30) UNIQUE KEY,
                  firstname VARCHAR(30),
                  lastname VARCHAR(255),
                  age DATE,
                  sexe INT(30),
                  email VARCHAR(255) UNIQUE KEY
                   );
DESCRIBE users;

INSERT INTO users (`id`, `username`,`firstname`, `lastname`, `email`) VALUES (NULL, 'ruskova', 'inna', 'saribekova', 'inna.saribeko@gùail.com');

SELECT `username` FROM users;

SELECT * FROM users WHERE `firstname`='inna';
SELECT `email` FROM users WHERE `firstname`='inna';
UPDATE users SET `email`='inna.saribekova@gmail.com' WHERE `id`=1;

INSERT INTO users (`id`, `username`,`firstname`, `lastname`, `email`) VALUES (NULL, 'veroxy', 'vero', 'lfvrgs', 'my_name@gmail.com');
