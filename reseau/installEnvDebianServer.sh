#!/bin/sh

# REINSTALLER LE SERVEUR

# <https://justincoutarel.fr/2014/04/installation-dubuntu-14-04-lts-beta-64-bits-sur-un-serveur-kimsufi/


# TELECHARGER .vimrc
# To copy from the remote machine the "-p" flag preserved the file modification and access times.
# du remote vers le local {REMOTE > LOCAL}
# scp root@5.135.152.20:.vimrc ~/
scp -p remotemachine:/myfiles/myfile.txt x

# To copy to the remote machine: 
# du local vers le remote {LOCAL > REMOTE}
scp -p ~/.vimrc root@x.x.x.x:~/
# UPDATE AND UPDGRADE

apt-get update && apt-get upgrade
apt-get update && apt-get install vim

#
# sudo (su) command
apt-get install sudo
# root password
passwd root


# username [@] servername
# root@debianserver, andurill@debianserver
# ici il y a donc 2 utilisateurs sur le server debianserver
addUserServer(){
# ajouter un utilisateur
server=$1
adduser $server root
adduser $server adm
adduser $server dev
adduser $server prod

# créer un group d'users
addgroup sshusers
# ajouter ce group user au nom du server
adduser $server sshusers


# Nous allons ensuite éditer la configuration du service SSH en modifiant le fichier « /etc/ssh/sshd_config ».
vim /etc/ssh/sshd_config

## Changer le port par défaut. Cela évite quelques attaques de bots sur le port 22.
# > Port 1012
# # Désactiver le login root. Très important
# > PermitRootLogin no
# # Nombre de tentatives pour la saisie du mot de passe
# > MaxAuthTries 3
# # Autoriser uniquement les utilisateurs du groupe SSH. Propriété à ajouter au fichier.
# # N’est pas présente par défaut.
# > AllowGroups sshusers
# > /etc/init.d/ssh restart
}
alias addveroxy=addUserVeroxy
systemctl restart ssh

#################################################
# https://blog.eleven-labs.com/fr/securiser-facilement-son-vps-en-quelques-etapes/
# PROTEGER DE MULTIPLE REQUETE DEPUIS UN IP
failBanRequest(){
    apt-get update && apt-get install fail2ban

    #Now, create /etc/fail2ban/jail.local with a text editor such as vim
    #paste
    #    [sshd]
    #    enabled = true
    #    banaction = iptables-multiport
    #
    cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.conf.backup

    echo "fail2ban was successfully installed, now restart run `vim /etc/fail2ban/jail.local` and restart service"
}
alias failBan=failBanRequest
vim /etc/fail2ban/jail.local

#Save the file contents and exit the text editor. Then, enable the Fail2ban service and start it up with:
# In the text editor, type in the following text:
# > systemctl enable fail2ban
systemctl restart fail2ban

#################################################
# VIM
# http://debian-facile.org/doc:editeurs:vim:vim
# 
#    La touche H pour vous déplacer vers la gauche.
#    La touche L pour vous déplacer vers la droite.
#    La touche J pour vous déplacer vers le bas.
#    La touche K pour vous déplacer vers le haut.
#    La touche G pour vous déplacer de page en page
#        G pour aller à la dernière ligne
#        gg pour aller à la première ligne
#        2g pour aller à la ligne n°2 ; 3g pour aller à la ligne n°3, etc,.
apt-get update && apt-get install vim
echo "voir une fois l'environnement installée lancer vimtutor"


# GIT appeler : gitInstall arg$1 $ard2
installGit(){
    apt-get -y install git
    git config --global user.name $1
        echo "username $1"
    git config --global user.email $2
        echo "useremail $2"
    git config --global core.editor vim
    git config --global merge.tool vimdiff
    echo "git is successfull installed - your name is $1 & your email $2"

}
alias gitInstall=installGit

installEnv(){
#    apt-get update && apt-get -y install git
    # RUBY
    apt-get update && apt-get -y install ruby

    # CURL
    apt-get update && apt-get install curl

    # NODE.js  Node.js 11.x and npm
    apt-get update && curl -sL https://deb.nodesource.com/setup_11.x | bash -
    apt-get update && apt-get install -y nodejs

    # YARN
    apt-get update && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
    apt-get update && apt-get install yarn

    apt-get install apache2 php mysql-server
    apt-get install phpmyadmin php-mbstring php-gettext
}
alias envInstall=insallEnv

