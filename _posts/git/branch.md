---
layout: page
title: branch
parent: git
---
# Utiliser Bitbucket & Github pour un même projet == 2 repos

### fetch de GitHub et Push sur GitHub et de Bibucket
1. relier le repo d'ou  vous voulez fetch et push depuis Github (ici) et just push vers Bitbucket avec le nom "ORIGIN"
  * REMOTE TO ORIGIN
```
git remote add origin git@github.com:NomUtilisateur/NomRepoDistant_github.git
```

2. Normalement lorsque vousouvrez dans VIM le fichier de configuration du git comme suit
  * OUVRIR DANS UN EDITEUR (ici VIM ou ATOM, etc...)
```
vim .git/config
```
3. il vous indique le nom (diminutif que vous lui qvez donné ou celui par default qui est "origin" ou "head" etc...) du lien [remote "ORIGIN"] - il faut garder un en commun et non et raccourcis différent car cela risque de faire des conflit de fetch/pull/push. Testez par vous même.
  * AJOUTER L'URL DE Bitbucket où PUSHER comme ci-dessous.
```
[remote "origin"]
        url = git@github:NomUtilisateur/NomRepoDistant_github.git
        fetch = +refs/heads/*:refs/remotes/gh/*
        url = git@bitbucket.org:NomUtilisateur/NomRepoDistant_bitbucket.git
```
4. il n'y a plus qu'à ADD/COMMIT/PUSH

5. PULL/request

### changement de nom de branch 
1. via github
dans la la partie gauche où s'affiche le menu déroulant de branches selectionner "*view all branches*" et dans le menu "**...**" de la brancheà changer de nom choisr "*rename*"
   The default branch has been renamed!
Il faut maintenant mettre à jour le nom de la branche en local
````shell
#master is now named main

#If you have a local clone, you can update it by running the following commands.

git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
````
2. renommer une branch en locale
````shell
git branch -m gh_page jkl_learning # renommer la MAUVAISE_BRANCHE NOUVEL_BRANCHE
git branch -u origin/gh_page jkl_learning # Remplace localement l branch 
git branch 
git push --set-upstream origin jkl_learning # on renplace aussi à distance
git branch --all # il faut lister
git push origin --delete gh_page # et supprimer la branch à distance
````