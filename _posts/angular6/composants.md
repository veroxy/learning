---
layout: page
title: composants angular
parent: angular 6
---
> > angular == **composant first**

- les composants ne contiennent pas nécessairement du code métier
    - il vaut mieux déléguer le code métier dans le service métier
    - cela permet d'avoir des composants plus léger
    - facilité de test
- les composants gèrent couche interface

## service == class (model -> Product/Formation)
- composant ou service
- injection de dépendances `@Injectable()` (JAVA: @Autowired) - est une syntaxe sémantique qui dit qu'il injecte un service (< NG 5)
    - composant dépenadant du <= **FRAMEWORK** => services qui en dépendent
    - il faut le déclarer dans le [provider : ApiSerce]


- (< NG 6)
    - il n'est plus nécessaire de le déclarer dasn le tableau de providers
```typscript
@Injectable({
    provideIn: 'root'
})
export class ProductService{}
```

## ROUTING
nécessite un module http*** qui se trouve le tableau d'imports dans l'app.module.ts
```typscript
 imports: [
    BrowserModule,
    HttpClienModule
  ],
  providers: [],
```

> voir projet ngrouting

## form

- nommer les nom de variable formControl (gestion des input) par le **`nomChamps`** + **`Ctrl`** pour


formbuilder : on initialise dans le construct au lieu du ngOninit()