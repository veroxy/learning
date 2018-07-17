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
(1,152,1,1)
