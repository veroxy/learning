# git book

###  INSTALLATION
**13.10.2016**
[lien d'installation](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md 'source')
~~~shell
  sudo npm install gitbook-cli -g
~~~

### COMMANDES
les commandes sont les similaire à ceux de Git seulement que l'on ajoute le suffixe `-book` à `git`:
  * `gitbook init` pour initialiser un nouveau livre/repo
  * `gitbook serve` pour l'aperçu
  * `gitbook build` pour créer une page web statique
  * ``

### ePub, Mobi, PDF
~~~shell
# Generate a PDF file
$ gitbook pdf ./ ./mybook.pdf

# Generate an ePub file
$ gitbook epub ./ ./mybook.epub

# Generate a Mobi file
$ gitbook mobi ./ ./mybook.mobi
~~~

### importe Github Re
