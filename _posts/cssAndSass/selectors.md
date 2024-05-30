---
layout: page
title: selectors css
parent: css
--- 
# selecteurs css
>` les selecteurs css sont les elements que l'on peut atteindre via le css.
ils peuvent soient des
- balises
- class
- identifiants
- des pseudos class - atttribUTS ("data-toggle", [class^="nav-"])
----

### Selecteurs de référence
|SELECTEUR | EXEMPLE | DESCRIPTION |
|:---|:---:|:---
|.class | .intro | Selectionne tous elements avec  class="intro"
|#id | #firstname | Selectionne le element with id="firstname"
|* | * | Selectionne tous les elements
| element | p | Selectionne tous les  `<p>`
| element,element | div, p | Selectionne tous les `<div>`  et tous les `<p>` 
| element element | div p | Selectionne tous les `<p>`  dans  `<div>`
| element>element | div > p | Selectionne tous les `<p>`  quand le parent est `<div>`
| element+element | div + p | Selectionne tous les `<p>`  qui sont directement derrière un `<div>`
| element1~element2 | p ~ ul | Selectionne chaque `<ul>` précédé d'un  `<p>`
| [attribute] | [target] | Selectionne tous elements avec  a target attribute
| [attribute=value] | [target=_blank] | Selectionne tous elements avec  `target="_blank"
| [attribute~=value] | [title~=flower] | Selectionne tous elements avec  un attribut `title` contenant le mot "flower"
| [attribute|=value] | [lang|=en] | Selectionne tous elements avec une attribut `lang` qui commence par "en"
| [attribute^=value] | a[href^="https"] | Selectionne chaque `<a>` qui possède un attribut `href` commençant par `"https"`
| [attribute$=value] | a[href$=".pdf"] | Selectionne chaque `<a>`  qui possède un attribut `href` se terminant par `".pdf"`
| [attribute*=value] | a[href*="w3schools"] | Selectionne chaque `<a> qui possède un attribut `href` contenant le la substitution  "w3schools"
| :active | a| :active | Selectionne le lien actif
| ::after | p::after | Insert du contenu après chaque `<p>`
| ::before | p::before | Insert du contenu avant chaque`<p>`
| :checked | input:checked | Selectionne `chaquechecked <input>`
| :default | input:default | Selectionne le default `<input>`
| :disabled | input:disabled | Selectionne chaque `<input>` désactivé
| :empty | p:empty | Selectionne chaque `<p>` qui n'a pas d'enfant (incluant les noeuds de text)
| :enabled | input:enabled | Selectionne chaque `<input>` activité
| :first-child | p:first-child | Selectionne chaque `<p>` qui est le premier enfant de son parent
| ::first-letter | p::first-letter | Selectionne le première lettre de chaque  `<p>`
| ::first-line | p::first-line | Selectionne la première ligne de chaque  `<p>`
| :first-of-type | p:first-of-type | Selectionne chaque `<p>`  qui est le premier `<p>` de son parent
| :focus | input:focus | Selectionne le input` qui est focussé
| :hover | a:hover | Selectionne `links` on mouse over
| :in-range | input:in-range | Selectionne tous les `input` dont la valeur est comprise dans l'interval indiqué
| :indeterminate | input:indeterminate | Selectionne tous les `input`  qui sont dans un état indéfini
| :invalid | input:invalid | Selectionne tous les input qui ont une valeur invalide
| :lang(language) | p:lang(it) | Selectionne chaque `<p>` element with a lang attribute equal to "it" (Italian) qui on un attribut
| :last-child | p:last-child | Selectionne chaque `<p>` element that is the last child de son parent 
| :last-of-type | p:last-of-type | Selectionne chaque `<p>` qui est le dernier  `<p>` de son parent
| :link | a:link | Selectionne tous les `unvisited` lien
| :not(selector) | :not(p) | Selectionne chaque qui n'est  `<p>`
| :nth-child(n) | p:nth-child(2) | Selectionne chaque `<p>` qui est le deuxième enfant de son parent
| :nth-last-child(n) | p:nth-last-child(2) | Selectionne chaque `<p>` element that is the second child de son parent , counting from the last child
| :nth-last-of-type(n) | p:nth-last-of-type(2) | Selectionne chaque `<p>` qui est le second `<p>` de son parent, en partant / en comptant du dernierr enfant
| :nth-of-type(n) | p:nth-of-type(2) | Selectionne chaque `<p>` qui est le second `<p>` de son parent 
| :only-of-type | p:only-of-type | Selectionne chaque `<p>` qui est le seul `<p>` de son parent 
| ::only-child | p:only-child | Selectionne chaque `<p>` qui est le seul enfant de son parent
| :optional | input:optional | Selectionne les `input`qui ne sont n'ont pas l'atribut `required`/ qui sont donc optionnels
| :out-of-range | input:out-of-range | Selectionne les `input` qui sont hors de l'interval indiqué
| ::placeholder | input::placeholder | Selectionne les `input` qui sont avec un placeholder
| :read-only | input:read-only | Selectionne les `input` qui ont un attribut "readonly" spécifié
| :read-write | input:read-write | Selectionne les `input` qui ont un attribut "readonly" non spécifié
| :root | :root | Selectionne le document's root
| ::selection | ::selection | Selectionne la portion d'un element qui a été selectionné par un utilisateur
| :target | #news:target | Selects le current active #news element (clicked on a URL containing that anchor name)
| :valid | input:valid | Selectionne tous les `input` avec une valeur valide
| :visited | a:visited | Selectionne tous les lien links