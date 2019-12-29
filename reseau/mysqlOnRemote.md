## requies[/install-lamp-stack-debian-9-stretch](https://tecadmin.net/install-lamp-stack-debian-9-stretch/)
de l'etape 1 à l'étape 2:

```shell
ssh root@debian9
sudo apt-get update
sudo apt-get upgrade
sudo apt install ca-certificates apt-transport-https
#apache2
sudo apt-get install apache2

````

## [mysql PPA Official au lieu de MariaDb](https://tecadmin.net/install-mysql-server-on-debian9-stretch/) v 5.7 en 2019
étape 1 à 4
```shell
sudo apt update 
sudo apt upgrade
wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
sudo apt update 
sudo apt install mysql-server

````
## [install mysql-server](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-remote-database-to-optimize-site-performance-with-mysql-on-ubuntu-16-04)
```shell
systemctl status mysql
sudo systemctl restart mysql
sudo mysql_secure_installation
````
avant de redémarer mysql
## [mysql_secure_installation](https://planet.mysql.com/entry/?id=5991189) pour avoir un mp validé et sucurisé 
étape de 1 à 3 si l'on ne vex pas tester mais très interssant

```shell
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf

#VIM
# db_server_ip peu être l'adresse privée du serveur  - c'est le paramètre qui demande sur quelle adresse IP doit écouter MYSQL (privé/public)
bind-address = db_server_ip
# on rajoute un paramètre pour ne pas se faire sniffer
require_secure_transport = on
# el'on génère une clef et un certificat SSL pour les connexion sécutisé (allow 443/https) et il créera le --uid=mysql
sudo mysql_ssl_rsa_setup --uid=mysql

````
c'est seulement à ce moment que l'on redémrarre sql


