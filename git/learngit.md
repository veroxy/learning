# A/ Premiers pas sur GIT

> Git est un gestinniaire de version, il permet le 'versionning' de vos projets  c'est à dire qu'il vous sera possible de voir les différentes versions d'un fichier par exemple.

---

### LOCAL creation de Dépot
1. ##### Ouvrir votre terminal
  * Dans votre  ./Documents créer un Nouveau_Dossier (ici 'Medias') dans lequel vous aller créer votre 'repository' git(dépot git) :
  ```
  ~$ cd ./Documents/simplon2016
  ~/Documents/simplon2016$ mkdir Medias
  ~/Documents/simplon2016$ cd Medias
  ~/Documents/simplon2016/Medias$
  ```
  >**vocabulaire :** un *Dossier/* est aussi nommé *Répertoire/* ou *Directory/* (en anglais)

2. ##### Créer le dossier de dépot distant
  * Vous avez dû flâner sur votre Github lors de la création de votre compte. Si ce n'est pas le cas faites le un peu pour la suite des hostilités.
  *  Dans la racine de votre compte utilisateur aller sur l'onglet '*repositories*' et créez-en un.     
  × donnez lui un NOM (ici "learngit").     
  × une description .     
  × en revanche, ne pas créer un README.md ou un .gitignore, vous le ferez vous même ultérieurement.
  * un dossier vide a été créé avec un **lien SSH ou HTML (url de navigation** que vous pouvez aussi trouvez sur le bouton à droite): SSH `git@github.com:veroxy/Medias-teams.git` ou HTML
  `https://github.com/veroxy/Medias-teams.git`.

  >**vocabulaire :** L e fichier Markdown '*README.md*' permet de décrire votre projet. Vous pouvez y mettre les différentes informations sur les versions de votre projet etc...      

3. ##### Initialiser le dépot local
Afin de créer un dépot de votre projet sur votre github.com il faut le lier.
  * on initialise git dans le dossier 'Medias' pour créer ce nouveau dépot.
  ```shell
  ~Medias$ git init
  ```
  * on peut vérifier que notre manipulation à bien marcher avec la commande `ls -la` pour afficher les éléments de notre dossiers 'Medias' dont les fichiers/dossiers cachés; ici notre '.git/'.     
  ```shell
  ~Medias$ ls -la
  drwxrwxr-x 7 UserName 4096 août  23 14:44 .
  drwxrwxr-x 3 UserName 4096 août  23 14:18 ..
  drwxrwxr-x 8 UserName 4096 août  24 12:09 .git
  ```
  > **vocabulaire :**  le terme '*local* ' est ce qui est chez vous sur votre ordinateur (ex: ici Medias/ est un dossier local) et '*distant*' désigne ce qui est en ligne sur github. C'est le même principe que pour Google Drive ou un autre serveur,  vous avez un endroit sur votre ordinateur où sont stockés vos différents documents synchronisés avec le cloud Drive/Dropbox etc...

4. ##### Lier le git
Nous avons maintenant un dépot local **Medias/** contenant notre dossier caché *.git* et un dépot distant github **Medias-teams** vide que nous allons lier: créer un tunnel pour qu'ils puissent communiquer.
  * toujours dans votre Terminal nous allons créer un fichier *README.md* vide que vous remplirez plus tard.
  ```shell 
    ~Medias$ touch README.md
  ```
  * ajoutez-le à votre repo, faites un commit avec un commentaire précis en utilisant `-m` comme 'message'
  ```shell 
  ~Medias$ git add README.md
  ~Medias$ git commit -m "premier fichier du projet"
  ```
  * vos repos ne sont toujours pas liés,  on va tirer l'url (ssh ou html) de votre dépot distant Github que vous avez créé précédemment vers votre local.      
  MOTIF DE CODE : `git remote add (<NOM BRANCHE>) <URL(ssh ou html>)`.
  ```shell 
    ~Medias$ git remote add git@github.com:veroxy/Medias-teams.git
    ~Medias$ git remote -v
    origin	git@github.com:veroxy/learngit.git (fetch)
    origin	git@github.com:veroxy/learngit.git (push)
  ```
  vous n'êtes pas obligé de donner un nom de branche, par défaut ce sera *origin* comme indiqué ci-dessus      
  * Maintenant vos deux dépôts sont liés. Vous pouvez désormais pousser vos fichiers.     
  MOTIF DE CODE : `git push (origin <NOM DE BRANCHE>)`.
  ```
    ~Medias$ git push origin master
    ~Medias$ git status
    Sur la branche master
    Votre branche est à jour avec 'origin/master'.
    rien à valider, la copie de travail est propre
  ```
> **vocabulaire :** on vient de parler de '*BRANCHE*',  ce n'est pas les branches d'un arbre mais on peux faire un rapprochement. Les **BRANCH** font la spécificité de GIT elles permettent de travailler sur un projet à différents stades de sa réalisation en même temps (ex: branch DEV, branch V1 ,branch PROD), ces noms sont arbitraire on aurait très bien pu les appeler 'riri', 'fifi' et 'loulou'.

Beaucoup de blabla mais j'espère que le béaba de git vous semble un peu moins le Diable en personne.