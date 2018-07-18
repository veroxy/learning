
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

-- ------------------------------------------------------------------------------------------


INSERT INTO produit (nom, description, prix_HT, visible, visuel)
VALUES
  ('PC Portable HP', 'Lorem ipsum dolor sit amet, consectetur', 1000, 1, 'pc_port_hp.jpg'),
  ('Souris sans fil', 'Lorem ipsum dolor sit amet, consectetur elit', 30, 1, 'souris_sans_fil.jpg'),
  ('Souris gaming', 'Lorem ipsum dolor sit amet, consectetur elit', 80, 1, 'souris_gaming.jpg'),
  ('PC Bureau', 'Lorem ipsum dolor, consectetur adipiscing elit', 1500, 0, 'pc_bureau.jpg'),
  ('Ecran 27"', 'dolor sit amet, consectetur adipiscing elit', 700, 1, 'ecran_27_pouces.jpg'),
  ('Ecran 17"', 'Lorem sit amet, consectetur adipiscing elit', 200, 1, 'ecran_17_pouces.jpg'),
  ('PC Portable Lenovo', 'Lorem ipsum dolor sit amet, adipiscing elit', 780, 1, 'pc_port_lenovo.jpg'),
  ('Clavier', 'Lorem ipsum dolor sit amet, adipiscing elit', 25, 0, 'clavier_pas_cher.jpg'),
  ('Casque', 'elit', 55, 1, 'casque.jpg');

INSERT INTO categorie (nom)
VALUES
  ('Informatique'),
  ('Matériel'),
  ('Ordinateur'),
  ('Accessoire'),
  ('PC Portable'),
  ('PC Bureau'),
  ('Ecran');

INSERT INTO produit_categorie (id_produit_j, id_categorie_j, dateAjout)
VALUES
  (1, 1, '2018-06-12'),
  (1, 2, '2017-06-12'),
  (1, 3, '2015-05-22'),
  (1, 5, '2018-03-07'),
  (2, 1, '2017-06-12'),
  (2, 2, '2015-05-22'),
  (2, 4, '2018-03-07'),
  (3, 1, '2017-06-12'),
  (3, 2, '2015-05-22'),
  (3, 4, '2018-03-07'),
  (4, 1, '2018-06-12'),
  (4, 2, '2017-06-12'),
  (4, 3, '2015-05-22'),
  (4, 6, '2018-03-07'),
  (5, 1, '2017-06-12'),
  (5, 2, '2015-05-22'),
  (5, 7, '2018-03-07'),
  (6, 1, '2017-06-12'),
  (6, 2, '2015-05-22'),
  (6, 7, '2018-03-07'),
  (7, 1, '2018-06-12'),
  (7, 2, '2017-06-12'),
  (7, 3, '2015-05-22'),
  (7, 5, '2018-03-07'),
  (8, 1, '2017-06-12'),
  (8, 2, '2015-05-22'),
  (8, 4, '2018-03-07'),
  (9, 1, '2017-06-12'),
  (9, 2, '2015-05-22'),
  (9, 4, '2018-03-07');

INSERT INTO produit_similaire (id_produit_source_j, id_produit_cible_j, degre)
VALUES
  (1, 7, 90),
  (1, 4, 70),
  (2, 3, 90),
  (5, 6, 95),
  (8, 9, 40);

-- ------------------------------------------------------------------

SELECT produit.visible, produit.nom FROM produit WHERE visible = 1 ;

-- TOUS LES PRODS, avec la cat et sa date d'ajout
-- je selection les nom des produit, les nom de categorie, les date d'ajout
-- je pars de la table produit
-- je vais dans produit_catéboreie pour trouver la correspondance de

SELECT produit.nom AS 'Nom produit', categorie.nom AS 'Catégorie', produit_categorie.dateAjout
FROM produit
  INNER JOIN produit_categorie ON produit.id_produit = produit_categorie.id_produit_j
  INNER JOIN categorie ON produit_categorie.id_categorie_j = categorie.id_categorie
GROUP by produit.nom;


-- TOUTES les CAT qui ont des produit visible à 1
SELECT produit.nom,categorie.nom AS 'Catégorie', produit.visible  AS 'En stock'
FROM categorie
  INNER JOIN produit_categorie ON categorie.id_categorie = produit_categorie.id_categorie_j
  INNER JOIN produit ON produit_categorie.id_produit_j = produit.id_produit
WHERE produit.visible = 1
GROUP by produit.nom;
-- OU
SELECT DISTINCT categorie.nom AS 'categorie'
FROM categorie
  INNER JOIN produit_categorie
    ON categorie.id_categorie = produit_categorie.id_categorie_j
  INNER JOIN produit
    ON produit_categorie.id_produit_j = produit.id_produit
WHERE produit.visible = 1 ;
-- OU
SELECT  DISTINCT categorie.nom AS 'catégorie'
FROM produit
  INNER JOIN produit_categorie
    ON produit.id_produit = produit_categorie.id_produit_j
  INNER JOIN categorie
    ON produit_categorie.id_categorie_j = categorie.id_categorie
WHERE produit.visible = 1;

-- ------------------------------------------------------------
-- les INNER JOIN MULTIPLE AVANT LA CONDTION WHERE
-- on selectionne la somme des prix des produits
--

SELECT sum(p.prix_HT)
FROM produit p
  INNER JOIN produit_categorie pc ON p.id_produit = pc.id_produit_j
  INNER JOIN categorie c ON pc.id_categorie_j = c.id_categorie
WHERE c.nom = 'Accessoire';

-- -----------------------------------------------------------
SELECT AVG(p.prix_HT)
FROM produit p
  INNER JOIN produit_categorie pc ON p.id_produit = pc.id_produit_j
  INNER JOIN categorie c ON pc.id_categorie_j = c.id_categorie
WHERE c.nom = 'PC Portable';

-- ---------------------------------------------------------------
-- produit similaire pour chaque produit
SELECT DISTINCT ps.nom,count(pc.id_produit) AS 'Nombre CIBLE'
FROM produit ps
  LEFT JOIN produit_similaire ON ps.id_produit = produit_similaire.id_produit_source_j
  LEFT JOIN produit pc ON produit_similaire.id_produit_cible_j = ps.id_produit
GROUP BY ps.id_produit;

-- -----------------------------------------------------------*
-- afficher le nom
-- le prix des produits au produit "PC Portable HP" par degré décroissant de dégré

SELECT pc.nom, ps.prix_HT, pc.id_produit, produit_similaire.degre
FROM produit ps
  LEFT JOIN produit_similaire ON ps.id_produit = produit_similaire.id_produit_source_j
  LEFT JOIN produit pc ON produit_similaire.id_produit_cible_j = pc.id_produit
WHERE ps.nom = 'PC Portable HP'
ORDER BY produit_similaire.degre DESC;

-- ------------------------------------------------------------
-- le nom, le prix des produits visible dont le prix est strictement supérieur 700$
SELECT nom, visible, prix_HT
FROM produit
WHERE prix_HT > 700 AND visible;