# ANGULAR JS
>« Comment penser en AngularJS quand on a l’habitude d’utiliser jQuery ? »

-----

1. ### KEZAKO ?
  PRÉREQUIS:
   - Html
   - Css
   - Javascript
  créer une single-page en full-HTML/CSS pour l'architecture.
2. ### jQuery VS AngularJS
  **jQuery code**
  dans le fichier .js
  ```
  $('.main-menu').dropdownMenu();
  ```
  **AngularJS**
  on le met directement dans le .html
    - permet de voir directement que l'élément et dynamique

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
il permet d'étendre .HTML avec des directives ` ng-directives `
  * ` ng-app ` = définie une AngularJS application
  * ` ng-model ` permet de lier la valeur du controleur HTML (input, select, textarea ...), aus données d'application
  * ` ng-bind ` lie les données d'application à la view HTML
  ```html
  <div ng-app="">
 	<p>Name: <input type="text" ng-model="name"></p>
 	<p ng-bind="name"></p>
  </div>
  ```
  ```
  ```

  ```
  ```
