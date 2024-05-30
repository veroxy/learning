---
layout: page
title:  L'intégration web
parent: 
date:   2024-05-30 23:12
---

# L'intégration web

> l'integration web suis le même principe de le maquettage. Il est primordiale de structurer, hierarchiser son integration . Tant au niveau du HTML que des styles.


## des bonnes pratiques
1.  Sur le même processus que la charte graphique ou la bibliothèque des éléments graphique du webdesigner, onpeut se créer une un bibliothèque des éléments récurrents de notre site on appel ça un [UI KIT](/outils/GLOSSARY.md#ui-kit).

2. lorsque de la recepetion/debrief de la/les maquettes fournit par le designer il est important de verifier qu'il a fournit  **TOUS** les éléments nécessaires à l'integration. CTDR, que le dossier contient
   - des specifications suffisament completes, pas des paraphrases de ce qui est visible("carré rouge",  oui on voit que le carré est rouge): la façon dont les éléments interréagissent avec l'utilisateur selon comment on navigue. Dans le meilleur des cas on peut carréement vous produire un  [prototype](/outils/GLOSSARY.md#prototype-) animé
   - les éléments externes comme les typographies et pictogrammes
   - les images aux dimensions et résolutions nécessaires

3. en tant qu'integrateur, comme le designer graphique , il vous est necessaire fournir tous les éléments permettant de faciliter au maximum le travail de celui qui viendra après vous  que ce soit le developpeur ou votre succésseur. Car rappelez vous que vous n'êtes pas éternel et que celui qui reprendra votre travail vous haïra et vous poursuivra de jurons jusqu'en enfer si vouys lui rendez la vie didfficil. Mais au dela de cela , faites-le pour vous afin que lorsque vous repreniez ce projet ultérieurment il soit "bitable".

4. segementez vos fichiers, surtout les sass. Cela permet des refactorisation plus propres. C'est toujours plus comprehensible d'avoir un fichier qui traite uniquement des boutons que des boutons + overlays +  formulaires etc.

5. on a inventé le html5/css3 ce n'est pas pour la décoration. Il permet de structurer et rendre lisible votre code de site. Je defis qui-conque de lire du binaire sans entrainement renforcé, une page html c'est pareil; on nbe fait pas une performance de nerdy, c'est du balisage: plus vite on repère une balise, plus vite l'information peiut être traitée. Rappelez vous: Google aime la sémantique et la cohérence.

6. comme dans photoshop ou dans php/js/java faites en sorte que le nom de vos classes, identifiants, fonctions, animation soient parlant. Banissez les `class="btn2"` et préférez `class="btn-notifier"`.

## html


## css