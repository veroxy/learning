- la casacade se fait du parent à enfant
role "admin" delete cascade> tous les users qui ont un role "admin"

--- 
- introduire la notion de produits à la UNE "produit à la une"
- et de STOCK "stock produit" DEFAULT 150
- client / commande
 > client
 > ----
 > - id     | id
 > - login  | id_client
 > - email  | date_commande
 
 ligne_commande
 id
 id_commands
 id_produit
 id_quantity
 
 ---- 
 
 usigned INT > au lieu de prendre -2XXXXX à 2XXXXXX on aura 4xxxxxx car on ne permet pas de valeurs négatives.
 
 Trigger > déclencheur
 [création phpMyAdmin]('trigger.PNG');
 résultats des modifications : 