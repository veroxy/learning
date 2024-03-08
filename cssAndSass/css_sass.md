# SASS

> f_sass.scss == input
f_css.css == output
**cmd**:
```shell
sass --watch
```
------

### RÉFÉRENCES
 - [the sass way](http://thesassway.com/)
1.  **pour quelles usages ?**<br />
En plus de toutes les raisons de bases que l'on choisi d'utiliser SASS
  * [Les sélécteurs css3](https://webdesign.tutsplus.com/tutorials/a-simple-responsive-grid-made-even-better-with-sass--cms-21540)
  * [media queries base & mobile first](https://css-tricks.com/snippets/css/media-queries-for-standard-devices/)
2.  **avec SASS**<br />
  * [LESS vs SASS](https://blog.webnet.fr/less-versus-sass/)
  * [La cascade](https://la-cascade.io/se-lancer-dans-sass/)
  * [les selecteurs avec sass](http://blog.teamtreehouse.com/sass-tip-double-ampersand-selector)
  * [principe des colonnes for mobile first](http://inspirationalpixels.com/tutorials/grid-system-with-sass)
  * [media queries avec sass](https://webdesign.tutsplus.com/tutorials/a-simple-responsive-grid-made-even-better-with-sass--cms-21540)
  * [DOCUMENTATION OFFICIEL](http://sass-lang.com/documentation/file.SASS_REFERENCE.html )
3.  **Installation**<br />
  1. [install RUBY via RBENV](https://github.com/rbenv/ruby-build ) et pas `apt-get`
  2. [installation SASS](http://sass-lang.com/install)
  3. [koala free app Linux/Mac/Win ](http://koala-app.com/)

## 1-KEZAKO ?
### TREE
```
dir_PROJET/
  CSS/
    SCSS/
    style.scss
    _mixins.scss
    _colors.scss
```
* les fichier commençant par "\_fichier" sont des PARTIES. >> @import dans le fichier PRINCIPAL "style".

* les @import sass sont incorporer dans les autres MASTERS/STYLES. Le préprocesseur va incorporer directement les différentes parties dans le fichier STYLE.CSS

```scss
example : dans le fichier style.sass

/** importer diff styles des autres pages **/
@import '/scss/home';
@import '/scss/job';
```

### Imbrication
* Indentation du code / code imbriqué
* @mediaquery facilité

```scss
body.home {
  .media-unit {
    border: 1px solid #ccc;
    background-color: #fff;
    .right {
      border-left: 1px solid #ccc;
      h1 {
        font-size: 24px;
      }
    }
  }
}

/*Imbrication de media query*/

.container {
  width: 940px; // Si la largeur de l’écran est inférieure
  //  à 940px, passer à une présentation fluide
  @media screen and (max-width:940px) {
    width: auto; }
  }
}
```

### variables
* modifier le code plus facilement en réduisant les duplications.
* de nommer la valeur d’une propriété, la couleur par exemple

```scss
$color: #ffffff;
a{
  color: $color;
}
```

### @mixins && @include
* on créer un exemple de style @mixin que l'on nomme
* on intégrègre le mixin dans une balise/class/id/ avec @include + nom de la mixin

```scss
//Exemple de mixin

$bkgdcolor: #ffa;
@mixin texte-surligne-gras {
  font-weight: bold;
  background-color: $bkgdcolor;
}
.resultat-surligne {
  span {
    @include texte-surligne-gras;
  }
}
```
utilité àvec cross-browser:
```scss
@mixin rounded-corners {
  $rounded-corner-radius: 4px;
  -webkit-border-radius: $rounded-corner-radius;
  -moz-border-radius: $rounded-corner-radius;
  -ms-border-radius: $rounded-corner-radius;
  border-radius: $rounded-corner-radius;
}
.button {
@include rounded-corners;
}
```

### function utile
* procède de la même façon que lorsque l'on parcours les propriétés d'un objet.
* on demande la correspondance entre la liste et la classe dans ls html.

```scss
  $list: (orange, purple, teal);

  @each $item in $list {
    .#{$item} {
      background: $item;
    }
  }
```
```html
<div class="orange">orange</div>
<div class="purple">purple</div>
<div class="teal">teal</div>
```
* ou encore créer un arc-en-ciel bien dégeulasse selon le nombre de divs <= 10

```scss
.ray {
  height: 30px;
}

//boucle
@for $i from 1 through $total {
  .ray:nth-child(#{$i}) {
    background: adjust-hue(blue, $i * $step);
   }
}
```
### conditionS

```scss
$total: 10; //Number of .ray divs in our html
$step: 360deg / $total; //Used to compute the hue based on color-wheel

.ray {height: 30px;}

@for $i from 1 through $total {
  .ray:nth-child(#{$i}) {
    background: adjust-hue(blue, $i * $step);
    width: if($i % 2 == 0, 300px, 350px);
	margin-left: if($i % 2 == 0, 0px, 50px);
   }
}
```
### extension
 \@extend permet de d'ajouter des propriété à d'autres definitions de style par exemple lorsque l'on veut appliquer une propriété à différentes balise/class/id en même temps sans les énumérer manuellement.

 ```scss
 .absolute {
   position: absolute;
}

.caca{
  background-color: red;
  @extend absolute;
  p{
    height: 10px;
    @extend absolute;
  }
}
// output:
.absolute, .caca, .capa p{
  position: absolute;
}
```
----
## 2-USAGES
```scss
@each $asideSect in photo, contactMe, calendar {
  .#{$asideSect}-a {
    margin: 10px 0;
    padding: 15px;
  }
}
```

----
## 3-COMMAND LINE / SHELL
compiler un fichier scss le motif : INPUT > OUTPUT, je suis dans le répertoire /assets/
- pour compiler manuellement un fichier sass c'est la commande suivante qui permet d'envoyer le fichier compilé dans le dossier désiré ici je l'envois dans le dossier 'autres' qui est hors du dossier courant où se trouve le dossier sass/
  ``` shell
    sass sass/style.scss:../autres/style.css  
  ```
- ici le fichier style.css se met à jour automatiquement. En gros le préprocesseur regarde le fichier ".scss" et l'enregistre automatiquement le dossier de "css/"
  ``` shell
    sass --watch sass/style.scss:css/style.css  
  ```
En Le **fichier.css** ce trouve ici dans le dossier **./Mon_projet/autres/** mais aussi dans le **./Mon_projet/assets/css** mais le fichier **original.scss** (non compilé) est toujours dans le dossier  **./Mon_projet/assets/sass**

---

## 4-INSTALLATION GEM
- OVER FILES IMPORT
- [COMPASS](http://compass-style.org/reference/compass/css3/box_shadow/)
[GEM files à installer]()
```scss
@import "compass/css3/box-shadow";

```
