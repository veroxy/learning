# c#

fichier > app consloe (.NET framework) > choisir la dernière version 4.6>

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hell World");
            Console.ReadKey();
        }
    }
}
```

### Structure
- `using System.Collections.Generic;` comme en laravel on appel les espace_de_nom/class dont on a besoin
    - de la même façon que les `use` en java/php on appel no differente class


- notre propre espace de nom ici `namespace mon_d_espace_denom` Ce nom est également le nom de la Solution
- cette espace de nom contient une class Program
- qui elle même contient une methode `static void Main()` == accessible de l'exterieru (rappel JAVA)

### Afficher des éléménts dans la console
- `class Triangle : Shape {}` permet d'étendre une classe,  ici Triangle étend Shape.

-  mais une méthode peut être surcharger pour pouvoir le faire lui faire faire d'autre choses

il faut rendre `virtual void Ma_Class_Parent` pour que ses ennfants puissent l'heriter:
- new permet d'ecraser une méthode parent -  parcontre si l'on type par le parent la class de la meth(), la meth() utilisée sera celle du parent
    ```
     Triangle triangle = new Triangle();
                ((Shape)triangle).Display(); // 1. surcharge par casting de Trinagle en Shape(type parent)
                triangle.Display(); // cette méthode permet d'afficher la méthode de triangle mais écrase la meth Parent
                ```

    - override (polymorphisme JAVA) parcontre permettra de récupérer de récupérer la méth() parent mais aussi la meth()enfant


Il est possible de "By PASSER " cette façon de faire pour prévenir des problèmes d'évolution continu en créant une librairy qui encapsule des méthode afin de na pas faire évoluer des "manuellement" les class héritant d'un meth() parent .


## [setter / getter > appelé proprité de la class
[setter - getter - appelé proprité]("https://docs.microsoft.com/fr-fr/dotnet/csharp/programming-guide/classes-and-structs/using-properties")
> Les propriétés sont déclarées dans le bloc de classe en spécifiant le niveau d’accès du champ, suivi du type de la propriété, du nom de la propriété et d’un bloc de code qui déclare un accesseur get et/ou un accesseur set. Exemple :


## type générique List<T> (Collections)
[collection generique .NET](https://docs.microsoft.com/fr-fr/dotnet/standard/generics/collections)
si ce sont des class elles sont ditent abstraites