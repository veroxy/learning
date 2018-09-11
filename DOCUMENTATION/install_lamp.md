# XAMP for LINUX

----

### lamp lancer
```shell
sudo /opt/lampp/lampp start
sudo /opt/lampp/manager-linux-x64.run
```

###vérifier les APACHE et SQL lancés
```shell

ps aux | grep apache2  
ps aux | grep mysql
```

### arrêter tout Apache2
>return Stopping apache2 (via systemctl): apache2.service.
```
sudo /etc/init.d/apache2 stop
sudo /opt/lampp/manager-linux-x64.run stop
sudo /opt/lampp/lampp stop
```


### HARD STOP mysql
```
sudo /etc/init.d/mysql stop                                                                  
[sudo] Mot de passe de vmllmv :
[ ok ] Stopping mysql (via systemctl): mysql.service.
```

----

## ZSHRC / BACHRC alias
avant de lancer mon lampp faire un HARD STOP
```shell
$ lamppinit
```
lancer ou un redémarage des services
```shell
$ lamppstart
$ lampprestart
```
arrêter
```shell
$ lamppstop
```


----
[HOW TO digital ocean](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04)
[forum UBUNTU FR](https://forum.ubuntu-fr.org/viewtopic.php?id=1990066)

# UBUNTU 18.04

sudo apt update
**RETURN :**
> Réception de:18 http://security.ubuntu.com/ubuntu bionic-security/multiverse Translation-en [996 B]
  Réception de:19 http://fr.archive.ubuntu.com/ubuntu bionic/universe DEP-11 48x48 Icons [2 151 kB]
  66% [19 icons-48x48 2 075 kB/2 151 kB 96%]   
  
sudo apt install apache2 apache2-doc cd
**RETURN :**
>progression : [ 85%] [#####################.....................................]  
Paramétrage de apache2 (2.4.29-1ubuntu4.2) ...####################.....................................]  
Installation de la nouvelle version du fichier de configuration /etc/apache2/apache2.conf ...
Installation de la nouvelle version du fichier de configuration /etc/apache2/envvars ...
Installation de la nouvelle version du fichier de configuration /etc/apache2/mods-available/deflate.conf ...
Installation de la nouvelle version du fichier de configuration /etc/apache2/mods-available/mime.conf ...
Installation de la nouvelle version du fichier de configuration /etc/apache2/mods-available/proxy_html.load ...
Installation de la nouvelle version du fichier de configuration /etc/apache2/mods-available/userdir.conf ...
Installation de la nouvelle version du fichier de configuration /etc/init.d/apache-htcacheclean ...
Installation de la nouvelle version du fichier de configuration /etc/init.d/apache2 ...
Installation de la nouvelle version du fichier de configuration /etc/logrotate.d/apache2 ... 
   
>Enabling module reqtimeout.####################.....................................]  
Created symlink /etc/systemd/system/multi-user.target.wants/apache2.service → /lib/systemd/system/apache2.service.
Created symlink /etc/systemd/system/multi-user.target.wants/apache-htcacheclean.service → /lib/systemd/system/apache-htcacheclean.service.     

>Traitement des actions différées (« triggers ») pour libc-bin (2.27-3ubuntu1) ...####################.....................................]   
Traitement des actions différées (« triggers ») pour ureadahead (0.100.0-20) ...
Traitement des actions différées (« triggers ») pour systemd (237-3ubuntu10.2) ..

- s'assurer que le parfeu est désactiver
- que le parfeu admet le HTTP & le HTTPS

sudo ufw app list  
**RETURN : les ports desactives**
> Applications disponibles :
  - Apache
  - Apache Full
  - Apache Secure
  - CUPS
  - Samba
 ```shell
 
sudo ufw app info "Apache Full"
```
**RETURN : les ports desactives**
> Profil : « Apache Full »  
Titre : Web Server (HTTP,HTTPS)
Description : Apache v2 is the next generation of the omnipresent Apache 
web server.     
Ports :
  80,443/tcp

on essaie les accès aux HTTP & HTTPS
```shell
sudo ufw allow in "Apache Full"
```
ifconfig | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'



> Les règles ont été mises à jour
  Les règles ont été mises à jour (IPv6)
```shell
sudo apt install mysql-server
```

**ERROR :**  
>Paramétrage de mysql-server-5.7 (5.7.23-0ubuntu0.18.04.1) ...####################.....................................]
Installation de la nouvelle version du fichier de configuration /etc/mysql/mysql.conf.d/mysqld.cnf ...

>debconf: Impossible d'initialiser l'interface : Dialog####################.....................................]
debconf: (L'interface dialog a besoin d'un écran d'au moins 13 lignes sur 31 colonnes.)
debconf: Utilisation de l'interface Readline en remplacement
update-alternatives: utilisation de « /etc/mysql/mysql.cnf » pour fournir « /etc/mysql/my.cnf » (my.cnf) en mode automatique
ERROR: Unable to start MySQL server:
mysqld: [Warning] World-writable config file '/etc/mysql/conf.d/mysql.cnf' is ignored.
mysqld: [Warning] World-writable config file '/etc/mysql/conf.d/mysqldump.cnf' is ignored.
mysqld: [Warning] World-writable config file '/etc/mysql/mysql.conf.d/mysqld.cnf' is ignored.
mysqld: [Warning] World-writable config file '/etc/mysql/mysql.conf.d/mysqld_safe_syslog.cnf' is ignored.
mysqld: Can't read dir of '/opt/lampp/etc/my.cnf' (Errcode: 2 - No such file or directory)
mysqld: [ERROR] Fatal error in defaults handling. Program aborted!
Please take a look at https://wiki.debian.org/Teams/MySQL/FAQ for tips on fixing common upgrade issues.
Once the problem is resolved, run apt-get --fix-broken install to retry.
dpkg: erreur de traitement du paquet mysql-server-5.7 (--configure) :
 installed mysql-server-5.7 package post-installation script subprocess returned error exit status 1
E: Sub-process /usr/bin/dpkg returned an error code (1)

**FIXEB BY : (NE PAS REPONDRE OUI POUR LA SUPPRESSION DES BDD)**

```shell
sudo apt-get remove --purge mysql-\*
```

On refait la cmd `sudo apt install mysql-server`
**RETURN :**
>Progression : [ 74%] [####################.....................................]  
Paramétrage de mysql-client-5.7 (5.7.23-0ubuntu0.18.04.1) ...####################.....................................]  

>Progression : [ 81%] [####################.....................................]  
Paramétrage de mysql-server-5.7 (5.7.23-0ubuntu0.18.04.1) ...####################.....................................]   

>update-alternatives: utilisation de « /etc/mysql/mysql.cnf » pour fournir « /etc/mysql/my.cnf » (my.cnf) en mode automatique####################.....................................]   
Renaming removed key_buffer and myisam-recover options (if present)
Checking if update is needed.
Checking server version.
Running queries to upgrade MySQL server.
Checking system database.
mysql.columns_priv                                 OK
mysql.db                                           OK
mysql.engine_cost                                  OK
mysql.event                                        OK
mysql.func                                         OK
mysql.general_log                                  OK
mysql.gtid_executed                                OK
mysql.help_category                                OK
mysql.help_keyword                                 OK
mysql.help_relation                                OK
mysql.help_topic                                   OK
mysql.innodb_index_stats                           OK
mysql.innodb_table_stats                           OK
mysql.ndb_binlog_index                             OK
mysql.plugin                                       OK
mysql.proc                                         OK
mysql.procs_priv                                   OK
mysql.proxies_priv                                 OK
mysql.server_cost                                  OK
mysql.servers                                      OK
mysql.slave_master_info                            OK
mysql.slave_relay_log_info                         OK
mysql.slave_worker_info                            OK
mysql.slow_log                                     OK
mysql.tables_priv                                  OK
mysql.time_zone                                    OK
mysql.time_zone_leap_second                        OK
mysql.time_zone_name                               OK
mysql.time_zone_transition                         OK
mysql.time_zone_transition_type                    OK
mysql.user                                         OK
The sys schema is already up to date (version 1.5.1).
Checking databases.
sys.sys_config                                     OK
Upgrade process completed successfully.
Checking if update is needed.
Created symlink /etc/systemd/system/multi-user.target.wants/mysql.service → /lib/systemd/system/mysql.service.

>Paramétrage de mysql-server (5.7.23-0ubuntu0.18.04.1) ...####################.....................................]   

>Progression : [ 94%] [####################.....................................]  
Traitement des actions différées (« triggers ») pour ureadahead (0.100.0-20) ...####################.....................................]  
Traitement des actions différées (« triggers ») pour systemd (237-3ubuntu10.2) .
```shell
mysql -u root -p
```
>Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)

## Ubuntu 18.04 **ERROR FIXED**
> Dans Ubuntu 18.04  `mysql_secure_installation` ne fonction pas avec un ou non SUDO donc pas la peine de s'obstiner!!
D'une par on stop MYSQL et va créer un fichier **mysqld** temps que l'on va utiliser car lui non plus n'existe pas --'
- [ref 1](https://linuxconfig.org/how-to-reset-root-mysql-password-on-ubuntu-18-04-bionic-beaver-linux)
- [ref 2 EXPLAINS](http://blog.room34.com/archives/6197)
- [ref 3](https://blog.t-brieskorn.de/mysql-root-passwort-ubuntu-18/)
- [ref 4 explains & repo](https://gist.github.com/mkdizajn/5883302)

```shell
sudo service mysql stop
sudo mkdir -p /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld
```
On donne les droits sur mysqld à mysql via `chown` [(change owner)](https://doc.ubuntu-fr.org/tutoriel/console_ligne_de_commande#chown)
puis on  _Because you are not checking user privs at this point, it's safest to disable networking. In Dapper, /usr/bin/mysgld... did not work. However, mysqld --skip-grant-tables did._
```shell
sudo /usr/sbin/mysqld --skip-grant-tables --skip-networking &
```

On regarde les taches en cours :
```shell
jobs
```
> [1]+  En cours d'exécution   sudo /usr/sbin/mysqld --skip-grant-tables --skip-networking &


```shell
mysql -u root
enter root password:
```

```sql	
FLUSH PRIVILEGES;
USE mysql;
UPDATE user SET authentication_string=PASSWORD("monFuckinMp") WHERE User='root';
UPDATE user SET plugin="mysql_native_password" WHERE User='root';
QUIT
```

on arrête mysqld
```shell
sudo pkill mysqld
sudo service mysql start
```
>[1]+  Fini                    sudo /usr/sbin/mysqld --skip-grant-tables --skip-networking

on retante une connexion
```shell
mysql -u root -p
``
```sql
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```

Après tout ça on peut enfin reprendre où ça avait plante:` mysql_secure_installation` [**ATTENTION**](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04) maintenant il est important de lire les instruction concernant ce mot de passe lors de cette commande

on va modifier l'ordre de lecture des fichier en mettant en premier les fichier '.php'
```
sudo vim /etc/apache2/mods-enabled/dir.conf
sudo apt install php libapache2-mod-php php-mysql
sudo apt install php-cli
sudo service apache2 restart
```
**ERROR**
>Job for apache2.service failed because the control process exited with error code.
See "systemctl status apache2.service" and "journalctl -xe" for details.
sudo apachectl configtest
apache2: Syntax error on line 146 of /etc/apache2/apache2.conf: Syntax error on line 2 of /etc/apache2/mods-enabled/php7.0.load: Cannot load /usr/lib/apache2/modules/libphp7.0.so into server: /usr/lib/apache2/modules/libphp7.0.so: cannot open shared object file: No such file or directory
Action 'configtest' failed.
The Apache error log may have more information.
**FIXED BY**
sudo a2dismod php7.0
> Module php7.0 disabled.
 To activate the new configuration, you need to run:
   systemctl restart apache2
   
   
```
sysStemctl restart apache2
```

creation du fichier info.php
```
sudo vim info.php
```
```php
<?php
phpinfo();
?>
```
```
sudo chown www-data:www-data /var/www/html/info.php
```

### créer un dossier de projet ailleur (lien symbolique)
> pour pouvoir accéder directment au dossier de projet qui est par exemple dans ` ~/Documents/testLienDest/` il faut créer un lien symbbolique    
cdtr une une connection ENTRE le DOSSIER_DESTINATION (le dossier que lon veut avoir dans) et le DOSSIER_DORIGINE (celui qui du quel on accède au lien)

ici c'est le `testLisenDest` qui est notre cible et l'origine dans lequel son ALIAS va être stocké est `srcLn`
```
/var/www/html$ sudo ln -s ~/Documents/testLienDest/ srcLn/
```
**/!\ ATTENTION** dans le dossier  `html` on peut écrire qu'en SUPER USER

on peut créer un dossier dédier avec des droits en lui donnant l'accès avec la cmd 
```
sudo chown www-data:www-data /var/www/[nom du dossier]
```

### installer phpmyadmin
> `sudo apt-get install phpmyadmin` et donner le mot de passe root de MySQL et choigissez un mot de passe Root pour phpmyadmin durant l’installlation.
 N’oubliez pas de cocher la case « apache2 »durant l’installation avec la **touche ESPACE** du clavier (si vous faites « entrer » ça ne cochera pas apache et passera à l’étape suivante). Si vous avez fait « entrer » (comme moi au début, forcément), vous pouvez rattraper la boulette avec un `sudo dpkg-reconfigure phpmyadmin`.
 
 editer le fichier 
 ```
 sudo nano my.cnf
 
 #
# The MySQL database server configuration file.
#
# You can copy this to one of:
# - "/etc/mysql/my.cnf" to set global options,
# - "~/.my.cnf" to set user-specific options.
# 
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

#
# * IMPORTANT: Additional settings that can override those from this file!
#   The files must end with '.cnf', otherwise they'll be ignored.
#
# Mettre la langue en Français
language = /usr/share/mysql/french
# Taille du cache des index
key_buffer = 32M
# Limite du cache par requête
query_cache_limit = 2M
# Limite du cache pour toutes les requêtes
query_cache_size = 32M
# Loguer les requêtes lentes
log_slow_queries = /var/log/mysql/mysql-slow.log
# Indique le temps à partir du moment ou une requête est considéré comme lente
long_query_time = 2
# Activer l'utf-8 par default sur le serveur (dans [mysqld])
default-character-set = utf8
default-collation = utf8_general_ci
# dans [client]
default-character-set = utf8

!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mysql.conf.d/
```
