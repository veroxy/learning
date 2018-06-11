-- Création tabale classe dans hoc --
CREATE TABLE classe(
  id_classe INT PRIMARY KEY  AUTO_INCREMENT,
  nom_classe VARCHAR(100) NOT NULL , /*on veut fournir un nom*/
  nb_places INT NOT NULL DEFAULT 30, /*on donne une valeur par défault*/
  niveau VARCHAR(50) NULL,
  nom_prof_principal VARCHAR(150)  NOT NULL
);

CREATE TABLE etudiant(
  id_etudiant INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(200) NOT NULL,
  prenom VARCHAR(200) NOT NULL,
  telephone VARCHAR(10) NULL,
  email VARCHAR(80) NOT NULL
);
ALTER TABLE classe ENGINE=INNODB;

INSERT INTO classe (nom_classe, nb_places, niveau, nom_prof_principal) VALUES ('hoc_2018',25,'3ème','Mme Bénédicte Crepet');


-- INSERTION DE DONNEES --
INSERT INTO etudiant (nom, prenom, telephone, email) VALUES ('Longdubb','Moran','0607080910','lm@avalon.kg');
INSERT INTO etudiant (nom, prenom, telephone, email) VALUES ('Elighbert','Luther','060202349','eliLuther@mucher.kg');
INSERT INTO etudiant (nom, prenom, telephone, email) VALUES ('Edinbarth','Nolan',NULL ,'nothenman@butcher.kg');
INSERT INTO classe (nom_classe, nb_places, niveau, nom_prof_principal) VALUES ('simplon_2018',30,'1ère','Mlle Cogno Corones');


-- DDL - persistance des données == stocker des données JOINTURE : 1-N -> un etudiant a une seule classe _j pour joinction --

ALTER TABLE etudiant ADD COLUMN id_classe_j INT NOT NULL;
-- fk = foreignkey +
ALTER TABLE etudiant ADD CONSTRAINT fk_etudiant_classe FOREIGN KEY (id_classe_j) REFERENCES classe(id_classe);


-- on inert des nouvelle données avec la valeur de la clef étrangère --
INSERT INTO etudiant (nom, prenom, telephone, email,id_classe_j) VALUES ('Marouf', 'Mirou', '0620385074', 'lalamirou@mater.kg',1);

INSERT INTO etudiant (nom, prenom, telephone, email, .etudiant.id_classe_j) VALUES
  ('Masteraound', 'Mulud',NULL, 'iranianboy@bi.md',3),
  ('Mao', 'Mahiti',NULL, 'boychild@gay.gl',1),
  ('Poscripter', 'Basil',NULL, 'base@italian.fr',3);

-- on peut insérrer une CONTRAINTE DIRECTEMENT A LA CREATION DE LA TABLE --
CREATE TABLE professeur (
  id_professeur INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(200) NOT NULL,
  prenom VARCHAR(200) NOT NULL ,
  civilite VARCHAR(15) NOT NULL,
  matiere VARCHAR(50) NOT NULL,
  id_classe_j INT NULL,
  CONSTRAINT fk_professeur_classe FOREIGN KEY (id_classe_j) REFERENCES classe(id_classe)
)ENGINE=INNODB;

-- MDL --
INSERT INTO professeur (nom, prenom, civilite, matiere, id_classe_j)
VALUES
  ('Crepet','Bénédicte','mme.','gestion',1),
  ('Niel','Xavier','m.','telecom',2),
  ('Cogno','Corones','mlle','design graphique',2);

ALTER TABLE classe
  ADD COLUMN id_professeurprincipal_j INT NOT NULL;

UPDATE classe
SET   id_professeurprincipal_j=1;

ALTER TABLE classe
  ADD CONSTRAINT fk_professeurprincipal_professeur FOREIGN KEY (id_professeurprincipal_j)REFERENCES professeur(id_professeur);


