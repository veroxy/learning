- [installation materialize](https://github.com/ItsFaresse/Laravel-Materialize/blob/master/Mater.md)

- [Class Form](https://laravelcollective.com/docs/5.4/html)

----

## Créer des rôles utilisateurs
> [User Role: Access Level Control ]('https://www.youtube.com/watch?v=gzT-JQKTfGo')
- au paravant il faut créer une Auth `php artisan make:Auth`
- puis créer une migration model role `php artisan make:model role -m`
- dans le fichier de migration **xxxx_create_table_roles_table.php** où l'on défini les colonnes de la table