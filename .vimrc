"CREAT BY VEROXY
"vim v0.1 2016/08/03

"RACCOURCIS VIM
"
"w|source % (w pour sauvegarder source pour exécuter le code du fichier courant %).
"P > paste
"Y > Copy
"DD > cut
"u > annuler dernière action


"reconnaisance automatique du fichier
filetype on

set nocompatible
set number
"set mouse =a /some pb for copy/paste
syntax on



"parametre de region
set spelllang =fr
set spell
"set spellsuggets =3


"voir les cmd raccourcis ex:  dd ou y (copier) p (coller)
set showcmd

"coloratiion syntax & indatation
colorscheme molokai
filetype plugin indent on

"historique
set history=100

"voir les parenthèse/accolades manquantes
set showmatch

"rechercher de façon visuel
set hlsearch
set incsearch
set ignorecase

"trouver la ligne du curseur
set cursorline
hi Cursorline ctermbg=darkgrey guibg=#771c1c cterm=none


