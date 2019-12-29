# laravel install

## ENVIRONNMENT INSTALLATION
   1. [COMPOSER.exe](https://getcomposer.org/Composer-Setup.exe)  ===> ref [nodeJs](pkgnodejs/composerlaravel.md)


on peut maintenant créer un nouveau projet composer Laravel
```shell
~$ composer create-project laravel/laravel nom_project ["5.4.*"]
```
> Problem 1
  laravel/framework v5.4.9 requires ext-mbstring * -> the requested PHP extension mbstring is missing from your system.

on doit installer mbstring
```shell
~$ sudo apt-get install php-mbstring
```

> Problem 1
  phpunit/phpunit 5.7.9 requires ext-dom * -> the requested PHP extension dom is missing from your system.
   But in your server you're missing ext-dom. php7.1-xml has all the related packages you need. So, you can simply install it by running:
```shell
sudo apt-get update
sudo apt-get install php7.0-xml
```

```shell
mysql -u root -p`
```
Une fois connecter à la base de données on créera un utilisateur : « foodies » dont le mot de passe sera « password ».

```sql
CREATE USER 'foodies'@'localhost' IDENTIFIED BY 'password';
```
Donner les privilèges à un utilisateur MySQL

Si vous n’avez pas créé de base de données, vous pouvez le faire tout simplement avec la commande suivante :
```sql
CREATE DATABASE  foodies;
```
On donne ensuite tous les droits à « foodies » sur la base de données « foodies ».

GRANT ALL PRIVILEGES ON foodies.* TO 'foodies'@'localhost'  WITH GRANT OPTION;

## CREER LE PROJET LARAVEL
   2. env wamp/mamp server 
   3. verification de la version de php `php - v` > ici c'est la version 5.4
   4. le repertoire source `httpdoc` 
   ```shell
    composer create-project --prefer-dist laravel/laravel nom_mon_projet "5.4.*" 
   ```
   5. **virtual host**  > dans wamp/mamp à `localhost/` créer `Ajouter un Virtual Host`
   6. indiquer
        - le nom du virtual host `http://goodfoodncookbook.projet/`
        - le root path vers lequel celui-ci doit pointer `http://localhost/vagrant/httpdoc/goodfoodncookbook` 
   7. dans les **outils** de wamp/mamp `redemarer le serveur DNS`
   
 a.   
   ```
   $ php artisan make:model Plat -m
   Model created successfully.
   Created Migration: 2018_07_24_144147_create_plats_table

   ```   
 a.   
   ```$ php artisan make:model Menu -m
      Model created successfully.
      Created Migration: 2018_07_24_144323_create_menus_table

   ```   
 a.   
   ```
   $ php artisan make:controller PlatsController --resource
   Controller created successfully.
$ php artisan make:controller MenusController --resource
Controller already exists!

   ```   
 a.   
   ```
   php artisan make:auth

   ```
   
###STRUCTURE DU PROJET
- **App** => ce qui fait fonctionner l’application
	- Dossier http => celui ou l’on va trouver les controleurs, les middlewares. 
	> Dans la V5.3 de Laravel on trouve les modeles ici (seulement pr la 5.3)
	- Dossier Providers => contient des outils qui va nous simplifier notre syntaxe
- **Bootstrap** => Ce qui va permettre de generer tous les fichier de performance et d’optimisation de notre application (peu utilisé)
- Config => Contient toutes les variables de notre application. Point sensible de notre application. A configurer au debut du projet.
- **Database** => Particulièrement important. Laravel utilise un système de migration, on va créer toutes nos database avec Laravel mais en PHP. Pour passer notre code vers le SQL on fait une migration.
    - Factories =>     
-  Public => Là où l’on a notre css, notre js, notre font, ect.. Ce dossier contient tout ce qui peux être modifié par le client. 
- **Ressources** => 
    - Assets : On place ici nos fichiers compilables, comme nos fichiers SASS, ect…
    - Lang : On placera ici toutes nos traductions
    - Views : On place ici toutes nos vues, cad tous nos fichiers HTML.
    - Routes : URL par lesquels on accède aux pages. Le routeur va nous amener vers une vue. Important pour la SEO !!! 
   > Par défaut on place tout dans Web, lorsque l’on communique avec des API on place nos fichier dans le fichier API.
- **Storage** : là où tous nos fichiers de cache sont stockés .
	- Logs : on récupère des 
- **Test** : Pour tous les tests automatisés, pas utilisé pr nous.
- **Vendor** : Contient toutes les dépendances qui font fonctionner l’application laravel.
- **.env** : contient toutes les infos sensible de d'environnement bdd il faut indiquer le nm de la bdd / utilisateur /mp
    ```php
        DB_CONNECTION=mysql
        DB_HOST=127.0.0.1
        DB_PORT=3306
        DB_DATABASE=bdd_name
        DB_USERNAME=user_name
        DB_PASSWORD=mp
    ```
- **database.php**
changer les paramètres d'encodage pour ne pas avoir d'"rreur
    ```php
         'charset' => 'utf8',
         :'collation' => 'utf8_unicode_ci',
    ```
- **artisan**    
- **Package.json** : ce qui nous permet de compiler nos fichier
 
- **Server.php** : Simuler le fonctionnement d’un serveur local.
- **Webpack** : Permet de compiler nos fichier SASS en fichier lisible par le client

----
## DIFFICULTES
voir [tuto](https://www.rosehosting.com/blog/install-laravel-on-ubuntu-16-04/)

