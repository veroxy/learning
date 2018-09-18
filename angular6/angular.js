/**
 * Created by adminHOC on 17/09/2018.
 */
function foo (param1) {
    console.log("ret nb args : " + arguments.length);
}

foo('tests');
foo('tests',1);
foo('tests',null,.3);

// AUTO-INVOQUE
(function (window){
    var LEGAL_AGE = 18;
    var beerService = {}; // var private

    beerService.beerServing = function (age){
        age = age || LEGAL_AGE;
        if(age < LEGAL_AGE){
            return;
        }
        window.beerService = beerService;
    }
})(window);
beerService.beerServing(27);