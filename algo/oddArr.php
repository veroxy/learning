<?php
/**
 * Created by PhpStorm.
 * User: adminHOC
 * Date: 07/11/2018
 * Time: 17:15
 */

/**
 * un tableau de valeurs int, dont une valeur est unique
 */
// tant que la longueur du tableau < tableau.lenght
// pour chaque valeur semblable on stock la valeur dans un nouveau tableau sinon on l'envoie dans un nouveau tableau
$arr = [9, 9, 9, 6, 7, 4];

$arr1 = [1, 1, 2]; // 2
$arr2 = [4, 2, 2, 2, 2]; //4
$arr3 = [4, 4, 4, 1,1, 4, 4,5, 4, 8, 8]; //5

/*
function stray($arr)
{
    $lenght = count($arr);
    for ($i = 0; $i < $lenght; $i++)
    {
        for ($j = 0; $j< $lenght; $j++) {
            if ($i != $j && $arr[$i] == $arr[$j]) {
                break;
            }
        }
        if ($j == $lenght) {
            return $arr[$i];
        }
    }
    return -1;
}
*/
function stray1(array $arr) {
    return array_search(1, array_count_values($arr));
}

function stray (array $arr){

        $similars = array_count_values($arr); // compte le nombre de valeur similaire
       // echo "nb values : "; print_r($similars);
        $ranger = asort($similars);
        //echo "ranger  : ".$ranger. "<br>";
        return key($similars);
}
echo stray($arr1);
echo "<br>";
echo stray($arr2);
echo "<br>";

echo stray($arr3);
echo "<br>";

echo stray($arr);