# JQUERY AJAX

> il y a ceux qui diront que comme jquery est du pur open source les métthodes qui découle de celui sont instables.
Alors de cette façon ok mais demandez aux 2/3 des entreprises qui emplois Jquery pourquoi il demande une maitrise de Jquery plutôt que de Javascript pur... ALLEZ VOIR LA DOC DE JQUERY [jquery](jquery/jquery.md).

---

### syntax
Le bonnheur de Jquery Ajax c'est la syntax : pas d'instances de 3 lignes pour récupérer "UN TRUC". pour déclarer que le l'on fait du ajax il est parcontre nécessaire d'appeler la bbthèque jquery.js mais comme nous utilisons déjà jquery ça n'en fait qu'un
~~~Javascript
  $(window).ready(function(){
    // Selecteur sur la la balise <a> enfant de <div> qui contient lui-même les éléments à récupérer
    var link = $('.event a');
    console.log(link);
    // On récupère la longueur de 'link' afin de connaître le nombre d'élélements à cliquer et on envoie ax_send
    for (var i = 0; i < link.length; i++) {
      link[i].addEventListener('click', ax_send);
    }
    function ax_send(e){
      // alert("ok je rentre dans click ");
      var id = this.id.substring(this.id.search(/[0-9]+/g), this.id.length); // le 'this' permet de récupérer la valeur
      console.log(this.id);
      var summaryid = $("#summary"+id).text();
      var creatorid = $("#creator"+id).text();
      var datestartid = $("#datestart"+id).text();
      var dateendid = $("#dateend"+id).text();

      // Objet qui prends comme propriété le nom dans la bdd et en valeur le innerText de l'ID == var+id
      var postDatas = {summary: summaryid, creator: creatorid, datestart: datestartid, dateend: dateendid};
      console.log(postDatas);
        $.ajax({
          type: "POST",
          // on envois l'objet avec ses propriété
          data: postDatas,
          // on appel le fichier script.php dans lequel ser traiter l'objet postDatas
          url: "senddatas.php",
          // la fonction prend en paramètre les data et les alert ( ici pour pouvoir les détailler on convertie les donnés en string)
          success: function(data){
            alert(data);
            console.log(JSON.stringify(postDatas));
        },
        //  sinon la function ajax renvois une erreur XMLHttpRequest,  le text et où l'erreur se trouve.
          error: function(XMLHttpRequest, textStatus, errorThrown){
            alert("Status: " + textStatus + "Error: " + errorThrown);
          }
      });
      return false;
    }
  });
~~~
