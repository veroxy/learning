# .ZSHRC & .BASHRC

----
### CUSTOM SH
sont les fichers de paramètre du system Bash / Zsh == shell script. Ce sont les premiers scirpts que l'on modifie en général lorsque l'on est sous linux/mac.

### ALIAS
On peut stocker les différents alias des commandes shell
~~~shell
#!/bin/sh
 cd ~/Documents/
 mkdir TEST

~~~

### FONCTIONS & VARIABLES
ces deux fichiers peuvent aussi stocker des fonctions et des variables.
 * je peux déclarer une variable que l'on appelera dans la sortie standard `$nom_variable`
~~~shell
  #!/bin/sh
  dans mon fichier info.sh qui se trouve dans ce répertoire
  prenom="Morgane"
  nom="Senryu"
  echo "Bonjour je m'appel $prenom $nom"
~~~

* sortie standard
~~~
 je m'appelle moragne Senryu
~~~
