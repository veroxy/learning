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
