Installation de COMPOSER

DEBIAN/UBUNTU
> si ca ne fonctionne sinon ignorer cette étape si **sudo** appeler
user@server:~$ sudo curl -sS https://getcomposer.org/installer | php

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

LARAVEL

on peut maintenant créer un nouveau projet composer Laravel

~$ composer create-project laravel/laravel nom_project "5.4.*"

- laravel/framework v5.4.9 requires ext-mbstring * -> the requested PHP extension mbstring is missing from your system.

on doit installer mbstring
~$ sudo apt-get install php-mbstring


