--  requete DML - Création tabale classe dans hoc --
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