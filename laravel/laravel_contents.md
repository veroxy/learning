# LARAVEL TPL
---

### views injections contenus

 1.  **Routing**
    -  dans `routes/web.php` dans lequel on fait ce qui suit:
    -  on fait les routes vers les view()s `resources/view/file.blade.php` qui sont dans le dossier public
    
 2. Création de model avec laravel
 ```
    php artisan make:model Model_Nom
    php artisan make:model Model_Nom -m (migrate)
 ```

3. les routes  
> les routes sont les différentes les **"liens / url"** vers lequels on va pointer   
```shell
    php artisan route:list  
    +--------+----------+----------+------+---------+--------------+
    | Domain | Method   | URI      | Name | Action  | Middleware   |
    +--------+----------+----------+------+---------+--------------+
    |        | GET|HEAD | /        |      | Closure | web          |
    |        | GET|HEAD | api/user |      | Closure | api,auth:api |
    +--------+----------+----------+------+---------+--------------+

```
```php
   Route::get('/insert',function(){
       DB::insert("INSERT INT posts(title,content) VALUES (?,?,?)",["php avec laravel", "Laravel est plutôt facile",1]);
   });
```

Les points d'interrogation permettent de dire que l'on renseignera les données plus tard :  Ici ce sont des champs texte et un id utilisateur qui sont attendu.

les ORM 
```
    
Route::get('/basicinsert',function(){
    $post =  new App\Post
});

ou metttre en haut use App\Post
```

4. fillable [en cours]