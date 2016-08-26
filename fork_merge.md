# FORK & MERGE

FORK
---

fork url() > pull request sur un PROJET > "je fais des modifs"
==> le repos original n'est plsu à jour.


1/ on fork le projet que l'on veut (celui d'un autre en principe) sur son github

2/ on clone le dépot qui a été créé sur notre github
```
~git clone url(MON URL);
```

3/ on se crée une branche à soit
```
~git checkout -b MABRANCH
~git branch
* master origin MABRANCH
```
4/ on ajoute cette modif de notre git et on commit
```
git add
git commit -m 'new branch'
```
4/
il faut tirer l'url du Projet de base

> git remote add ProjetInitial git@githubm: lksdhfhksdhf.

on peut constater l'ajout du lien sur le fichier `.git/config` avec le nom que
l'on lui a donné.

> git pull ProjetInitial master


MERGE
---

(LORSQUE que l'on a plusiseurs branches)
```
~ master$ git branch
* master NOMBRANCH DEV
~master$ git branch NOMBRANCHE
~master$ git checkout NOMBRANCHE
switched on branche NOMBRANCHE
~NOMBRANCHE(master)$ touch text.js
~NOMBRANCHE(master)$git add *
~NOMBRANCHE(master)$git commit -m "tex"

```
`git log --oneline` pour afficher les différent COMMIT
`git branch -d NOMBRANCH` supprimer une branche


renommer branch
```
git branch -m ancienne_BRANCH NOUVEAU_NOM_BRANCH
```
>> il faut 'ADD'
>> il faut toujours 'COMMIT'
>> il faut push:
```
git push -u origin NOUVEAU_NOM_BRANCH
```
Si renommé ou supprimé
```
git push origin ancienne_BRANCH
```



supprimmer une branch(distante)
```
git push origin: NOM_BRANCH_A_SUPP
```
