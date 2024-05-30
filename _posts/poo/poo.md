---
layout: page
title: Programmation Orienté Objet
parent: poo
---

# POO PHP
##### LA PROGRAMATION ORIENTÉE OBJET

- [pierre giraud](http://www.pierre-giraud.com/php-mysql/cours-complet/php-poo-classes-objets.php)
- [tuto Graphikart](https://www.grafikart.fr/formations/programmation-objet-php/objets-poo)

---
### INTRO
La programation orienté objet permet de comme son nom l'indique  de créer des "objets" c'est le contraire de la programme procédurale.
<br>
Comme on construirait un oridnateur : on implément des éléments les avec les autres qui sont composés dé'éléments (var / let ) et de méthode (allumer, ouvrir , eteindre...)
<br>

Il fautr être conscient qu'un objet (voiture, oriduanateur) est composé de plusieur objets:
- objet = class
    - varibales (valeurs)
    - methodes (fonctionnalité)

### Class
Une CLass est la dénomination que l'on donne à un objet. 
<br>
Elle se distingue par sa structure:
- un nom commençant par une Majuscule et précéder du mot Class (Class Computer, Class Clavier)
- de variables qui seront utilisées par la suite
- de méthodes que l'on appels habituellement méthodes et qui prenne ou non des variables en paramètre
- une classe peut prendre des valeur en paramètres via son Constructeur , qui est en réalité une méthode qui est appliqué directement à l'appel de la Class

```
    class Screen{
        // VARIABLES 
        public width;
        public dalle; // led 
        public buttons; // power - menu
        protected hub; // vga - hdmi
        private feet;
        private sector; // source energy
        const pixel = 1600;
        
        // methodes, ici
        function __construct(width){
             this->_width
        }
        
    }
```


la class comprends donc des attributs et des méthodes 
