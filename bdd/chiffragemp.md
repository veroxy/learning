#Chiffrage mot de passe

1. ### md5
md5 est un système de hasging et est systemique, ctd que 

2. ### SHA1 mort

3. ### bsrypt
est l'un des dernier systeme cryptage les plus sécurisé -  il ne nécessite plus de salt car cela est intégré dans la méthode php
~~~php
   $options = [
       'cost' => 12,
   ];
   echo password_hash("rasmuslerdorf", PASSWORD_BCRYPT, $options);
   
~~~
> $2y$12$QjSH496pcT5CEbzjD/vtVeH03tfHKFy36d4J0Ltp3lRtee9HDxY3K

Password test et hasging
- http://php.net/manual/fr/function.password-verify.php
- http://php.net/manual/fr/function.password-hash.php


4. rot alphabet
est un algorhitme systematique > il est facile à déchiffré




on peut aussi le system PASSWORD_DEFAULT pour que php choisisse de lui même le meilleur système de cryptage de mon 