# YARN
apt-get update && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn


# PHP MYADMIN
# https://www.rosehosting.com/blog/how-to-install-phpmyadmin-on-debian/
# 
#  When the prompt appears, “apache2” is highlighted, but not selected.
#  If you do not hit SPACE to select Apache, the installer will not move the necessary files during installation.
#  Hit SPACE, TAB, and then ENTER to select Apache.
apt-get install apache2 php mysql-server
apt-get install phpmyadmin php-mbstring php-gettext javascript-common
> xxx
echo '<?php phpinfo();' > /var/www/html/phpinfo.php
systemctl restart apache2

# plus de sécurité
apt-get update && apt-get -y install libapache2-mod-evasive
# apt-get update && apt-get -y install libapache2-mod-security2 #ubuntu
apt-get update && apt-get -y install libapache2-mod-security
a2enmod security2
apachectl -M | grep security

# si erreur
# apt-get update && apt-get -y install modsecurity-crs
a2enmod headers
a2enmod ssl
a2enmod rewrite
systemctl restart apache2
# apt-get update && apt-get -y install libapache2-mod-security2 ()

#Paquets suggérés :
#  www-browser apache2-doc apache2-suexec-pristine | apache2-suexec-custom
#  default-mysql-server | virtual-mysql-server file php-libsodium php-mcrypt php-gmp
#Paquets recommandés :
#  apache2 javascript-common libdbd-mysql-perl libdbi-perl libterm-readkey-perl apache2
#  | lighttpd | httpd php-curl php-gd php-bz2 php-zip php-tcpdf
#Les NOUVEAUX paquets suivants seront installés :
#  apache2-bin dbconfig-common dbconfig-mysql default-mysql-client libaio1
#  libapache2-mod-php7.0 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap
#  libconfig-inifiles-perl libjemalloc1 libjs-jquery libjs-sphinxdoc libjs-underscore
#  liblua5.2-0 libmagic-mgc libmagic1 libxslt1.1 mariadb-client-10.1
#  mariadb-client-core-10.1 mariadb-common mysql-common php php-common php-gettext
#  php-mbstring php-mysql php-pear php-php-gettext php-phpseclib php-xml php7.0
#  php7.0-cli php7.0-common php7.0-json php7.0-mbstring php7.0-mysql php7.0-opcache
#  php7.0-readline php7.0-xml phpmyadmin psmisc

# ERROR
# Cette erreur survient si l'on lance la commande "apt-get install phpmyadmin php-mbstring php-gettext"

# avant d'installer apache2
#                                                                        │
#      │ ERROR 2002 (HY000): Can't connect to local MySQL server through socket   │
#     │ '/var/run/mysqld/mysqld.sock' (2 "No such file or directory")            │
#      │                                                                          │
#      │ Vos possibilités sont:                                                   │
#      │  * abandonner - Provoque l'échec de l'opération; vous devrez revenir à   │
#      │    l'ancienne version, reinstaller, reconfigurer ce paquet, ou sinon     │
#      │    faites-le à la main, pour continuer à l'utiliser.                     │
#      │    Cela impacte le plus souvent la possibilité d'installer d'autres      │
#      │    paquets tant que l'échec de l'installation n'est pas résolu.          │
#      │  * réessayer - Pose à nouveau toutes les questions relatives à           │
#      │    l'installation (en incluant celles que vous pourriez avoir manqué     │
#      │    à cause du réglage de la priorité de debconf) et fait une nouvelle    │
#      │    tentative pour effectuer l'opération.                                 │
#      │  * réessayer (sans les questions) - Réessaye immédiatement l'opération   │
#      │    en ne posant pas les questions.                                       │
#      │    C'est en général utile si vous avez résolu le problème depuis que     │
#      │    l'erreur est apparue.                                                 │
#      │  * ignorer - Poursuit l'opération en ignorant les erreurs de             │
#      │    dbconfig-common. En général cela amène à un paquet sans base de       │
#      │    données fonctionnelle.


