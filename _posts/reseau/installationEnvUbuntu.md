---
layout: page
title: INSTALLTION ENVIRONNEMENT UBUNTU
parent: reseau
---

# INSTALLTION ENVIRONNEMENT UBUNTU


---

## Téléchargement et installations /!\ requis
1. téléchargement d'ubuntu:
    - télécharger la version stable (16.04 stable/ 16.10) sur USB ou la version en développement (16.10)
    - lancer l'ordi en mode BOOTS (F12/F11) et selectionner le support (USB)
2. Si il doit avoir migration de XUBUNTU/kubuntu VERS Ubuntu faire les manipulation suivante:
```

```

3. les plus Ubuntu
    * Mettre la barre de menu en bas /gauche
    ```
        Gauche
        gsettings set com.canonical.Unity.Launcher launcher-position Left
        
        Bas
        gsettings set com.canonical.Unity.Launcher launcher-position Bottom
    ```
    
----

## Paramètres Terminal
1. Créer un profil -> Terminal -> Préférences -> Profil -> créer un nouveau profil
2. * Couleur du profil -> Edition -> Préférences Profil -> Général -> choisir le profil
   * Dans Couleurs -> paramétrer les couleurs
3. on peut paramétrer le terminal pour qu'il se  lance en éxécutant une commande ou un shell script:
   * Edition -> Préférences profil (choix du profil) -> Commande -> soit Script shell / soit rentrer une commande

4. faire en sorte que le terminal ne soit pas sensible à la CASE en autocomplétion (TAB) il faut créer un fichier ".inputrc"
     ```shell
         vi .inputrc
         
         ---
         set completion-ignore-case on
     ```
     
5. installer VIM et créer un fichier ".vimrc" avec les [paramètres]() 
     ```
         git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
         sudo apt install vim
         vim .vimrc
     ```
     
---- 

## APACHE / MYSQL / PHP / PHPMYADMIN
[REF: tuto ici](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04#how-to-find-your-server-39-s-public-ip-address)
1. ### APACHE
    * on installe Apache2, avant tout vérifier si apache n'est pas déja installé et quelle version 'apache -v'
    ```
            sudo apt update &&apt upgarde
            sudo apt install apache2
    ```
    * après quoi vous aurez paramétrer le fichier /etc/apache2/apache2.conf pour ajouter une VARIABLE GLOBLAE ServerName votre_domaine_ouvotre_Addr_Ip_Local
    (localhost ou 127...)
    ```
        sudo apache2ctl configtest
    
        Output
        AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
    ```
    * rester la commande et normalement vous aurez "Syntax ok"
    ```
        sudo apache2ctl configtest
        
        Output
        Syntax OK
    ```
    * REDEMARRER LE SERVICE APACHE
    ```
        sudo systemctl restart apache2
    ```
    * on va s'occuper du FIREWALL qui doit etre en HTTP/HTTPS sur les port 80/443tcp si 'Apahe Full' s'affiche dans la sortie
    ```
            sudo ufw app list
        
        Output
        Available applications:
          Apache
          Apache Full
          Apache Secure
          OpenSSH
       
    ```
    * on vérifie les infox de Apache full lequel on allouer le flux
    ```
        sudo ufw app info "Apache Full"
        
        Output
        Profile: Apache Full
        Title: Web Server (HTTP,HTTPS)
        Description: Apache v2 is the next generation of the omnipresent Apache web
        server.
        
        Ports:
          80,443/tcp
          
        
        sudo ufw allow in "Apache Full"
    ```      
    * maintenant on peut aller voir dans le navigateur via l'addr_ip/nom_domaine_primaire que la pache de présentation de apache s'affiche bien
    

2. ### MYSQL
  * installation sans 'update' car on vient de le faire mais n'a pas d'impacte
      ```
         sudo apt install mysql-server
      ```
  * installation des test de sécurité: création de login/mp désactiver/activé control par mp, création de profil de connection
    ```
        sudo mysql_secure_installation
    ```

3. ### PHP
    > installation automatique de la dernière version de php (dans mon ca php 7.x)
    
    * on va installer les module dépendant de la librairie apache et mysql dont php a besoin en meme 
        ```
          sudo apt install php libapache2-mod-php php-mcrypt php-mysql
        ```
    
    * on va faire une petite manipulation dans le fichier "/etc/apache2/mods-enabled/dir.conf" pour éviter que lorsque Apache se connecte au serveur il renvois d"abord un index.html et non un index.php. On va intervertir l'ordre des appel afin que "index.php" soit en premier au lieu de index.html
    ```
        <IfModule mod_dir.c>
            DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
        </IfModule>
    ```
    * on restart "sudo systemctl restart apache2"
    
VOIR LES AUTRES INSTALLATIONS DE MODULES [ICI](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04#step-3-install-php)

4. ### PHPMYADMIN
    > [REF: install phpMyAadmin 4.6.4](https://websetnet.com/install-phpmyadmin-4-6-4-ubuntu-16-0416-10-systems/) : 
Install phpMyAdmin 4.6.4 on Ubuntu 16.10, Ubuntu 16.04, Ubuntu 15.04, Ubuntu 14.04, Ubuntu 15.10, Ubuntu 15.04, Ubuntu 14.10 and other 

   * Faire un UPDATE avant tout et Lancer la commande d'installation du package
        ```
            sudo apt upgrade
            sudo apt install phpmyadmin
        ```
   * Si le dossier n'est pas trouvé (http://localhost/phpmyadmin) et qu’aucun lien vers phpmyadmin n’existe dans /var/www/html/’:
       ```
        sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
       ```
   * relancer les serviceS
        ```
        sudo service apache2 restart
        ```
   * A la première connexion à l'interface de [phpMyAdmin](http://localhost/phpmyadmin) on vous propose de choisir la langue et d'entrer les identifiant (login et password que vous avez défini au paravant).
   
----
## GIT 
1. installation rapide
    ```
       apt install git-all
    ```
   
   * installation manuel [ICI](https://git-scm.com/book/fr/v1/D%C3%A9marrage-rapide-Installation-de-Git)

2. paramètre IGNORE
    * il y a plusieurs méthodes pour ignorer desfhicier mais pour la config GOBAL il faut (préférable pour ignorer les dossier des IDE->exemple):
        ```
             mkdir ~/.config/git/
             touch ~/.config/git/ignore
             git config --global core.excludesfile ~/.config/git/ignore
        ```
         Cela va créer un fichier de configuration vide (.igonre ) que l'on va remplir avec [CE GIST](https://gist.github.com/octocat/9257657) qui est déjà assez complet.
    *On peut vérifier ou se trouve ce fichier igonre:
        ```
            cat ~/.gitconfig | grep excludesfile
            
            output
              excludesfile = ~/.config/git/ignore
        ```
         



----

## SASS
> installation de SASS par RBENV et non APT car cela créer une error au lancement du sass parfois
   [sass page ](http://sass-lang.com/install) et
   1. ### RBENV
        * Ruby installation [rbenv](https://github.com/rbenv/ruby-build)
            ```
                rbenv install 2.2.0
            ```
   2. ### GEM SASS
        ```
            sudo gem install sass
        ```
                
---