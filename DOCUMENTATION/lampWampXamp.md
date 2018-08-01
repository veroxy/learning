# lamp wamp xamp - Linux, Apache, MySQL, PHP

## sur linux/unix
lors de l'installation de lampp ou Xampp error
préférer un installation manuelle de
- Apache2
- mysql
- php
- phpmyadmin

## ERREURES RECURENTES:
- dans mon bashrc :
```shell
# LAMP/XAMP PHPMYADMIN
# LAMP SERVER
# start
alias lamppinit="sudo /etc/init.d/apache2 stop | sudo /opt/lampp/lampp stop | sudo /etc/init.d/mysql stop"
alias lamppstart="sudo /opt/lampp/lampp start"
alias lamprestart="sudo /opt/lampp/lampp restart"
alias lampstop="sudo /opt/lampp/lampp stop"

# MYSQL BDD and PHP SERVER
alias mysqlstart="sudo /opt/lampp/bin/mysql"

# si lamp n'est pas lancé
startLamppMysql(){ 
	lamppinit
	lamppstart
	mysqlstart $1
}

alias startLamppMysql=startLamppMysql

```
On peut voir que:
- `lamppinit` STOP TOUS MES SERVICES qui concerne la BDD :
    - apache2
    - lampp
    - mysql
- `lamppstart` démarre uniquement lampp
- `mysqlstart` redémarre mysql

J'effectue toutes ces procédures en appelant les alias que j'ai créés dans une fonction `startLamppMysql()` que je stock dans un alias du même nom
Ainsi il n'y pas de confli

## [MP ROOT de MYSQL PERDU](https://www.commentcamarche.com/faq/9773-mysql-changer-le-mot-de-passe-root)

1. arrêter le serveur MySQL
    ```shell
    /etc/init.d/mysql stop
    ```
2. Redémarrer MySQL en passant outre l'identification et en désactivant l'écoute du réseau (afin d'éviter d'être piraté à ce moment donné où MySQL est vulnérable
     ```shell
    mysqld --skip-grant-tables --skip-networking &
    ```
3. Réinitialiser le mot de passe
    ```shell
    mysql mysql -u root
    ```
    