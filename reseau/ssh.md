### SSH
On gènère une nouvelle clef avec une passphrase et un mp

- rsa : type de chiffrement
- \>= 4096: taille de la clef
ssh-keygen -t rsa -b 4096 -C"HOC-key-veroxy"
    
    
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/veroxy/.ssh/id_rsa):
    Created directory '/home/veroxy/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/veroxy/.ssh/id_rsa.
    Your public key has been saved in /home/veroxy/.ssh/id_rsa.pub.
    The key fingerprint is:
    SHA256:/EptpozTdvZKQNutSln+mMX8VsYj65qqdMb1NLOb/uo HOC-key-veroxy
    The key's randomart image is:
    +---[RSA 4096]----+
    |                 |
    |                 |
    |        .        |
    |       o o .     |
    |        S o..+ . |
    |        .B.+o.+.+|
    |       o++O +ooo.|
    |      o==Bo=.o+  |
    |      .+*+==BE+. |
    +----[SHA256]-----+

On copie le fichier de la public_key sur le serveur dans le répertoire `/root/` pour la stocker
 ~~~shell
 scp id_rsa.pub root@158.177.99.180:/root/
 ~~~
 
    The authenticity of host '158.177.99.180 (158.177.99.180)' can't be established.
    ECDSA key fingerprint is SHA256:oV2aEtkoFbmVZjhK81KiqzORJlobcNy7OQcFQtjKLyk.
    Are you sure you want to continue connecting (yes/no)? y
    Please type 'yes' or 'no': yes
    Warning: Permanently added '158.177.99.180' (ECDSA) to the list of known hosts.
    root@158.177.99.180's password:
    Permission denied, please try again.
    root@158.177.99.180's password:
    id_rsa.pub                                                                            100%  740    33.7KB/s   00:00


Ensuite on se connect au serveur pour créer un dossier `.ssh/` dans root qui aura les un `chmod 700` et on ou `mv  id_rsa.pub .ssh/:`


### ANSIBLE

Pour acceder au bureau local (windows) on peut lancer `mount` pour voir tout le montage du sysrtem de la vm il retourne le dossier dans lequel il stock le **disque C:** de windows
> C: on /mnt/c type drvfs (rw,noatime,uid=1000,gid=1000)

on a créer un dossier **ansible/** dans 
~~~shell
veroxy@99MFO-HOC00005:/mnt/c/wamp/www/vagrant/httpdoc/ansible$
~~~
dans celui ci on un fichier **hosts** dans un dossier **inventory/** dans lequel on echo 
~~~shell
echo "server-hoc ansible_ssh_host=158.177.99.180" > hosts
~~~

on lance ensuite une commande ansible pour récupérer le `setup` de la machine
~~~shell
ansible -uroot -i inventory/hosts server-hoc -m setup
~~~
