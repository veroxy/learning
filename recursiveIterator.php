<?php
/**
 * Created by PhpStorm.
 * User: verolafaverges
 * Date: 13/06/2018
 * Time: 22:29
 *
 *
 */
define('ROOT', 'http://' . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']);

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
/*
echo "<hr>";

$themedir = dirname(__FILE__).'/basketPoo';
//ECHO "them  ".$themedir;

$cssdir = $themedir.'/css';
$imagesdir = $themedir.'/images';

$iterator = new FilesystemIterator($themedir, FilesystemIterator::SKIP_DOTS);

foreach($iterator as $file) {
    //echo $file->getfilename()."<br />";

}
echo "<hr>";

$themedir = __DIR__.'';
$iterator = new RecursiveDirectoryIterator($themedir, FilesystemIterator::SKIP_DOTS);

foreach(new RecursiveIteratorIterator($iterator) as $file) {
    //echo $file->getfilename()."<br />";

}
echo "<hr>";
*/
class pngFileFilterIterator extends FilterIterator
{
    public $indexDefault = [
        'index.htm',
        'index.html',
        'index.php',
        'default.htm',
        'default.html',
        'default.php'
    ];

    public function filePathIndex($val){
        $arrExte = $this->indexDefault;
        if(in_array($val, $arrExte)){
            //echo $val;
            return $val;
        }
    }

    public function accept()
    {
        $sFileInfo = $this->getInnerIterator()->current();
        //echo $sFileInfo.__LINE__;
        return (preg_match('#\.php#', $sFileInfo));
    }

}
$themedir = __DIR__.'/';

$iterator = new RecursiveDirectoryIterator($themedir, FilesystemIterator::SKIP_DOTS);
echo $iterator;
$recursiveIterator = new RecursiveIteratorIterator($iterator);


echo ROOT;
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Tools for Projects</title>
    <link rel="stylesheet" href="css/sommaire.css">
</head>
<body>
<header>
    <h1>Projets et Outils</h1>
    <h3>Sommaire</h3>
    <blockquote>Vous trouverez ici mes projets en cours ou des outils que j'emploie dans mes travaux.</blockquote>
    <a href="http://www.veroxy.tk" target="_blank"> ici mon book</a>
</header>
<section>
    <ol>


<?php
        $themedir = './';
        $iterator = new RecursiveDirectoryIterator($themedir, FilesystemIterator::SKIP_DOTS);
        $recursiveIterator = new RecursiveIteratorIterator($iterator);
        foreach(new pngFileFilterIterator($recursiveIterator) as $file) {
            //echo $iterator.__LINE__."<br>";

            if (in_array($file->getfilename(), $indexDefault)) {
                echo "<li><a href='". $file->getPathname()/*$iterator->getPath()*/."' target='_blank'><h3>".$iterator."</h3></a></li>";
            }
        }
?>
    </ol>
</section>
<footer>
    <h5>all rights reserved ©veroxy -- Vero-Morane Lafaverges -- <a href="https://github.com/veroxy" target="_blank">Veroxy on github</a></h5>
</footer>
</body>
</html>

