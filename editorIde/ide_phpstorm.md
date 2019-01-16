# phpstorm

----

## sous WINDOWS -- hellllll
1- intégrer le terminal

Depuis que windows a intégré en natif le Powershell il est possible d'utiliser le scommande  shell<brW
Il est possible tout de même d'eviter l'usage du logiciel en téléchargeant Git Bash et de l'intégrer dans Phpstorm. <br>
- Il faut ajouter le lien de l'exécutable du shell (sh.exe):<br>
  ```
    FILE > SETTINGS > TOOLS > Shell path
    "C:\Program Files\Git\bin\sh.exe" -login -i
  ```
Ne pas confondre le lien logiciel avec le celuis du GUI git bash sinon lorsque l'on lancera le terminal dans Phpstorm il ouvrira le logiciel git bash en externe. Et ce n'est pa ce que l'on veut (
    "C:\Program Files\Git\git-bash.exe" -login -i)
- Il faut ensuite redémarrer Phpstorm

## settings
[télécharger setting](editorIde/phpstorm_settings.jar) le setting Windows
 pour l'importer il faut aller dans **file > Import Settings** puis choisir les les params


## bashrc
[install git bash](https://tutesfornewdevelopers.wordpress.com/2017/08/27/git-windows/)

Create a .bashrc file under ~/.bashrc and away you go. Similarly for ~/.gitconfig.

~ is usually your C:\Users\<your user name> folder. Typing echo ~ in the Git Bash terminal will tell you what that folder is.

If you can't create the file (e.g. running Windows), run the below command:

copy > ~/.bashrc

The window will output an error message (command not found), but the file will be created and ready for you to edit.
