<?php
/**
 * Created by PhpStorm.
 * User: adminHOC
 * Date: 11/06/2018
 * Time: 09:41
 */


$indexDefault = [
    'index.htm',
    'index.html',
    'index.php',
    'default.htm',
    'default.html',
    'default.php'
];

$fileImport = [
    // extension de fichier img
    'png',
    'jpg',
    'jpeg',
    'eps',
    'svg',
    'tiff',
    'eps',
    'pdf'
];


// recursive directory scan
function recursiveScan($dir,$indexDefault) {
    $tree = glob(rtrim($dir, '/') . '/*');
    if (is_array($tree)) {
        $i = 1;
        foreach($tree as $file) {
            if (is_dir($file)) {
                //echo $file . '<br/>';
                recursiveScan($file,$indexDefault);
            } elseif (is_file($file)) {
                if (preg_match('/.php$/',$file,$matches)){
                    ?>
                       <li> <a href=" <?=  $file ?>" target="_blank"> <?= filePathIndex(extractFileName($file),$indexDefault) ?></a> </li>
                    <?php
                }
            }
            $i++;
        }
    }
}


/*
 * @param $val est le fichier retourné par extractfile
 * @param $arrExte
 */
function filePathIndex($val,array $arrExte){
    if(in_array($val, $arrExte)){
        //echo $val;
        return $val;
    }
};

///filePathIndex("default.php",$indexDefault);

/*
 *
 */
function extractFileName($url){
    $separate = explode('/',$url); // on divise le lien tableau de valeurs
   $fileName = preg_replace('/.md$/','', end($separate));

   $fileName = pathinfo(end($separate),PATHINFO_FILENAME);
   echo $fileName;
   return $fileName;
}


//extractLinkName("./DOCUMENTATION/markdowntohtml.md");
?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Titre de la page</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
</head>
<body>
<h1>Sommaire</h1>
    <ul>
        <?php
        recursiveScan("./",$indexDefault);
        ?>
    </ul>
</body>
</html>