---
layout: page
title: Trait
parent: poo
---

# traits
---
> C'est un ensemble de méthodes concrètes ou fonctions, pouvant être ajouté à une classe pour étendre ses fonctionnalités.
[definition WIKI](https://fr.wikipedia.org/wiki/Trait_(programmation))

- Les traits proviennent du langage Self en 1982[à vérifier]4.
- Java inclut cette fonctionnalité depuis sa version 8 sortie en mars 2014 introduisant la fonctionnalité des méthodes par défaut.
- Scala inclut cette fonctionnalité5.
- PHP les propose depuis sa version 5.46.
- Rust propose cette fonctionnalité et l'utilise dans l'implémentation de sa bibliothèque standard7.
- C++: les propose dans la STL et Boost
- Les traits sont proposés pour inclusion dans Smalltalk.
- Les traits sont proposés pour inclusion dans Fortran 202Y8, qui succédera à la norme Fortran 202X attendue en 2023.
- Par ailleurs, les « mixins de module » de Ruby sont comparables aux traits dans une certaine mesure. De même, le rôle en Perl 6 est une fonctionnalité inspirée du concept de trait.

````php
trait Hello {
    public function sayHello() {
        echo 'Hello ';
    }
}
 
trait World {
    public function sayWorld() {
        echo ' World';
    }
}
 
class MyHelloWorld {
    use Hello, World;
    public function sayExclamationMark() {
        echo '!';
    }
}
 
$o = new MyHelloWorld();
$o->sayHello();
$o->sayWorld();
$o->sayExclamationMark();
````