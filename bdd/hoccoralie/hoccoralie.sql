
-- Supprimer la BDD si elle existe
DROP DATABASE IF EXISTS hoccoralie;
-- Créer la BDD avec jeu de caractères
CREATE DATABASE IF NOT EXISTS hoccoralie
CHARACTER SET utf8 COLLATE utf8_unicode_ci;
-- Utiliser la BDD
use hoccoralie;

-- Définir la façon de stocker la BDD / InnoDB permet d'utiliser les clés étrangères (intégrité référentielle) et 
-- transactions (donner les instructions puis les appliquer dans un second temps en checkant)
-- Le ! sert de "condition" : si les versions correspondent, on exécute le code
/*!50503 set default_storage_engine = InnoDB */;

/*-- Supprimer les tables si elles existent (surtout utilise en cas de BDD déjà existante)
DROP TABLE IF EXISTS  users,
                      password_reset,
                      roles,
                      medias,
                      articles,
                      article_media,
                      courses,
                      article_course,
                      comments,
                      logs,
                      messages;
*/

-- Créer les nouvelles tables
CREATE TABLE users(
                      id              INT           AUTO_INCREMENT,
                      login           VARCHAR(150)  NOT NULL          UNIQUE,
                      first_name      VARCHAR(150)  NULL,
                      last_name       VARCHAR(150)  NULL,
                      email           VARCHAR(150)  NOT NULL          UNIQUE,
                      password        VARCHAR(50)   NOT NULL,
                      salt            VARCHAR(32)   NOT NULL,
                      is_active       TINYINT       NOT NULL          DEFAULT 1,
                      role_id         INT           NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE password_resets(
                      id              INT           AUTO_INCREMENT,
                      email           VARCHAR(150)  NOT NULL          UNIQUE,
                      token           VARCHAR(150)  NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE roles(
                      id              INT           AUTO_INCREMENT,
                      name            VARCHAR(150)  NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE medias(
                      id              INT           AUTO_INCREMENT,
                      path            VARCHAR(255)  NOT NULL,
                      extension       VARCHAR(50)   NOT NULL,
                      user_id         INT           NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE articles(
                      id              INT           AUTO_INCREMENT,
                      title           VARCHAR(150)  NOT NULL,
                      content         TEXT          NOT NULL,
                      is_active       TINYINT       NOT NULL          DEFAULT 1,
                      author_id       INT           NOT NULL,
                      media_header    INT           NOT NULL,
                      date_creation   DATETIME      NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE article_media(
                      id              INT           AUTO_INCREMENT,
                      media_id        INT           NOT NULL,
                      article_id      INT           NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE courses(
                      id              INT           AUTO_INCREMENT,
                      name            VARCHAR(150)  NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE article_course(
                      id              INT           AUTO_INCREMENT,
                      article_id      INT           NOT NULL,
                      course_id       INT           NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE comments(
                      id              INT           AUTO_INCREMENT,
                      content         TEXT          NOT NULL,
                      is_active       TINYINT       NOT NULL           DEFAULT 1,
                      user_id         INT           NOT NULL,
                      article_id      INT           NOT NULL,
                      date_creation   DATETIME      NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE logs(
                      id                INT         AUTO_INCREMENT,
                      user_id           INT         NOT NULL,
                      article_id        INT         NOT NULL,
                      date_modification DATETIME    NOT NULL,
                      PRIMARY KEY(id)
);

CREATE TABLE messages(
                      id                INT         AUTO_INCREMENT,
                      subject           VARCHAR(150)NOT NULL,
                      content           TEXT        NOT NULL,
                      is_read           TINYINT     NOT NULL            DEFAULT 1,
                      date_send         DATETIME    NOT NULL,
                      date_receive      DATETIME    NOT NULL,
                      user_sender_id    INT         NOT NULL,
                      user_receiver_id  INT         NOT NULL,
                      PRIMARY KEY(id)
);

-- Ajouter les clés étrangères
ALTER TABLE users
ADD CONSTRAINT fk_users_roles FOREIGN KEY(role_id) REFERENCES roles(id);

ALTER TABLE medias
ADD CONSTRAINT fk_medias_users FOREIGN KEY(user_id) REFERENCES users(id);

ALTER TABLE articles
ADD CONSTRAINT fk_articles_users FOREIGN KEY(author_id) REFERENCES users(id),
ADD CONSTRAINT fk_articles_medias FOREIGN KEY(media_header) REFERENCES  medias(id);

ALTER TABLE article_media
-- Supprime l'association si le média n'existe plus
ADD CONSTRAINT fk_article_media_medias FOREIGN KEY(media_id) REFERENCES medias(id) ON DELETE CASCADE,
-- Supprime l'association si l'article n'existe plus
ADD CONSTRAINT fk_article_media_articles FOREIGN KEY(article_id) REFERENCES articles(id) ON DELETE CASCADE;

ALTER TABLE article_course
-- Supprime l'association si l'article n'existe plus
ADD CONSTRAINT fk_article_course_articles FOREIGN KEY(article_id) REFERENCES articles(id) ON DELETE CASCADE,
-- Supprime l'association si la matière n'existe plus
ADD CONSTRAINT fk_article_course_courses FOREIGN KEY(course_id) REFERENCES courses(id) ON DELETE CASCADE;

ALTER TABLE comments
ADD CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
-- Supprime les commentaires si l'article n'existe plus
ADD CONSTRAINT fk_comments_articles FOREIGN KEY(article_id) REFERENCES articles(id) ON DELETE CASCADE;

ALTER TABLE logs
ADD CONSTRAINT fk_logs_users FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
-- Supprime les logs si l'article n'existe plus
ADD CONSTRAINT fk_logs_articles FOREIGN KEY(article_id) REFERENCES articles(id) ON DELETE CASCADE;

ALTER TABLE messages
-- Supprime les messages si l'utilisateur n'existe plus
ADD CONSTRAINT fk_messages_users_sender FOREIGN KEY(user_sender_id) REFERENCES users(id) ON DELETE CASCADE,
ADD CONSTRAINT fk_messages_users_receiver FOREIGN KEY(user_receiver_id) REFERENCES users(id) ON DELETE CASCADE;


