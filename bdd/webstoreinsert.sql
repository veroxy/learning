USE webstore;

-- on ajoute la colonne à la une
ALTER TABLE produit ADD stock INT DEFAULT 150;

-- on cré la table client
CREATE TABLE client(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  login VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

--
CREATE TABLE produit_a_la_une(
  id INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
  id_produit INT NOT NULL,
  position INT NOT NULL,
  CONSTRAINT fk_produit_a_la_une_produit_id FOREIGN KEY (id_produit) REFERENCES produit(id)
);

CREATE TABLE commande (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_client INT NOT NULL ,
  date_commande TIMESTAMP NOT NULL,

  CONSTRAINT  fk_commande_client_id FOREIGN KEY  (id_client) REFERENCES client(id)
);

CREATE TABLE ligne_commande(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  quantity INT NOT NULL,
  id_commande INT NOT NULL ,
  id_produit INT NOT NULL,

  CONSTRAINT fk_ligne_commande_commande_id FOREIGN KEY (id_commande) REFERENCES commande(id),
  CONSTRAINT fk_ligne_commande_produit_id FOREIGN KEY (id_produit) REFERENCES produit(id)
);

INSERT INTO client(login, email)
VALUES('Corey', 'jcorey@gmail.com'),
  ('Farmer', 'philipfarmer@gmail.com'),
  ('Cronin', 'jcronin@gmail.com'),
  ('Herbert', 'fherbert@gmail.com'),
  ('Simmons', 'dan.simmons@gmail.com'),
  ('Asimov', 'asimo@gmail.com'),
  ('Dick', 'pkdick@gmail.com'),
  ('Robinson', 'ksrobinson@gmail.com'),
  ('Wilson', 'rcwilson@gmail.com'),
  ( 'King', 'sking@gmail.com');

-- trigger after
-- créeer un nouvelle enregistrement de ligne-cmd
-- décrementer produit.stock selon qty
-- SUPPRIMER une ligne de ligne-cmd0
-- ajouter qty au stock de produit.stock

-- CREER UN DECLENCHEUR "qty_add" APRES INSERTION DANS "ligne_commande'
-- POUR CHAQUE LIGNE:
-- MAJ de table "produit" en DEFINISSANT que la valeur de la COLONNE "stock" EST EGALE LA VALEUR de la COLONNE "stock"(produit.stock) MOINS la "NOUVELLE LIGNE DANS 'ligne_commande'" A la COLONNE quantity (ligne_commande.quantity)
-- SUR la "NOUVELLE LIGNE DANS 'ligne_commande'"  à la COLONNE "id_produit" qui est EGALE à la COLONNE "id_produit" de la table "produi"
DROP TRIGGER IF EXISTS `stock_qty_add`;
CREATE TRIGGER stock_qty_add AFTER INSERT ON ligne_commande FOR EACH ROW
  UPDATE produit SET stock = stock - NEW.quantity
  -- WHERE NEW.id_produit = produit.id_produit;
  WHERE id_produit = NEW.id_produit;


DROP TRIGGER IF EXISTS `qty_stock_delete`;
CREATE TRIGGER qty_stock_delete BEFORE DELETE ON ligne_commande FOR EACH ROW
  UPDATE produit SET stock = stock + OLD.quantity
  WHERE id_produit = OLD.id_produit;

INSERT INTO commande(id_client,date_commande)
    VALUES
      (1,NOW()),
      (3,NOW()),
      (5,NOW()),
      (7,NOW());

INSERT INTO ligne_commande(quantity, id_commande, id_produit)
VALUES
  -- (4,1,1),
  (3,2,3),
  (2,3,5),
  (1,4,7);

-- SOLUTION 1 : colonne STOCK on type UNSIGNED INT
-- ALTER TABLE `produit` CHANGE `stock` `stock` INT(11) NULL DEFAULT '150';
ALTER TABLE `produit` CHANGE `stock` `stock` INT(11) UNSIGNED NULL DEFAULT '150';

/*
DROP TRIGGER IF EXISTS `stock_negative_qty_add`;
CREATE TRIGGER stock_negative_qty_add BEFORE INSERT ON ligne_commande FOR EACH ROW

BEGIN
  IF  NEW.quantity >= produit.stock THEN
    UPDATE produit SET stock = 0
    WHERE NEW.id_produit = produit.id_produit;
  END IF;
END;
*/
-- SOLUTION 2: on va devoir faire le trigger dans le produit

DROP TRIGGER IF EXISTS `stock_negative_qty_add`;
CREATE TRIGGER stock_negative_qty_add BEFORE UPDATE
  ON produit FOR EACH ROW
  BEGIN
    IF NEW.stock < 0 THEN
      SET NEW.stock = 0;
    END IF;
   END;

INSERT INTO ligne_commande(id,quantity, id_commande, id_produit)
VALUES
(1,152,1,1);

--  afficher tous les clients et le nb de cmd qu'ils ont passés
--  afficher toutes les colonnes de la tabke client + colonne supplémentaire  "nombre de commande"
-- Inclure les clients qui n'ont jamais commandé (afficher nb cmds = 0)
USE webstore;
INSERT INTO commande(id_client,date_commande)
VALUES
(1,NOW()),
(3,NOW()),
(6,NOW()),
(8,NOW()),
(10,NOW());

INSERT INTO ligne_commande(quantity, id_commande, id_produit)
VALUES
  -- (4,1,1),
  (20,9,4),
  (15,8,7),
  (1,7,9),
  (5,5,9);

SELECT cmd.id_client as cli
  FROM commande cmd
    INNER JOIN
    ligne_commande lc
      ON cmd.id = lc.id_commande
    INNER JOIN client c
      ON cmd.id_client = c.id

    WHERE cmd.id;

SELECT client.login AS customer, commande.id AS cmds
FROM client , commande
 WHERE client.id = commande.id_client;

-- on cré une view :: un raccpourcit vers la commande select
CREATE OR REPLACE VIEW V_client_nb_cmds AS;

SELECT client.login, cmd.id AS nb_cmds
FROM client
INNER JOIN commande cmd ON  client.id = cmd.id_client
-- agréger les données par id de client car unique / cef primaire
GROUP BY client.id;
-- affiche ler
SELECT * FROM v_client_nb_cmds;

show create view v_client_nb_cmds;


UPDATE client
INNER JOIN commande ON  client.id = commande.id_client
    SET has_cmds =  1
WHERE ***;
