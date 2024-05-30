---
layout: page
title: Classe/methode abstrat, static, private, public
parent: php
---

# Classe abstract, static, private, public

> L'héritage nous permet d’accéder aux propriétés et méthodes d’une classe “parent” depuis les “enfants“

## classe abstraite

Une classe abstraite
- ne s'instancie pas sinon cela renvois une error `Fatal error: Uncaught Error: Cannot instantiate abstract class User`
- étant une classe enfant qui hérite de ses propriété et méthode
- elle peut contenir une [**signature methode abstraite**](class.md#signature-dune-classe) aussi qui indique que cette methode est **require** dans sa descendance

````php
abstract class User
{
    abstract public function getUsername(): string;
}

class Admin extends User{
}

class Associate extends User{
}

````

## methode statique

> Depuis la classe enfant, vous pourrez faire référence aux mêmes propriétés statiques que le parent, peu importe que
 vous fassiez référence à la classe enfant ou à la classe parente. En revanche, ceci marche en cascade : vous ne
 pourrez  pas faire référence aux propriétés (statiques ou non) de l'enfant depuis le parent. Voyez ceci comme des poupées russes.
> Les parents sont au centre. Vous pourrez atteindre un parent en passant par un enfant, l’inverse n’est pas vrai.

````php
<?php
 
declare(strict_types=1);
 
class User
{
    public const STATUS_ACTIVE = 'active';
    public const STATUS_INACTIVE = 'inactive';
 
    public static $nombreUtilisateursInitialisés = 0;
 
    public function __construct(public string $username, public string $status = self::STATUS_ACTIVE)
    {
    }
}
 
class Admin extends User
{
    public static $nombreAdminInitialisés = 0;
 
    // mise à jour des valeurs des propriétés statiques de la classe courante avec `self`, et de la classe parente avec `parent`
    public static function nouvelleInitialisation()
    {
        self::$nombreAdminInitialisés++; // classe Admin
        parent::$nombreUtilisateursInitialisés++; // classe User
    }
}
 
Admin::nouvelleInitialisation();
var_dump(Admin::$nombreAdminInitialisés, Admin::$nombreUtilisateursInitialisés, User::$nombreUtilisateursInitialisés);
var_dump(User::$nombreAdminInitialisés); // ceci ne marche pas.
````

Que vous permet de faire PHP, et que vous impose-t-il lorsque vous réécrivez/surchargez une méthode existante dans une
classe parente ? Pour commencer, sa signature doit rester compatible avec la méthode d'origine :

- vous ne pouvez pas enlever des arguments ;
- vous pouvez ajouter un argument uniquement s'il est optionnel ;
- Vous pouvez changer le type d'un argument uniquement s'il est compatible avec le type d'origine (voir un exemple) ;
- vous pouvez changer le type de retour de la méthode uniquement s'il est compatible avec le type d'origine.

## class [abstraite](https://openclassrooms.com/fr/courses/1665806-programmez-en-oriente-objet-en-php/7307048-contraignez-l-usage-de-vos-classes)

une classe abstraite permet de créer un objet model qui est obligatoirement une extension d'une autre classe. exemple "
User" étend Player ou Admin
Player et Admin prendrons