---
layout: page
title: class - entité
parent: php
---
# class / entité

> Pour utiliser une méthode sans instance (objet), elle doit être déclarée statique et nous ferons attention de manipuler uniquement des propriétés statiques.
Elles permettent aussi d'effectuer des calculs, des actions ou de retourner des informations [oc exemple](https://openclassrooms.com/fr/courses/1665806-programmez-en-oriente-objet-en-php/7361681-utilisez-les-proprietes-et-methodes-statiques#/id/r-7361715)
> syntaxe : `MyClass::ft_maFonctionStatique(10.5)`
````php
<?php

declare(strict_types=1);

class Pont
{
   public static function validerTaille(float $taille): bool
   {
       if ($taille < 50.0) {
           trigger_error(
               'La longueur est trop courte. (min 50m)',
               E_USER_ERROR
           );
       }
      
       return true;
   }
}

var_dump(Pont::validerTaille(150.0));
var_dump(Pont::validerTaille(20.0));
````

## signature d'une classe
la signature est l'ensemble des choses que l'on paramètre à l'écriture d'une méthode :
- un nom,
- une visibilité,
- des arguments avec des types obligatoires ou optionnels,
- des valeurs par défaut,
- et un type de retour

````php
class Signature{

    public nomMethode(string $parametre): string
    {
     // algo
    }
}

````
