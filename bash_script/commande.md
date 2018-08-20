# REGEX // COMMANDES BASIQUES BASH/SHEL SCRIPT
[pays du 42 pour débuter](http://i.paysdu42.fr/?page=impatient-shell-debutant 'source); et toujours [l'ABS pour se perfectionner](http://abs.traduc.org/abs-fr/ch01.html 'souce)

----
> quand on ne sait pas on cherche. Si on a pas la réponse c'est qu'lon pas assez chercher !!

### fichiers / directory
- cd
> entrer sortir dans un répertoire/dossier (directory)

    * `cd` > seule revient au répertoire courant à la racine(~) utilisateur : homme/user_name   
    * `cd ../` >  selon le nombre couple "double point + slash" on remonte dans les répertoires, on sort
    * `cd -1` > est   

- pwd
> permet de voire où l'on ce situe dans l'ordinateur:  dans quel dossier.

- ls
> permet de lister les éléments de mon dossier
  * `ls` > lister simplement
  * `ls -l` > lister dans l'ordre de création [plus récent > plus vieux](timestamp)
  * `ls -a` > lister également les fichiers/dossier caché ( .bashrc, .vimrc, .ssh/, .git/ )
  * `ls -la` > on sait faire 1+1 = lister dans l'ordre
  * `ls -lRa` > lister le répertoire courant et tous ses sous-répertoires
  * `ls -lD` > lister les uniquement les Dossiers
  * `ls -` >

- chmod (RWX)
> permet de modifier les droits
  * 'Read Write Execute'

- mkdir 
> créer un dossier

- touch mon_fichier.ext
> créer un fichier 

- tree 
> permet de voir l'arborescence du répertoir courant
    - `tree L 4` > affiche l'arborescence avec une profondeur de 4

