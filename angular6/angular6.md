# ANGULAR 6 + GOOGLE
----
## DOCUMENTATION
- [angular.io](https://angular.io/guide/quickstart) > [](https://angular.io/api)
- [angular 2](http://www.learn-angular.fr/angular-2/)
## HISTOIRE
- 2009 AngularJs > Misko Hevery > Google
- 2010 -> 2012  > v1.xxxx == AngularJs
- 2014 -> 2016 > V2 == Angular
    * TypeScript
    * abondant de JQuery
    * ECMACScript 6
    * abondant des choses
- tous les 6 mois une MAJ est faite

----

## Principe
> on cré des composant qui seront interprétés par le framework
- SPA Single Page Application
- apporche modulaire avec un couplage faible (evite les pbs en cascade lors de la modification d'un composant)


## INSTALLATION
- ** via cli **
on install la dépendance d'angular en global
puis dans le dossier on lance le serveur qui nous renvoie vers le localhost:4200

```shell
    npm install -g @angular/cli
    ng new nomDeMonProjet
    cd nomDeMonProjet
    ng serve
```

### création de composant & class
> on peut créer les composant qui vont être des sortes de controllers(.ts) de view html(.html) et des class qui pourront décrire nos éléments
```shell
    ng generate component interpolate
    ng generate class ./class/Product
```

- les composant permettent de gérer le rendu html, soit l'interpolation du DOM il ne renvoie rien d'autre
```typescript
export class InterpolateComponent implements OnInit {
  productName:string = "Milk Bottle";
  designer:string = "Droog";
uct;

  getTitle():string {
      return `Function ${this.productName} by ${this.designer}`;
  }

  // binding []
    isHidden : boolean = true;


  constructor() { }
  ngOnInit() {
      setInterval(()=>{
          this.isHidden = !this.isHidden;
      },1000);
    }

}
```

- les class / object permettenr d'avoir une definition d'un élément (Formation, Voiture), qui aura des variables,  des fonctions appelé ou non dans le constructeur.
```typescript
export default class Product {
    constructor(
        public name:string,
        public designer:string,
        public description:string
    ){

    }
}
```

En revanche on crée une instance de la Class dans le composant
```typescript


  product:Product = new Product(this.productName,this.designer,this.productDescription);

  productUndefined:Product;

    ngOnInit() {
      setTimeout(()=>{
          this.productUndefined=new Product("bEER caps neekles","bEER caps neekles","bEER caps neekles")
      },5000)
  }

```

