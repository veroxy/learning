#commande shell/bash based
# lien symbolique
ln [-s >> fichier]
EXEMPLES
$ ls -l (afficher les fichiers et les droits avec les fichier cachés)
-------
total 36
-rw-rw-r-- 1 vmllmv vmllmv 6144 oct.   5 12:44 exoTEST.tar
drwx--xr-x 2 vmllmv vmllmv 4096 juin   1  2015 test0
-rwx--xr-- 1 vmllmv vmllmv    4 juin   1  2015 test1
dr-x---r-- 2 vmllmv vmllmv 4096 juin   1  2015 test2
-r-----r-- 2 vmllmv vmllmv    1 juin   1  2015 test3
-rw-r----x 1 vmllmv vmllmv    2 juin   1  2015 test4
-r-----r-- 2 vmllmv vmllmv    1 juin   1  2015 test5
lrwxrwxrwx 1 vmllmv vmllmv    5 juin   1  2015 test6 -> test0
# test6 est un LIEN SYMBOLIQUE qui si on
touch test0/addfiletest.txt  va apparaître dans
ls test6/ >> addfiletest.txt

test0 est la source
test6 est la destination
**
test0 == test6

-------
 CE QUE JE DOIS FAIRE
------
Liens vers le dossier des sources
/opt/lamp/htdoc/www source
/var/www destination
**
/opt/lamp/htdoc/www == /var/www


Si l'on n'indique qu'un seul nom de fichier, un lien vers ce fichier est créé dans le répertoire courant.
Le nom de ce lien sera le même que celui du fichier visé (il s'agit là d'une extension GNU).
Sinon, si le dernier argument indique un répertoire existant, ln créera des liens sur chacun des fichiers source indiqués dans ce répertoire. Les noms seront égaux à ceux des fichiers source visés. (Consultez toutefois l'option --no-dereference plus bas). Si l'on indique seulement deux noms de fichiers, un lien sera créé avec le nom dest pointant vers le fichier source. Il est interdit d'indiquer plus de deux arguments si le dernier nom n'est pas un répertoire.
