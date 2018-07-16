


DROP DATABASE IF EXISTS hoclassroom;
CREATE DATABASE IF NOT EXISTS hoclassroom;
USE hoclassroom;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFOS';

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ',
                       @@default_storage_engine) as INFO */;

CREATE TABLE role(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL  
);

CREATE TABLE users(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  login VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL ,
  last_name VARCHAR(255) NOT NULL ,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL ,
  salt VARCHAR(255) NOT NULL ,
  is_active TINYINT,
  role_id INT NOT NULL,

  CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES role(id) 
);
CREATE TABLE  password_reset(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  token VARCHAR(255) NOT NULL UNIQUE 
);

CREATE TABLE media (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  path VARCHAR(255) NOT NULL ,
  extension VARCHAR(20) NOT NULL ,
  user_id INT NOT NULL,

  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id) 

);

CREATE TABLE article(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL ,
  content LONGTEXT,
  date_creation TIMESTAMP NOT NULL ,
  is_active TINYINT,
  author_id INT NOT NULL ,
  media_header INT NOT NULL,

  CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES users(id),
  CONSTRAINT fk_media_header FOREIGN KEY (media_header) REFERENCES media(id)
    ON DELETE CASCADE 
);

-- dans la table intermediair on effectue un delete on cascade pour supprimer l'association des ifk_id
CREATE TABLE article_media(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  media_id INT NOT NULL ,
  article_id INT NOT NULL,

  CONSTRAINT fk_media_id FOREIGN KEY (media_id) REFERENCES media(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_article_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE 
);

CREATE TABLE course(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL  
);

CREATE TABLE article_course(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  article_id INT NOT NULL,
  course_id INT NOT NULL,

  CONSTRAINT fk_article_course_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id)
    ON DELETE CASCADE 
);

CREATE TABLE comment(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  content LONGTEXT NOT NULL ,
  date_creation TIMESTAMP NOT NULL ,
  is_active TINYINT NOT NULL ,
  user_id INT NOT NULL ,
  article_id INT NOT NULL ,

  CONSTRAINT fk_user_comment_id FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_article_comment_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE 
);

CREATE TABLE log(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  date_modif TIMESTAMP,
  user_id INT NOT NULL ,
  article_id INT NOT NULL ,

CONSTRAINT fk_user_log_id FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_article_log_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE 
);


CREATE TABLE message(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  subject VARCHAR(255) NOT NULL ,
  content LONGTEXT NOT NULL ,
  date_send TIMESTAMP NOT NULL , -- date
  date_receive TIMESTAMP NOT NULL , -- date
  is_read TINYINT NOT NULL , #the message was read or not
  user_sender_id INT NOT NULL ,
  user_receiver_id INT NOT NULL ,

  CONSTRAINT fk_user_sender_id FOREIGN KEY (user_sender_id) REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_user_receiver_id FOREIGN KEY (user_receiver_id) REFERENCES users(id)
    ON DELETE CASCADE
);

-- insertions des données
-- méthodes celle où on indique les entrés des colonnes de la table
-- et celle ou on selectionne uniquement la table et ou on indique les valeurs()

-- meth 1
INSERT INTO role VALUES (1,'administrator'),(2,'author'),(3,'moderator');
-- meth 2
INSERT INTO users (id, login, first_name, last_name, email, password, salt, is_active, role_id)
VALUES
(1, 'j_corey', 'James', 'Corey', 'jcorey@gmail.com', 'md5()', 'graindesel', 1, 1),
(2, 'P_J_Farm', 'Philip', 'Farmer', 'philipfarmer@gmail.com', 'md5()', 'graindesel', 1, 2),
(3, 'JCronin', 'Justin', 'Cronin', 'jcronin@gmail.com', 'md5()', 'graindesel', 1, 3),
(4, 'franckherb', 'Franck', 'Herbert', 'fherbert@gmail.com', 'md5()', 'graindesel', 1, 2),
(5, 'dansimm', 'Dan', 'Simmons', 'dan.simmons@gmail.com', md5('minoupitou'), 'graindesel', 1, 2),
(6, 'isaacasimov1986', 'Isaac', 'Asimov', 'asimo@gmail.com', 'md5()', 'graindesel', 1, 2),
(7, 'pkd4eva', 'Philip Kindred', 'Dick', 'pkdick@gmail.com', 'md5()', 'graindesel', 1, 2),
(8, 'true_martian', 'Kim Stanley', 'Robinson', 'ksrobinson@gmail.com', 'md5()', 'graindesel', 1, 2),
(9, 'rcwilson', 'Robert Charles', 'Wilson', 'rcwilson@gmail.com', 'md5()', 'graindesel', 1, 2),
(10, 'horrormasta', 'Stephen', 'King', 'sking@gmail.com', 'md5()', 'graindesel', 1, 2);

