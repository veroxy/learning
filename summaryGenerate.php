<?php
/**
 * Created by PhpStorm.
 * User: adminHOC
 * Date: 11/06/2018
 * Time: 09:41
 */

// recursive directory scan
function recursiveScan($dir) {
    $tree = glob(rtrim($dir, '/') . '/*');
    if (is_array($tree)) {
        foreach($tree as $file) {
            if (is_dir($file)) {
                echo $file . '<br/>';
                recursiveScan($file);
            } elseif (is_file($file)) {

                if (preg_match('/.md$/',$file,$matches)){
                    echo  "<a href='" .$file ."'> ". preg_replace('/.md$/','', $file) ."</a> <br/>";
                }
               // echo preg_match('/$.sql/',$file);
                //echo $file . '<br/>';
            }
        }
    }
}
recursiveScan("./");

function createSummary(){

}