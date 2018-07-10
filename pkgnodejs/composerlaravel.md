----
# Installation de COMPOSER sur DEBIAN/UBUNTU
[installation complet](https://gist.github.com/Lemmings19/b072aa4af5e0bff5f3332821f4c6b30c)
----
0. verifier si nodejs et npm sont installées `nodejs -v` et `npm -v`
sinon les installer et créer les liens symbolique vers le local/bin:

~~~
sudo apt-get update
sudo apt-get install nodejs npm
sudo ln -s /usr/bin/nodejs /usr/local/bin/node
sudo ln -s /usr/bin/npm /usr/local/bin/npm
~~~
ou 
~~~
sudo apt install nodejs-legacy
~~~

> si ca ne fonctionne sinon ignorer cette étape si **sudo** appeler
~~~
user@server:~$ sudo curl -sS https://getcomposer.org/installer | php
~~~
1. (sudo) télécarger le dossier d'installation de composer dans /temp/ 
~$ php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"

2. 
remplacer la variable $sha_version par le finger de la [dernière version]('https://composer.github.io/pubkeys.html')
~~~
$sha384_version = '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061'
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$sha384_version') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/tmp/composer-setup.php'); } echo PHP_EOL;"
~~~

3. on renomme composer-setup.php (== composer.phar) en "composer" pour une ** utilisation en GLOBAL**
~~~ 
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
~~~

on peut maintenant lancer la cmd `composer -version`
Cette manipulation peut ne pas fonctionner du coup on peur garder `--filename=composer.phar`
que auqauel on donnera l'alias composer dans .bashrc

4. le fichier `/user/local/bin/composer` peut rentrer en conflit (pourquoi je ne sais pas) lorsque l'on utilise la commande `composer` qui était à l'origine `php composer.phar -opt`. alors on le  `mv composer composer.phar` et lui cré un alias de le .bashrc
~~~
~$ vim ~/.barshrc
alias composer ="php /usr/local/bin/composer.phar"
~~~
on peut maintenant lancer la cmd `composer -version`


----

# LARAVEL

on peut maintenant créer un nouveau projet composer Laravel

~$ composer create-project laravel/laravel nom_project "5.4.*"

    - Problem 1
    laravel/framework v5.4.9 requires ext-mbstring * -> the requested PHP extension mbstring is missing from your system.

on doit installer mbstring
~$ sudo apt-get install php-mbstring


    - Problem 1
    -phpunit/phpunit 5.7.9 requires ext-dom * -> the requested PHP extension dom is missing from your system.
>But in your server you're missing ext-dom. php7.1-xml has all the related packages you need. So, you can simply install it by running:

sudo apt-get update
sudo apt-get install php7.0-xml


mysql -u root -p

Une fois connecter à la base de données on créera un utilisateur : « foodies » dont le mot de passe sera « password ».

CREATE USER 'foodies'@'localhost' IDENTIFIED BY 'password';

Donner les privilèges à un utilisateur MySQL

Si vous n’avez pas créé de base de données, vous pouvez le faire tout simplement avec la commande suivante :

CREATE DATABASE  foodies;

On donne ensuite tous les droits à « foodies » sur la base de données « foodies ».

GRANT ALL PRIVILEGES ON foodies.* TO 'foodies'@'localhost'  WITH GRANT OPTION;