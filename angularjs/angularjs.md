# ANGULAR JS
>« Comment penser en AngularJS quand on a l’habitude d’utiliser jQuery ? »

-----

### KEZAKO ?
  PRÉREQUIS:
   - Html
   - Css
   - Javascript
  créer une single-page en full-HTML/CSS pour l'architecture.
### jQuery VS AngularJS
  **jQuery code**
  dans le fichier .js
  ```javascript
  $('.main-menu').dropdownMenu();
  ```
  **AngularJS**
  on le met directement dans le .html
    - permet de voir directement que l'élément et dynamique
    - sans changer le contenu
    - employer un Framework permets de facilité la gestion des **singlepage**
    - inclu directement du jquery allégé == jqlite.

  ```html
  <ul class="main-menu" dropdown-menu>
      ...
  </ul>
  ```
3. ### DATA BINDING
  en jQuery on répond à des événements, et à partir de là on met à jour le contenu.
  **jQuery**
  ```javascript
  $.ajax({
    url: '/myEndpoint.json',
    success: function(data, status) {
        $('ul#log').append('&lt;li&gt;Data Received!&lt;/li&gt;');
    }
  });
  ```
  **AngularJS**
  ```html
  <ul cljhgass="messages">
    <li ng-repeat="entry in log">{{ entry.msg }}</li>
  </ul>
  <!--marche dans les deux sens. msg être éditables dans la view-->
  <input ng-model="entry.msg" />

  ```
  les avantage de cette méthode c'est que l'on pourrait se passer de cet UL et utiliser une "alertes boxes"Boostrap,  la view sera automatiquement mis à jour
4. ### « Separation of concerns »
  La view est le « record » officiel et le modèle, c’est les données. Utiliser les services pour les tâches réutilisables, les manipulations du DOM se font dans les directives et tout cela est collé ensemble par les contrôleurs. </br>
  le modèle est une couche séparée que l’on peut manipuler comme on le veut, et qui est complètement indépendante de la view ce qui facilité la stabilité.

/!\ finir de lire l'article

----

### AngularJS = framework JS
  ```html
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  ```
#### VUE
La vue est la projection de ce que voit le visiteur sur son navigateur

#### DIRECTIVES
<p>il permet d'étendre le HTML avec des directives ` ng-directives `, pour de nouveaux comportements etc</p>
  - ` ng-app ` = définie une AngularJS application
  - ` ng-model ` permet de lier la valeur du controleur HTML (input, select, textarea ...), aus données d'application
  - ` ng-bind ` lie les données d'application à la view HTML
  ```html
  <div ng-app="">
 	<p>Name: <input type="text" ng-model="name"></p>
 	<p ng-bind="name"></p>
  </div>
  ```
#### FILTER
  - `uppercase` /`lowerc`lowercase`ase`
  -
#### EXPRESSION
  la syntaxe des expressions AJS s'écrivent avec des doubles accolades **{{ bibi }}**.
  ```html
  <div ng-app="">
 	<p>My first expression: {{ 5 + 5 }}</p>
  </div>
  ```
#### AJS APPLICATIONS
  AJS comprend des **modules** pour définir l'AJS contextes et  des **controleurs** pour gérer ces application.  La directive **ng-app** définie le contexte, **ng-conttrolers** le controleur.

#### CONTROLER
  - fait partie du syteme MVC ( )
  - récupère une partie des données et va les envoyer à la vue (modele)

#### SCOPE
  - système qui fait la liaison entre le modele et la vue
  - cela remplace le `ng-init`
  **AVANT* AVEC NG-INIT**
  ```javascript
    <section class="dates-area" ng-init="events=[{date:'Mar. 5', month:'oct', nom:'literie matelats', lieux:'Bote', adr:'8 chat boté'}, {date:'Mar. 5', month:'nov', nom:'RWX', lieux:'Chmod', adr:'75 allée shell script'}, {date:'Mar. 7', month:'nov', nom:'Salope salope', lieux:'BML', adr:'8 rue des aveugles'}, {date:'Mar. 5', month:'dec', nom:'contenu bitch', lieux:'BML', adr:'255 cours des zizi'}]">
  ```
**APRÈS AVEC UN CONTROLLER**
  ```javascript
  <section class="dates-area" ng-conttrolers="FtEventsController">
  </script>
  function FtEventsController($scope){
    $scope.events =[
    {
      date:'Mar. 5',
      month:'oct',
      nom:'literie matelats',
      lieux:'Bote',
      adr:'8 chat boté'
    },
    {
      date:'Mar. 5',
      month:'nov',
      nom:'RWX', lieux:'Chmod', adr:'75 allée shell script'
    },
    {
      date:'Mar. 7',
      month:'nov',
      nom:'Salope salope',
      lieux:'BML',
      adr:'8 rue des aveugles'
    },
    {
      date:'Mar. 5',
      month:'dec',
      nom:'contenu bitch',
      lieux:'BML',
      adr:'255 cours des zizi'
    }];
  }
  </script>
  ```