###
apt-get install ca-certificates apt-transport-https 
wget -q https://packages.sury.org/php/apt.gpg -O- |  apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list

# php5.6
# php7.1
apt-get update
apt-get install php7.1 php7.1-cli php7.1-common libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php7.1-gd php7.1-mcrypt php7.1-msgpack php7.1-memcached php7.1-intl php7.1-sqlite3 php7.1-gmp php7.1-geoip php7.1-mbstring php7.1-mysql php7.1-redis php7.1-xml php7.1-zip

# php7.2
apt-get update
apt-get install php7.2 php7.2-cli php7.2-common libapache2-mod-php7.2 php7.2-mysql php7.2-curl php7.2-json php7.2-gd php7.2-intl php7.2-sqlite3 php7.2-gmp php7.2-mbstring php7.2-mysql php7.2-xml php7.2-xml php7.2-zip

#MYSQL
#à la mise en root le mot de pass root est vide
#lors de la crétion de la bdd "phpmyadmin" un user "phpmyadmin" est en entré avec un mp
#lancer mysql > on tombre sur MariaDB

mysql

# on liste les utlisateur

#MariaDB [(none)]> select user,password,host from mysql.user;
#
#+------------+-------------------------------------------+-----------+
#
#| user       | password                                  | host      |
#
#+------------+-------------------------------------------+-----------+
#
#| root       |                                           | localhost |
#
#| phpmyadmin | *0BC43D3F05514128A22A7BFB6AE94DB9654FBDBF | localhost |
#
#+------------+-------------------------------------------+-----------+
#
#SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newpassword');
#RENAME USER 'phpmyadmin'@'localhost' TO 'veroxy'@'localhost';


# COMPOSER
# dans un fichier installerComposer.sh (> vim installerComposer.sh) ou dans une fonction de du .bashrc

installComposer(){
    EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
    php -r "copy('https://getcomposer.org/installer';, 'composer-setup.php');"
    ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
    if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
    then
        >&2 echo 'ERROR: Invalid installer signature'
        rm composer-setup.php
        exit 1
    fi
    php composer-setup.php --quiet
    RESULT=$?
    rm composer-setup.php:
    
    # déplacer le fichier excutabe dans /bin pour que composer soit en global
    mv composer.phar /usr/local/bin/composer 
}
alias composerInstaller=installerComposer # lancer l'alias dans le terminal 

# ATTENTION LORS DE LA MISE EN PROD faire 

composer install --no-dev # au lieu de [dev] composer install
# SASS

npm install -g sass
## BASHRC

Update_sys()
{

    apt-get -y update
    apt-get -y upgrade
    echo -e "Update.......\033[32mDone\033[00m"
    sleep 4
}
alias updatesys=Update_sys


todoAfterInstall(){
    echo "ajouter un user -- run addveroxy"
    echo "Paramétrer fail2ban,"
}
alias todo=todoAfterInstall

weed()
{
           '         .                          
                     M                          
                    dM                          
                    MMr                         
                   4MMML                  .     
                   MMMMM.                xf     
   .              "MMMMM               .MM-
    Mh..          +MMMMMM            .MMMM
    .MMM.         .MMMMML.          MMMMMh
     )MMMh.        MMMMMM         MMMMMMM
      3MMMMx.     .MMMMMMf      xnMMMMMM"
      "*MMMMM      MMMMMM.     nMMMMMMP"
        *MMMMMx    nMMMMM\    .MMMMMMM=
         *MMMMMh   "MMMMMn   JMMMMMMP
           MMMMMM   3MMMM.  dMMMMMM            .
            MMMMMM  "MMMM  .MMMMM(        .nnMP"
=..          *MMMMx  MMM"  dMMMM"    .nnMMMMM*
  "MMn...     "MMMMr MM   MMM   .nMMMMMMM*"
   "4MMMMnn..   *MMM  MM  MMP"  .dMMMMMMM""
     ^MMMMMMMMx.  *ML "M .M*  .MMMMMM**"
        *PMMMMMMhn. *x > M  .MMMM**""
           ""**MMMMhx/.h/ .=*"
                     .3P"%....
                  nP"     "*MMnx
          
                 SMOCK WEED, BE COOL'
}

