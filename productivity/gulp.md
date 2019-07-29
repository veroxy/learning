#gulp

 - [documentation - gitbook](https://gulpjs.org/)
 - [première prise en main](http://mnemotix.github.io/gulp-tuto/)
 - [gulp dfacile](https://la-cascade.io/gulp-pour-les-debutants/)

> voir exemple Alexandre Peyron [popcarte](https://www.popcarte.com/)

--------


## gulp -  l'automatisation par projet
Gulp permet d'automatiser la création de projet comme "versionning de mise en prod".<br>
Il permet d'automatiser des taches tels que :
    - l'import de bibliothèques externe (compris dans > vendors)
    - la compilation des fichiers .sass > .css
    - "" js > .min.js

## création de scipt GULPFILE.JS    
dans ce fichier 
- on écrit les "TASK"s que l'on veux faire 
- associé à des commandes

```
    var gulp = require('gulp');
    var merge = require('merge-stream');
    
    gulp.task('test', function() {
      var bootstrap = gulp.src('bootstrap/js/*.js')
        .pipe(gulp.dest('public/bootstrap'));
    
      var jquery = gulp.src('jquery.cookie/jquery.cookie.js')
        .pipe(gulp.dest('public/jquery'));
    
      return merge(bootstrap, jquery);
    });
```

dans le script ci-dessus on mergé le script jquery avec celui de bootstrap


## STRUCTURE -> a réécrire



