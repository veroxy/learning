# vim config
```
  " VIM VUNDLE VOIRE SUR GITHUB LE README "
  set nocompatible  " be iMproved, required
  filetype off      " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " EXEMPLES DE BUNDLES"
  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  Plugin 'L9'
  " Git plugin not hosted on GitHub
  Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Avoid a name conflict with L9
  Plugin 'user/L9', {'name': 'newL9'}

  " FIN DES EXEMPLES

  " MES PLUGINS

  " HEADER 42
  "Bundle '42header'


  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line


  " TOUS LES PARAMETRE GRAPHIQUE UTILISATION DE VIM
  "http://doc.ubuntu-fr.org/vim
  syntax on
  set number
  set ruler
  colorscheme desert

  "permet l'utilisation de la souris dans le terminal pour sélectionner, copier et coller
  set mouse=a

  " Display the cursor position on the last line of the screen or in the status
  " line of a window
  set ruler

  "Indentation toutes les quatre colonnes
  set tabstop=4

  "Indentation de quatre colonnes
  set shiftwidth=4

  "Conserve l'indentation courante sur les nouvelles lignes
  set autoindent

  "Indentation intelligents
  set smartindent

  "affiche les commandes incomplète
  set showcmd
```
