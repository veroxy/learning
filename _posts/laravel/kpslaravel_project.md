---
layout: default
title: laravel 5.7
parent: laravel
---


# laravel 5.7
1. `composer create-project laravel/laravel albumplus --prefer-dist`
    1.1. `php artisan --version
`
2. config
    ```
        DB_CONNECTION=mysql
        DB_HOST=127.0.0.1
        DB_PORT=3306
        DB_DATABASE=albumplus
        DB_USERNAME=root
        DB_PASSWORD=
    ```
    2. 1 on peut renommer l'app dans le ficher **/.env** `APP_NAME=MonNouveau`

3. `php artisan migrate` 

4. `php artisan make:auth`
5. `composer require barryvdh/laravel-debugbar --dev`  
    5. 1 `composer require caouecs/laravel-lang:~4.0`  
    5. 2 Files of languages are in "vendor/caouecs/laravel-lang" directory
Copy the folders of languages that you want, in the resources/lang folder of your Laravel application (app/lang in Laravel 4).

6. on install webpack qui est dans le fichier composer.json `npm install`, ainsi les le **./node_modules** s'ajoute et le fichier **webpack.mix.js** s'ajoute dans lequel on colle d:
    ```javascript
    const mix = require('laravel-mix');
    mix.js('resources/js/app.js', 'public/js')
       .sass('resources/sass/app.scss', 'public/css');
    ```
7. supprimer tous les elements contenant Vue.js (resources/js/bootstrap.js, resources/js/components) dans le dossier ressources pour pouvoir le remplacer uniquement par Bootstrap dans le fichier ( resources/js/app.js ), ça permet d'installer les dépendances Bootstrap (lodash, popper,  jquery)
    ```javascript
    window._ = require('lodash');
    window.Popper = require('popper.js').default;
    
    try {
        window.$ = window.jQuery = require('jquery');
        require('bootstrap');
    } catch (e) {}
```

