MVC
-Model
-View
-Controller

Schemas:
mode <-> controller<-[viewMovdel]->view(LAYOUT contient view)

NEW PROJECT
fichier > nouveau > project > web -> app ASP.NET(.NET framework) > "MVC"  > reinc cocher

Struct project

App_start
- bundleconfig -> sont les insert de fichiers qui dvond

le system de de MVC DE ASP.NET est vraiment similaire
- NameController hérite de Controlller
```c#
   public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
```
- le routage