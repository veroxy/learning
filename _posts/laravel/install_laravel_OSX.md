#OSX et MAMP (ou XAMPP)
```shell
php -v
vim .bashrc (voir .bash_profile sinon)
 PATH=‘Applications/MAMP/bin/php/php7.0.8/bin:$PATH’
```
(XAMPP:export PATH="/Applications/XAMPP/xamppfiles/bin:$PATH")

`php -v`
**RETURN :**
>PHP 7.\*.\* (cli) (built: Aug 26 2016 06:17:04) ( NTS )
Copyright (c) 1997-2016 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies


on va déplace **composer.phar**
```mv composer.phar /usr/local/bin/composer```  
si ça ne marche pas garder son nom d’origine et créer un alias dans **.bashrc**
`alias composer="/usr/local/bin/composer.phar"`

après on reprend le même file que que sous windows
```
composer create-project --prefer-dist laravel/laravel nom_mon_projet "5.4.*" 
```

-----


### le virtualhost sous mamp

- On ajoute dans le fichier de config du dossier HTTPDOC
    ```
    vim /Applications/MAMP/conf/apache/httpd.conf
    
    # NameVirtualHost *
    Include /Applications/MAMP/conf/apache/virtualhost.conf
    ```

- On ajoute le chemin du dossier, on lui donne un chemin d’accesweb et on ui donne un alias
    ```
    vim /Applications/MAMP/conf/apache/virtualhost.conf
    
    <VirtualHost *:8888>
        DocumentRoot	"/Applications/MAMP/htdocs/docref"
        ServerName		docref
    </VirtualHost>
    
    <VirtualHost *:8888>
        DocumentRoot	"/Applications/MAMP/htdocs/monportefeuille"
        ServerName		proj.monportefeuille
        ServerAlias		monportefeuille
    </VirtualHost>  
    ```
    
Dans xamp il y a juste besoin d’aller faire un clic-droit sur l’onglet Wamp et aller dans outil > redémarrer le DNS ici on va modifier le fichier d’hosting
    ```
     vim /etc/hosts il faut ARRETER puis REDEMARRER Mamp
    ```
après on revient au commande [laravel - création de projet](laravel/procedureCreationProjet.md)
                             
