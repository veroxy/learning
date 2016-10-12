# SHELL SCRIPT
.ZSHRC & .BASHRC
----
sont les fichers de paramètre du system Bash / Zsh == shell script

# ALIAS
On peut stocker les différents alias des commandes shell
```
#!/bin/sh
 cd ~/Documents/
 mkdir TEST

```

# FONCTIONS & VARIABLES
ces deux fichiers peuvent aussi stocker des fonctions et des variables.
 * je peux déclarer une variable que l'on appelera dans la sortie standard `$nom_variable`
```
#!/bin/sh
# dans mon fichier info.sh

prenom="Morgane"
nom="Senryu"

# sortie standard
$ echo "Bonjour je m'appel $prenom $nom"
```