SELECT * FROM professeur; /* retourne toute la table professeur*/
SELECT nom,prenom FROM professeur ; /* retourne uniquement les colonnes nom et prénom de la table professeur sans les autres sous le NOMPROFESSEUR*/
SELECT nom AS nom_professeur FROM professeur;
SELECT CONCAT(nom,' ', prenom) AS nom_prenom FROM professeur; /*retourne la fusion de nom + ' ' + prenom dans une table nom_prenom*/
SELECT * FROM etudiant WHERE etudiant.telephone  IS NULL ; /* renvoie toutes les occurences d'étudiants qui n'on pas de telephone*/

SELECT * FROM professeur WHERE id_professeur=2;
SELECT * FROM professeur WHERE matiere = 'sport' AND civilite = 'm';
SELECT * FROM professeur WHERE matiere = 'sport' OR civilite = 'm';
SELECT * FROM professeur WHERE civilite = 'mme';
SELECT * FROM professeur WHERE matiere <> 'gestion';
SELECT * FROM professeur WHERE matiere IN ('gestion','telecom');
SELECT * FROM professeur WHERE id_classe_j NOT IN (2,3);
SELECT * FROM professeur WHERE matiere LIKE 'S%';
SELECT DISTINCT civilite FROM professeur LIKE 'S%';
SELECT * FROM professeur ORDER BY nom, prenom DESC;
-- on compte le nompbre de professeurs dont la matère est sport"
SELECT COUNT(*)AS nb_professeurs FROM professeur WHERE matiere = 'sport';



INSERT INTO professeur (nom, prenom, civilite, matiere, id_classe_j)
VALUES
  ('Jwes','Eli','m','sport',3),
  ('Benarfa','Aliesse','mme','sport',2),
  ('Barjo','Steve','mme','algorithmie',1);

INSERT INTO classe (nom_classe, nb_places, niveau, id_professeurprincipal_j)
VALUES
  ('dg_2020',25,'bts',3),
  ('fcil_2020',12,'bac',5),
  ('este_2019',15,'bac',2);

SELECT COUNT(*) FROM classe WHERE classe.id_professeurprincipal_j = 3;

-- EXO --
SELECT * FROM etudiant WHERE etudiant.id_classe_j = 1;
SELECT * FROM etudiant WHERE nom LIKE 'D%';
SELECT nom,prenom,email FROM etudiant WHERE  etudiant.id_classe_j = 2;
SELECT nom FROM etudiant WHERE etudiant.id_classe_j <> (2) AND nom LIKE '%f';
SELECT emaiL AS email_in_class1or2 FROM etudiant WHERE etudiant.id_classe_j = (1,2);
SELECT COUNT(*) FROM etudiant WHERE etudiant.id_classe_j = 3;
SELECT count(*) FROM etudiant WHERE etudiant.id_classe_j = (4,5);

-- TOLEARN JOINCTION
-- INNER JOIN == intersection des deux tables
-- LEFT JOIN == la classe de gauche selectionne la classe à joindre

SELECT *
FROM classe
  INNER JOIN professeur
    ON classe.id_professeurprincipal_j = professeur.id_professeur;


-- TOLEARN  on peut donner des "ALIAS" au nom de la table lors de la requette ici classe = cl et professeur = pr
SELECT cl.id_classe AS "ID classe", CONCAT(nom,' ',prenom) AS prof_principale, pr.id_classe_j AS  "ID prof"
FROM classe cl
  INNER JOIN professeur pr
    ON cl.id_professeurprincipal_j = pr.id_professeur;

SELECT CONCAT(e.nom,' ',e.prenom) AS 'nom prenom' ,nom_classe AS 'Classe', CONCAT(p.nom, ' ', p.nom) AS 'prof_principal'
FROM etudiant e
  INNER JOIN classe cl
    ON e.id_classe_j =  cl.id_classe
  INNER JOIN professeur p
    ON cl.id_professeurprincipal_j = p.id_professeur;


