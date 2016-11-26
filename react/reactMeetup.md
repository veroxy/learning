# REACT MEETUP
> POLE PIXE 8/11/2016

---

### SUPPORTS
[react](http://slides.com/noel_paganelli/deck-1-2-3-4-5#/1 'react')
http://goratchet.com/components/
### REACT C'EST QUOI

FULL JAVASCRIPT => (réactivité, fluidité) => UX ++
COMPOSANT =>
SPA* == SINGLE PAGE APPLICATION => facilité pour 'l'export' vers une appStore


### JSX
-  est un langage compilé par Babel(library)
  'syntaxe' HTML en JAVASCRIPT => JSX

  CODE JSX (ES6)=> COMPILATION BABEL vers => JS (ES5) génère le => HTML
  Les éléments de contenus doivent être contenu dans un container exterieur.
  ~~~js
    <div>
        <h1>Mon application</h1>
        <p>Description de mon application</p>
    </div>
  ~~~

- methode :
  ~~~js
  ReactDOM.render(
    <div><h1>Laurette Guillois</h1></div>
    ,
    document.getElementById('container')
  );
  ~~~
  /!\ Ne de mettre de JQUERY / BOOTSTRAP AILLEURS

### OUTILLAGE

- library
  ~~~HTML
   <head>
     <meta charset="utf-8" />
     <script src="https://unpkg.com/react@15.3.2/dist/react.js"></script>
     <script src="https://unpkg.com/react-dom@15.3.2/dist/react-dom.js"></script>
     <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
     <script type="text/babel" src="./app.js"></script>
   </head>
  ~~~


### COMPOSANT
~~~js
/*creation de composant  ==*/ class App extends React.Component{
/* constructeur */constructor() {super();}
/* rendu */ render(){ return elementJSX;}
}
~~~

On fait des imbrication sous forme TREE.

### PROPRIÉTÉS
Propriété (=donnés) > composant (== souple pour communiquer)
`<
this.props.titre
<monComposant titre="Mon App" />` ===> `this.props.titre`;



var rows = this.props.products.map(function(product){
  return (<ProductRow
          product={product}
          />
         );
});
