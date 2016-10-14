# SASS

f_sass.scss == input <br />
f_css.css == output

---

### RÉFÉRENCES
1.  **pour quelles usages ?**<br />
En plus de toutes les raisons de bases que l'on choisi d'utiliser SASS
  * [Les sélécteurs css3](https://webdesign.tutsplus.com/tutorials/a-simple-responsive-grid-made-even-better-with-sass--cms-21540'souce')
  * [media queries base & mobile first](https://css-tricks.com/snippets/css/media-queries-for-standard-devices/'souce')
2.  **avec SASS**<br />
  * [LESS vs SASS](https://blog.webnet.fr/less-versus-sass/'source')
  * [La cascade](https://la-cascade.io/se-lancer-dans-sass/'souce')
  * [les selecteurs avec sass](http://blog.teamtreehouse.com/sass-tip-double-ampersand-selector 'souce')
  * [principe des colonnes for mobile first](http://inspirationalpixels.com/tutorials/grid-system-with-sass'souce')
  * [media queries avec sass](https://webdesign.tutsplus.com/tutorials/a-simple-responsive-grid-made-even-better-with-sass--cms-21540'souce')
  * [DOCUMENTATION OFFICIEL](http://sass-lang.com/documentation/file.SASS_REFERENCE.html 'officiel')
3.  **Installation**<br />
  1. [install RUBY via RBENV](https://github.com/rbenv/ruby-build 'source') et pas `apt-get`
  2. [installation SASS](http://sass-lang.com/install'officiel')
  3. [koala free app Linux/Mac/Win ](http://koala-app.com/'souce')




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

```css
#!sass
example : dans le fichier style.sass

/** importer diff styles des autres pages **/
@import '/scss/home'
@import '/scss/job';
```

### Imbrication
* Indentation du code / code imbriqué
* @mediaquery facilité

```css
#!sass
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

```css
#!sass
$color: #ffffff;
a{
  color: $color;
}
```

### @mixins && @include
* on créer un exemple de style @mixin que l'on nomme
* on intégrègre le mixin dans une balise/class/id/ avec @include + nom de la mixin

```css
#!sass
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
```css
#!sass
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
* procède de la même façon qu'un lorsque l'on parcour les propriétés d'un objet.
* on demande la correspondance entre la liste et la classe dans ls html.

```css
#!sass
  $list: (orange, purple, teal);

  @each $item in $list {
    .#{$item} {
      background: $item;
    }
  }

<div class="orange">orange</div>
<div class="purple">purple</div>
<div class="teal">teal</div>
```
* ou encore créer un arc-en-ciel bien dégeulasse selon le nombre de divs <= 10

```css
#!sass
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

```css
#!sass
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

 ```css
#!sass
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

## 2-COMMAND LINE
compiler INPUT > OUTPUT: `sass style.scss style.css`
