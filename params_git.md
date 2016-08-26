
SSH pour Git sur Github && Bitbucket
==

### Edition du fichier .git/config #
Pour pouvoir faire du verionning sur deux repo différents il faut paramétrer le fichier de configuration de git. comme suit: <br />
On commence par paramétrer un fetch de base
puis deux url, un pour github et un pour bitbucket <br/>
<p>
<strong> EXEMPLE:</strong><br/>
[remote "origin"]<br/>
	fetch = +refs/heads/*:refs/remotes/origin/*<br/>
	url = git@github.com:User_Name/simplon.git<br/>
	url = git@bitbucket.org:User_Name/simplon.git<br/>
</p>
<p>[branch "master"]<br/>
	remote = origin<br/>
	merge = refs/heads/master<br/>
</p>
---
### clef SSH #
Il est possible d'assigner une clef SSH à un seul repo (Github ou Bitbucket) mais il n'est pas possible d'assigne rune même clef à des repo différents que ce soit sur un même serveur(ex : bitbucket > monprojet1 & bitbucket > monprojet2) ou deux serveurs différents. <br />
Il est possible de donner les droits via les settings du profil et aussi éviter de rentrer une passphrase à chaque fois.
La méthode qui suit n'est pas l'unique solution.

### créer une clef SSH pour le dossier local et le distant#
Pour pouvoir communiquer entre le depo local et le dépot distant il est nécessaire de générer un une CLEF SSH. Bien être à la racine de l'ordinateur(là où il y a les dossiers utilisateurs)
pour cela suivre lire le tuto pour crer votre binome de clefs
<a http://www.linux-france.org/prj/edu/archinet/systeme/ch13s03.html ><strong>ici</strong></a><br />

Lorsque que l'on a la clef id_rsa.pub de générée copier la. <br />
###### Bitbucket #
Aller dans l'onglet profil et cliquer sur "Bitbucket  settings" sur les paramètres de sécurité et "clef ssh" <br />
Ajouter une clef. <br />
<strong>motif du chemin :  https://bitbucket.org/account/user/User_Name/ssh-keys/  </strong> <br />

###### Github #
Dans le bouton profil atteindre "Settings" <br />
Ajouter une clef "new ssh key".
<strong>motif du chemin :
https://github.com/settings/keys</strong>

voilà c'est tout le reste c'est comme d'hab: <br />
add/commit/push
