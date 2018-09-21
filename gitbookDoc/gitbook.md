# git book

###  INSTALLATION
**13.10.2016**
[lien d'installation](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md)
```shell
  sudo npm install gitbook-cli -g
```

### COMMANDES
les commandes sont similaires à ceux de Git seulement que l'on ajoute le suffixe `-book` à `git`:
  * `gitbook init` pour initialiser un nouveau livre/repo (qui)
  * `gitbook serve` pour l'aperçu
  * `gitbook build` pour créer une page web statique
  * ``

### ePub, Mobi, PDF
pour pouvoir exporter en .pdf  il faut installer via `https://calibre-ebook.com/download_linux`
```shell
    sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
```

```shell
# Generate a PDF file
$ gitbook pdf ./ ./mybook.pdf

# Generate an ePub file
$ gitbook epub ./ ./mybook.epub

# Generate a Mobi file
$ gitbook mobi ./ ./mybook.mobi
```

