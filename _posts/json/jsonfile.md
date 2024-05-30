---
layout: default
title: json File avec PHP
parent: json
---

# traiter un fichier JSON dans PHP

> on peut traiter des fichiers de données de type objets javascript dans php tels que file.json, comme on peut aussi le faire avec curl
---


### JSON KEZAKO ?
Un fichier Json peut servir de BDD ou juste apporter des éléments à traiter comme du php
* [outils pour générer un json à partir de SQL](http://www.csvjson.com/sql2json)
* [formater au format json](http://www.csvjson.com/json_beautifier)

### SYNTAX
exemple avec un objet pour un menu (menu.json)
il s'agit d'un objet javascript composé de membres qui sont un attribut et un tableau lequel contient d'autres objets, les lignes du menu.
```javascript
  {
    "commandes": [
      {
        "titre": "Nouveau",
        "action": "CreateDoc"
      },
      {
        "titre": "Ouvrir",
        "action": "OpenDoc"
      },
      {
        "titre": "Fermer",
        "action": "CloseDoc"
      }
    ]
  }
```

### traitements PHP
PHP peut décoder un fichier.json et encoder vers un fichier.json.
  * **décoder**
  il faut récupérer_le_contenu(du_fichier.json) qu'il faut décoder. On obtient alors un objet de type stdClass (ce n'est pas un array)
  ```php
    $fileJson = file_get_contents('menu.json');
    $decodeJson = json_decode($fileJson);

  ```
  * on peut désormais le parcourir avec une boucle for / foreach
   ```php
    foreach ($decodeJson as $value){
        echo $value
    }
   ```
