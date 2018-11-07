<?php
/**
 * Created by PhpStorm.
 * User: adminHOC
 * Date: 07/11/2018
 * Time: 18:28
 */

/**
 * une fonction regarde si les valeurs d'une errors est comprise dans l' $interval [a - m]
 * dans toutes sa longueur de string strlen($s)
 * la valeur de retour est le nombre de lettre hors $interval sur la strlen($s)
 */
//$s="aaabbbbhaijjjm";
//error_printer(s) => "0/14";

$s="aaaxbbbbyyhwawiwjjjwwm";


//error_printer(s) => "8/22";
/*
function printerError($s) {
    $lenght = strlen($s);
    $interval = range("a","m");
    $vals = array_count_values(str_split($s));
    $errors = [];

    foreach ($vals as $value => $v){
        $end = !in_array($value,$interval ) ? array_push($errors,$v) : "";
    }
    $errors = array_sum($errors);
    return $errors."/".$lenght;
}

*/
function printerError($s) {
    $vals = array_count_values(str_split($s));
    $errors = [];
    foreach ($vals as $value => $v){
        $end = !in_array($value,range("a","m") ) ? array_push($errors,$v) : "";
    }
    return array_sum($errors)."/".strlen($s);
}

function printerError2($s) {
    $pattern = "/([^a-m]){1}/i";
    preg_match_all($pattern,$s,$match);
    return count($match[0]).'/'.strlen($s);
}

function printerError3($s) {
    $array = str_split($s);
    $nb_total = count($array);
    $nb_error = 0;
    foreach($array as $tab) {
        if (preg_match("/[n-z]/", $tab)) {
            $nb_error ++;
        }
    }
    return $nb_error . "/" . $nb_total;
}

$s1="aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz";
//revTest(printerError($s), "3/56");
$s2 = "kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz";
//revTest(printerError($s), "6/60");
$s3 = "kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyzuuuuu";
//revTest(printerError($s) , "11/65");

echo printerError($s)."<br>";
echo printerError($s1)."<br>";
echo printerError($s2)."<br>";
echo printerError($s3)."<br>";