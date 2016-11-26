# Use Bitbucket and Github pour un même projet
### fetch de GitHub et Push sur GitHub et deBIbucket

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
4. il n'y a plus qu'à ADD/COMMIT/PUSHE
