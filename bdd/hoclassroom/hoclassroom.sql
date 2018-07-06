


DROP DATABASE IF EXISTS hoclassroom;
CREATE DATABASE IF NOT EXISTS hoclassroom;
USE hoclassroom;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFOS';

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ',
                       @@default_storage_engine) as INFO */;

CREATE TABLE role(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE users(
  id INT NOT NULL AUTO_INCREMENT,
  login VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL ,
  last_name VARCHAR(255) NOT NULL ,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL ,
  salt VARCHAR(255) NOT NULL ,
  is_active TINYINT,
   role_id INT NOT NULL,

  CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES role(id)
    ON DELETE CASCADE,
  PRIMARY KEY (id)

);
CREATE TABLE  password_reset(
  id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  token VARCHAR(255) NOT NULL UNIQUE,

  PRIMARY KEY (id)
);

CREATE TABLE media (
  id INT NOT NULL AUTO_INCREMENT,
  path VARCHAR(255) NOT NULL ,
  extension VARCHAR(20),
  user_id INT NOT NULL,

  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  PRIMARY KEY (id)

);
CREATE TABLE article(
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL ,
  content LONGTEXT,
  date_creation TIMESTAMP NOT NULL ,
  is_active TINYINT,
  author_id INT NOT NULL ,
  media_header INT NOT NULL,

  CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_media_header FOREIGN KEY (media_header) REFERENCES media(id)
    ON DELETE CASCADE,
  PRIMARY KEY (id)

);

CREATE TABLE article_media(
  id INT NOT NULL AUTO_INCREMENT,
  media_id INT NOT NULL ,
  article_id INT NOT NULL,

  CONSTRAINT fk_media_id FOREIGN KEY (media_id) REFERENCES media(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_article_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE,
  PRIMARY KEY (id)

);

CREATE TABLE course(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE article_course(
  id INT NOT NULL AUTO_INCREMENT,

  article_id INT NOT NULL,
  course_id INT NOT NULL,

  CONSTRAINT fk_article_course_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE,

    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course(id)
    ON DELETE CASCADE,
  PRIMARY KEY (id)

);

CREATE TABLE comment(
  id INT NOT NULL AUTO_INCREMENT,

  content LONGTEXT NOT NULL ,
  date_creation TIMESTAMP NOT NULL ,
  is_active TINYINT NOT NULL ,

  user_id INT NOT NULL ,
  article_id INT NOT NULL ,

  CONSTRAINT fk_user_comment_id FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_article_comment_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE,
  PRIMARY KEY (id)

);

CREATE TABLE log(
  id INT NOT NULL AUTO_INCREMENT,
  date_modif TIMESTAMP,

  user_id INT NOT NULL ,
  article_id INT NOT NULL ,

CONSTRAINT fk_user_log_id FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_article_log_id FOREIGN KEY (article_id) REFERENCES article(id)
    ON DELETE CASCADE,
  PRIMARY KEY (id)


);


CREATE TABLE message(
  id INT NOT NULL AUTO_INCREMENT,
  subject VARCHAR(255) NOT NULL ,
  content LONGTEXT NOT NULL ,
  date_send TIMESTAMP NOT NULL ,
  date_receive TIMESTAMP NOT NULL ,
  is_read TINYINT NOT NULL , # the message was read or not
  user_sender_id INT NOT NULL ,
  user_receiver_id INT NOT NULL ,

  CONSTRAINT fk_user_sender_id FOREIGN KEY (user_sender_id) REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_user_receiver_id FOREIGN KEY (user_receiver_id) REFERENCES users(id)
    ON DELETE CASCADE,
    PRIMARY KEY (id)

);

