# LARAVEL TPL
---

### views injections contenus
 1.  **Routing**
    -  dans `routes/web.php` dans lequel on fait ce qui suit:
    -  on fait les routes vers les view()s `resources/view/file.blade.php` 
    
 2. Création de model avec laravel
 ~~~
    php artisan make:model Model_Nom
    php artisan make:model Model_Nom -m (migrate)
 ~~~

3. les routes
~~~
   Route::get('/insert',function(){
       DB::insert("INSERT INT posts(title,content) VALUES (?,?,?)",["php avec laravel", "Laravel est plutôt facile",1]);
   });
~~~

Les points d'interrogation permettent de dire que l'on renseignera les données plus tard :  Ici ce sont des champs texte et un id utilisateur qui sont attendu.


les ORM 
~~~
    
Route::get('/basicinsert',function(){
    $post =  new App\Post
});

ou metttre en haut use App\Post
~~~

4. fillable