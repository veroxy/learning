# SASS

f_sass.scss == input <br />
f_css.css == output

---
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

```
#!sass
example : dans le fichier style.sass

/** importer diff styles des autres pages **/
@import '/scss/home';
@import '/scss/job';
```

### Imbrication
* Indentation du code / code imbriqué
* @mediaquery facilité

```
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

//Imbrication de media query

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

```
#!sass
$color: #ffffff;
a{
  color: $color;
}
```

### @mixins && @include
* on créer un exemple de style @mixin que l'on nomme
* on intégrègre le mixin dans une balise/class/id/ avec @include + nom de la mixin

```
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
```
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

```
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

```
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
### condition

```
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

 ```
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
