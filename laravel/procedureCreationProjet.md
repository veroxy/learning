# Procédure de création projet Laravel 5.4*

Je créé mon projet laravel
```
    composer create-projet --prefer-dist laravel/laravel NOMPROJET "5.4.*"
```
- Je créé mon virtual host
    - sous **WINDOWS** :  clic droit sur le le picto "wamp" en bas à gauche et on va dans **gérer mes virtual host** 
- Je créé ma bdd(avec ou non utilisateurs) soit via la console soit en passant l'interface phpmyadmin
- Je configure le fichier **.env** (environnement BDD)
- Je suis en 5.4 donc je modifie config>database.php pour enlever les mb4
- Je créé mes models et mes migrations
```
php artisan make:model Post -m
php artisan make:model Address -m
```

- Je créé mes controllers

```
php artisan make:controller PostsController --resource
php artisan make:controller AddressesController --resource
php artisan make:controller UsersController --resource
```
- Je créé mes vues
- Je créé mon authentification
```php artisan make:auth```
- Je créé mes routes
- Je remplis mes migrations
- Je migre
```php artisan migrate```
- Je lis mes méthodes de controllers à mes vues
- Je met en place mes relations
- Je remplis mes vues
- Je remplis mes controlleurs

### Si je récupère le projet d'un GIT:
```
git clone
composer update
npm i
```
Créer la BDD
Modifier le .env
```
php artisan key:generate
php artisan config:clear
php artisan migrate
```
Configurer le localhost
