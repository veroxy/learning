### SSH
On gènère une nouvelle clef avec une passphrase et un mp

- rsa : type de chiffrement
- \>= 4096: taille de la clef
ssh-keygen -t rsa -b 4096 -C"HOC-key-veroxy"
    
    
    
    +---[RSA 9827]----+
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
 scp id_rsa.pub root@131.105.80.170:/root/
 ~~~
 
    The authenticity of host '131.105.80.170 (131.105.80.170)' can't be established.
    ECDSA key fingerprint is SHA256:oV2aEtkoFbmVZjhK81KiqzORJlobcNy7OQcFQtjKLyk.
    Are you sure you want to continue connecting (yes/no)? y
    Please type 'yes' or 'no': yes
    Warning: Permanently added '131.105.80.170' (ECDSA) to the list of known hosts.
    root@131.105.80.170's password:
    Permission denied, please try again.
    root@131.105.80.170's password:
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
echo "server-hoc ansible_ssh_host=131.105.80.170" > hosts
~~~

on lance ensuite une commande ansible pour récupérer le `setup` de la machine
~~~shell
ansible -uroot -i inventory/hosts server-hoc -m setup
~~~
