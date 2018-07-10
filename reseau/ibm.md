<<<<<<< HEAD
- DMZ <> FIREWALLL
   le dmz est exposé publiquement > c'est unemachine interne. ILes communications avec le firewall pour eviteer d'exposé.

- Cloud
    - On abstrait: sisole du/services.
au lieu d'avoir du materiel > on va le mettre en réseau de façon virtuel 
    - stockage de données (dropbox, google drive)
    
----
1. ### IBM CLOUD
catalog > virtual server (0,038€)
- CDN c'est des serveur de caches (tps de rep client). Être dans le serveur de proximité du client au niveau INTERNATONALE
- bande passante est la chose la plus cher
    - avantage du cloud : on peu gérer ponctuellement la bande passante (ft events), si on sait que l'on aura beaucoup d'audience sur une periode on peut variabiliser ce derner contrairement un serveur dédier qui lui possède une bande passante fixe.
    
    
2. ### CONNEXION SSH HOC

sh root@158.177.99.180
=======
- DMZ <> FIREWALLL
   le dmz est exposé publiquement > c'est unemachine interne. ILes communications avec le firewall pour eviteer d'exposé.

- Cloud
    - On abstrait: sisole du/services.
au lieu d'avoir du materiel > on va le mettre en réseau de façon virtuel 
    - stockage de données (dropbox, google drive)
    
----
1. ### IBM CLOUD
catalog > virtual server (0,038€)
- CDN c'est des serveur de caches (tps de rep client). Être dans le serveur de proximité du client au niveau INTERNATONALE
- bande passante est la chose la plus cher
    - avantage du cloud : on peu gérer ponctuellement la bande passante (ft events), si on sait que l'on aura beaucoup d'audience sur une periode on peut variabiliser ce derner contrairement un serveur dédier qui lui possède une bande passante fixe.
    
    
2. ### CONNEXION SSH HOC
~~~shell
ssh + username + vers + adresse IP public
~~~
ssh root@158.X.X.X +  mp

PHP + nginx
~~~
apt update && apt upgrade
apt search php7-
apt intall php7.0-fpm nginx
~~~

MYSQL-SERVER
~~~
apt update && apt upgrade
apt search mysql-server
apt intall mysql-server
~~~

> mariadB est installée

### service --status-all
voir tous les services en route

`service *nom_service* status`


### dpkg -l
permet de voir (lister) ce qui intsallé et nonn les dépendances non installés / ou non


### nestat
~~~
root@hoc:~# apt install net-tools
~~~
permet d'avoir les différents ports
~~~
root@hoc:~# netstat -lapute
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       User       Inode      PID/Program name
tcp        0      0 0.0.0.0:ssh             0.0.0.0:*               LISTEN      root       14536      1209/sshd
tcp        0      0 localhost.localdo:mysql 0.0.0.0:*               LISTEN      mysql      44084      22248/mysqld
tcp        0      0 0.0.0.0:http            0.0.0.0:*               LISTEN      root       46772      23267/nginx: master
tcp        0    356 hoc.CCI-Auvergne-Rh:ssh reverse.completel:57575 ESTABLISHED root       25046      9413/sshd: root@pts
tcp        0      0 10.85.217.202:34874     10.0.77.54:http         TIME_WAIT   root       0          -
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      root       14545      1209/sshd
tcp6       0      0 [::]:http               [::]:*                  LISTEN      root       46773      23267/nginx: master
~~~

**lapute : **

   - l :
   - all :
   - program :
   -
    
~~~
root@hoc:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 06:2f:79:6e:e5:ae brd ff:ff:ff:ff:ff:ff
    inet 10.85.217.202/26 brd 10.85.217.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::42f:79ff:fe6e:e5ae/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 06:50:26:63:89:87 brd ff:ff:ff:ff:ff:ff
    inet 158.177.99.180/28 brd 158.177.99.191 scope global eth1
    inet 158.177.99.180/28 brd 158.177.99.191 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::450:26ff:fe63:8987/64 scope link
       valid_lft forever preferred_lft forever
~~~~


- On creer un nouveau repertoir soit dans /srv/mon_dossier_enligne soit dans /var/www./mon_dossier_enligne

- on cré un fichier index.php avec qui contientt <?php php_info();?>


- Dans le dossier de /etc/nginx/conf.d/ on créer un nouveau fichier mon_dossier_enligne.conf (/etc/nginx/conf.d/ public_html.conf)
~~~
root@hoc:/var/www/public# cat /etc/nginx/conf.d/public_html.conf
server{
        listen 158.177.99.180:80;

        server_name my.amazing-website.com;
        root /var/www/public;

        index index.php;
        location / {
                try_files $uri /index.php$is_args$args;
        }

        location ~ \.php$ {
                fastcgi_index index.php;
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        }

}
~~~

    - `server_name` > est le vers lquel va pointer l'adresse
    - `root` de poiinter vers le dossier local où se trouve la racine du site
    
>>>>>>> 8322760128bc56df74c3538439ae98006d4add24
