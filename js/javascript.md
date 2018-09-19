# javascript

## différentes versions de JS et frameworks js
> a voir
1. js
2. jquery
3. ajax
4. canvas,[easlejs framework](https://www.createjs.com/easeljs)
5. [svg](https://la-cascade.io/guide-des-animations-svg/),[svgjs](http://svgjs.com/)

----

## javascript ES5(ECMA SCRIPT) vieux
ECMA SCRIPT (action script, dart, Jscript)
>  auhourd'hui en 2018
- lagage interprété
- typé
- prototype
- pbq des navigateurs qui interprètent différemment le langage

## DOM Document Object Model
>
**obfuscation** (rave / reve )diff de minification , il applique plusieurs chose : minification + changement de nom de var etc..

## [les opérateurs d'égalités](https://www.w3schools.com/js/js_bitwise.asp)
**"=="** tant que les deux valeurs n'ont pas été testées en transformant les type pour trouver une correspondance l'opérateur continu de c omparer. Dans l'exemple suivant les valeurs seront égales malg'é leur de différence de type
```javascript
"five" == 5
```
à la différence **"==="** le triple égale lui compart la valeur + le type

## ES6 && "Arrow function"
c'est de la programmation **ASYNCHROME**
- nommée
    ```javascript
    document.addEventListener('onclick', monCallBackFuntion);
    })
    ```
- anonyme
    ```javascript
    document.addEventListener('onclick', function(){
        console.log("anonyme");
    });
    ```

différence entre un callback qui ne retourne pas une fonction et une qui retourne une autre fonction sont appelé différement dans l'event
le premier ne retourne pas de fonction == n'a pas besoin d'^tre exécuté le second à besoin d'être éxécuté car il faut appélé le reste de son contenu
('onclick', monCallBackFuntion)
et ('onclick', monCallBackFuntion())

- auto-invoqué
> de protected,  la fontion appel un nouveau block/scope
l'autoinvocation permet de donner cette possibilité avec une function anonyme
`(function autoInvoquee(){blaabla})()`;

```javascript
(function (window){
var LEGAL_AGE = 18;
car beerService = {}; // var private

beerService.beerServing = function (age){
    age = age || LEGAL_AGE;
    if(age < LEGAL_AGE){
        return;
    }
    window.beerService = beerServoce;
    }
})(window);
beerService.beerServing(27);
```

## OBJECTS

TOFIXED REVOIR PROTO
- literale
```javascript

var car = {marque :'fiat',  model : '500'};
car.type;
var car = {
    marque :'fiat',
    model : '500',
    fullName
}
```

creéation prototype null
```javascript
o = Object.create(null);
o = Object.create(null,{});
```
Il faut conciderer l'object nessant par son prototype
```javascript
function Empoyee(){
    this.aaa = "";
    this.bbb = "commun"
}

function Manager(){
    this.xxx = []
}

Manager.prototype = new Employee();
````
donc Manager va avoir trois proprités la sienne plus celui auquel on lui donne accès dans Employee

## hoisting

var qui peut déclaré après son utilisation
comportement par defaut , très avancé
il n'a donc pas d'assignment par defaut mais il ne peut utiliser pour une concaténation car il ne sera pas interprété et sera donc retourné "undefined"

## strict mode
sécurité
porté globale


## [Node JS](https://nodejs.org/fr/)
>Node.js® est un environnement d’exécution JavaScript construit sur le moteur JavaScript V8 de Chrome.
basé sur l'aynchrone **event-driven, non blocking I/O**
pouvoir faire autre chose / exécuté plusieurs choses même si l'une des actions n'est pas finie


- moteur JavaScript V8 de Chrome developpé par Google

## NPM package et modules

## [PROMISES](https://developer.mozilla.org/fr/docs/Web/JavaScript/Guide/Utiliser_les_promesses)
```javascript
function faireQqcALAncienne(successCallback, failureCallback){
  console.log("C'est fait");
  // réussir une fois sur deux
  if (Math.random() > .5) {
    successCallback("Réussite");
  } else {
    failureCallback("Échec");
  }
}

function successCallback(résultat) {
  console.log("L'opération a réussi avec le message : " + résultat);
}


function failureCallback(erreur) {
  console.log("L'opération a échoué avec le message : " + erreur);
}

faireQqcALAncienne(successCallback, failureCallback);
//On aura une fonction qui renvoie une promesse et on attachera les callbacks sur cette promesse :

function faireQqc() {
  return new Promise((resolve, reject) => {
    console.log("C'est fait");
    // réussir une fois sur deux
    if (Math.random() > .5) {
      resolve("Réussite");
    } else {
      reject("Échec");
    }
  })
}

const promise = faireQqc();
promise.then(successCallback, failureCallback);

//ou
faireQqc().then(successCallback, failureCallback);
```