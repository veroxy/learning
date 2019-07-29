

créer une migration avec le model(== Class / Objet) (ici Role)
```
php artisan make:model Role -m
```
**return :**
> Model created successfully.
  Created Migration: 2018_07_02_112920_create_roles_table (fichier que l'on 
  modifie)
  + une class Role dans (App > Role.php )
 
1. ### Created Migration: 2018_07_02_112920_create_roles_table
    ```
         public function up()
            {
                Schema::create('roles', function (Blueprint $table) {
                    $table->increments('id');
                    >>$table->increments('name');
                    $table->timestamps();
                });
            }
    ```

2. ### modification de la class Role.php
    ```
    ```


## MIDDLEWARE
cette classe njhérite d'aucune classe
ft handle > test si admin ou non 
>  if(Auth::user()->isAdmin())

return une instance de model User.php 