INSERT INTO course (name)
VALUES
  ('HTML'),
  ('CSS'),
  ('GRAPHISME'),
  ('JAVASCRIPT'),
  ('PHP'),
  ('BDD'),
  ('RESEAU'),
  ('JAVA'),
  ('MOBILITE'),
  ('FRAMEWORK');

-- STOP SCRIP THERE
INSERT INTO media(id, path, extension, user_id)
VALUES
  (1, '/doc/mondoc', '.doc', 5),
  (2, '/img/monimg1', '.jpg', 7),
  (3, '/doc/mondoc1', '.doc', 1),
  (4, '/img/monimg2', '.jpg', 4),
  (5, '/doc/mondoc2', '.doc', 3),
  (6, '/img/monimg3', '.jpg', 8),
   (7, '/doc/mondoc3', '.doc', 9),
   (8, '/img/monimg4', '.jpg', 10);

INSERT INTO article(id,author_id, title, media_header, content, is_active,date_creation)
VALUES
  (1, 1, 'HTML pour les debutant', 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 1, DATE_SUB(NOW(), INTERVAL 1 MONTH)),
  (2, 6, 'CSS c\'est de la bombe', 2, 'Ducimus voluptatum consectetur nesciunt provident sint.', 1, DATE_SUB(NOW(), INTERVAL 2 MONTH)),
  (3, 5, 'Vive les frameworks', 3, 'Eaque suscipit earum voluptates laborum eligendi!', 1, DATE_SUB(NOW(), INTERVAL 3 MONTH)),
  (4, 10, 'JAVA c\'est la vie !', 4, 'Sed maiores autem tempore iusto, quam voluptatem vitae ex ullam.', 0, DATE_SUB(NOW(), INTERVAL 4 MONTH)),
  (5, 9, 'Manger 5 framework laravel par jour', 5, 'Ducimus voluptatum consectetur nesciunt provident sint.', 1, DATE_SUB(NOW(), INTERVAL 5 MONTH)),
  (6, 2, 'Code ta race', 6, 'Eaque suscipit earum voluptates laborum eligendi!', 1, DATE_SUB(NOW(), INTERVAL 6 MONTH)),
  (7, 6, 'PHP c\'est relou, mais...', 7, 'Ducimus voluptatum consectetur nesciunt provident sint.', 1, DATE_SUB(NOW(), INTERVAL 7 MONTH)),
  (8, 7, 'Salage ne rime pas avec Crackage', 8, 'Eaque suscipit earum voluptates laborum eligendi!', 0, DATE_SUB(NOW(), INTERVAL 7 DAY)),
  (9, 6, 'SQL', 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit.', 1, DATE_SUB(NOW(), INTERVAL 3 WEEK)),
  (10, 8, '', 2, 'Eaque suscipit earum voluptates laborum eligendi!', 1, DATE_SUB(NOW(), INTERVAL 3 DAY)),
  (11, 3, '', 3, 'Ducimus voluptatum consectetur nesciunt provident sint.', 1, NOW()),
  (12, 2, '', 4, 'Ducimus voluptatum consectetur nesciunt provident sint.', 1, DATE_SUB(NOW(), INTERVAL 10 MONTH));

INSERT INTO article_course (id, article_id, course_id)
VALUES (1, 1, 1),
  (2, 3, 6),
  (3, 3, 7),
  (4, 2, 1),
  (5, 6, 6),
  (6, 7, 8),
  (7, 4, 9),
  (8, 4, 10),
  (9, 5, 2),
  (10, 5, 3),
  (11, 8, 2),
  (12, 11, 10),
  (13, 1, 3),
  (14, 12, 5),
  (15, 10, 10),
  (16, 3, 3),
  (17, 4, 4),
  (18, 2, 2),
  (19, 5, 9);

INSERT INTO article_media (id, media_id, article_id)
VALUES (1, 1, 1),
  (2, 3, 6),
  (3, 3, 7),
  (4, 2, 1),
  (5, 6, 6),
  (6, 7, 8),
  (7, 4, 9),
  (8, 4, 10),
  (9, 5, 2),
  (10, 5, 3),
  (11, 8, 2),
  (12, 1, 10),
  (13, 1, 3),
  (14, 4, 5),
  (15, 6, 10),
  (16, 8, 3),
  (17, 2, 4),
  (18, 2, 2),
  (19, 5, 9);

-- déclencheur qui pet
CREATE TRIGGER trigger_article_update AFTER UPDATE ON article FOR EACH ROW
INSERT INTO log (article_id,date_modif,user_id)
VALUES (OLD.id,NOW(),1);
-- [via mysql]('trigger.png')

CREATE TABLE article_title_version(
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  article_id INT NOT NULL ,
  title VARCHAR(255) NOT NULL ,
  date_version datetime NOT NULL ,

  CONSTRAINT  fk_article_title_version_article_id FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TRIGGER trigger_title_version_insert AFTER UPDATE ON article FOR EACH ROW
  INSERT INTO article_title_version(article_id,title,date_version)
  VALUES (NEW.id,NEW.title,NOW());
-- [via mysql]('trigger_titremaj.png')
