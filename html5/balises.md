# HTML5 OU LA SÉMANTIQUE DES BALISES

---

### HTML5 et SÉMANTIQUE
Pour faire court HTML5 introduit dans de nouvelles balises et attributs(cf 'attributs utiles') qui ont des valeurs sémantiques bien plus fortes et donc plus apporte une meilleures accessibilité au développeur/intégrateur. Ce confort est un rééel plus. <br />
Là où nous faisions des forêts de `<div>` avec des `class=""` nous avons maintenant peut être une balise approprié.

| Balises     | Header Two     |
| :------------- | :------------- |
| body       | container principale corps     |
| header       | contient les éléments d'entête(menu, logo etc...)       |
| aside       | elements cliquable (archive, date, panier etc... -> WP)       |
| section      | est un block contenant "plusieurs articles" peut être unique ou multiple (catégorie, etc)   |
| article       | un souvent un élément récurrents (article, produits)       |
| footer       | est ce qui contient les élements en bas de page (map de navigation, contact, cgu etc...)       |

ce qui donne:
~~~html
<body>
  <!-- header contient des éléments récurrents sur toutes mes pages-->
  <header>
    <img scr="./lien/monimage.jpg">
    <h1>Nom de mon site </h1>
    <nav>
      Ici se trouve mon menu principale
      <ul>
        <li><a>item 1</a></li>
        <li><a>item 2</a></li>
        <li><a>item 3</a></li>
      </ul>
    </nav>
  </header>
  <aside>
    <div>
      <h4> Mon texte </h4>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna est laborum.</p>
    </div>
    <nav id="archive">
      <ul>
        <li><a>item 1</a></li>
        <li><a>item 2</a></li>
        <li><a>item 3</a></li>
      </ul>
    </nav>
  </aside>
  <section>
    <article>
      <figure>
        <img src="" alt="" />
        <figcaption>
          <p>Lorem ipsum dolor deserunt mollit anim id est laborum.</p>
        </figcaption>
      </figure>
    </article>
    <article>
      <div class="">
        <form class="" action="index.html" method="post">
          <input type="button" name="name" value="">
          <button type="button" name="button"></button>
        </form>
      </div>
    </article>
  </section>
  <!-- footer contient des éléments récurrents sur toutes mes pages-->
  <footer></footer>
</body>
~~~

si l'on test ce code on ne constatera pas grand chose de différent par rapport à l'emploi des `div` la différence est dans la re-lecture du code il sera plus simple de reprendre et comprendre ce code que s'il y avait des div de partout c'est ce que l'on appel la valeur "sémantique".
C'est pareil que lorsque l'on donne un nom à une id ou class, si vous les appelé `<div class="div1">` puis `<div class="div2">` ou à une variable en js `var variable = "ma variable";` il n'y a aucun intérêt dans le nommage.

C'est là le principal atout du HTML5 mais pas que.

### LES ATTRIBUT D'input
Je crois que c'est ma partie préférée, ça simplifie foncièrement l'emploi de formulaire pour l'intégrateur et ça prépare le terrain pour le développeur sans que le développeur ne se prenne la tête avec les spécfications "bizarres du webdesigner". C'est un gain de temps phénoménale.

<table>
  <thead>
    <tr>
      <th>Type=" "</th>
      <th>Attribut=" "</th>
    </tr>
  </thead>
  <tr>
    <td>
      <ul>
        <li>color</li>
        <li>date</li>
        <li>datetime</li>
        <li>datetime-local</li>
        <li>email</li>
        <li>month</li>
        <li>number</li>
        <li>range</li>
        <li>search</li>
        <li>tel</li>
        <li>time</li>
        <li>url</li>
        <li>week</li>
      </ul>
      </td>
      <td>
      <ul>
        <li>autocomplete</li>
        <li>autofocus</li>
        <li>form</li>
        <li>formaction</li>
        <li>formenctype</li>
        <li>formmethod</li>
        <li>formnovalidate</li>
        <li>formtarget</li>
        <li>height and width</li>
        <li>list</li>
        <li>min and max</li>
        <li>multiple</li>
        <li>pattern (regexp)</li>
        <li>placeholder</li>
        <li>required</li>
        <li>step</li>
      </ul>
    </td>
  </tr>
</table>

par exemple on veut l'email d'un utilisateur et qu'il est obligatoire, on va simplement indiquer que le input est de `type="email"` et qu'il requis `required`. Si l'utilisateur renseigne mal le mail (@ .) il a message d'erreur, si il est vide il renvois 'require'.
~~~html
  <form class="" action="submit.html" method="post">
    <input type="email" name="email" value="votre email" required>
    <input type="submit" name="submit" value="envoyer">
  </form>
~~~
