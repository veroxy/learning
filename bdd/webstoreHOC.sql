
CREATE USER 'hocproduit2018'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE webstore;
;

-- --------------------------------------------------------------
-- WEBSTORE           -- site de vente en ligne avec:
-- produit (id_produit, nom, visuel, description, visible)
-- categorie (id_categorie, nom)
-- produit_categorie (id_categorie_j, id_produit_j, dateAjout)
--  produit_similaire (id_produit_source, id_produit_cibl degre)
-- ---------------------------------------------------------------



-- ----
CREATE TABLE produit (
  id_produit INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(150) NOT NULL ,
  visuel VARCHAR(200) NULL ,
  description LONGTEXT NULL ,
  visible TINYINT NOT NULL DEFAULT 0
)
  ENGINE=INNODB;


CREATE TABLE categorie (
  id_categorie INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(150) NOT NULL
)
  ENGINE=INNODB;

CREATE TABLE produit_categorie(
  id_produit_j INT NOT NULL ,
  CONSTRAINT fk_prodcat_produit FOREIGN KEY (id_produit_j)
    REFERENCES produit(id_produit),

  id_categorie_j INT NOT NULL ,
  CONSTRAINT fk_prodcat_categorie FOREIGN KEY (id_categorie_j)
  REFERENCES categorie(id_categorie),
  dateAjout DATE NULL

)
  ENGINE=INNODB;
-- -------------------------------------------------------------------
--  On ajoute une clef primaire qui est la liste des deux id_j
ALTER TABLE produit_categorie ADD PRIMARY KEY (id_produit_j,id_categorie_j);

-- --------------------------------------------------------------------
--  je peux faire directement l'attribution de la clef primaire
CREATE TABLE produit_similaire(
  id_produit_source_j INT NOT NULL ,
  CONSTRAINT ft_prodsimsource_produit FOREIGN KEY (id_produit_source_j)
  REFERENCES produit(id_produit),

  id_produit_cible_j INT NOT NULL,
  CONSTRAINT ft_prdsimcible_produit FOREIGN KEY (id_produit_cible_j)
  REFERENCES produit(id_produit),
  degre INT NOT NULL DEFAULT 50,

  PRIMARY KEY (id_produit_source_j,id_produit_cible_j)
)
  ENGINE=INNODB;