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
        foreach($tree as $file) {
            if (is_dir($file)) {
                //echo $file . '<br/>';
                recursiveScan($file,$indexDefault);
            } elseif (is_file($file)) {
                if (preg_match('/.php$/',$file,$matches)){
                    echo  "<a href='" .$file ."'> ". filePathIndex(extractFileName($file),$indexDefault) ."</a> <br/>";
                }
               // echo preg_match('/$.sql/',$file);
                //echo $file . '<br/>';
            }
        }
    }
}

recursiveScan("./",$indexDefault);
/*
 * @param $val est le fichier retourné par extractfile
 * @param $arrExte
 */
function filePathIndex($val,array $arrExte){
    if(in_array($val, $arrExte)){
        //echo $val;
        return $val;
    }else{
        return "ERROR" . __FILE__;
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
