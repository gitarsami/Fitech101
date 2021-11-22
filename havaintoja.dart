// Kirjoita yksiparametrinen funktio havaintoja(String jsonMerkkijono), 
// joka saa parametrinaan lämpötilahavaintoja sisältävän JSON-muotoisen merkkijonon. 
// Lämpötilahavainnot ovat JSON-muotoisessa dokumentissa listana nimeen havainnot 
// liitettynä. Funktion tulee palauttaa havainnot-listassa olevien havaintojen lukumäärän.

import 'dart:convert';

main() {
    var jsonMerkkijono = '{"havainnot":[3,2,2,3,4,5,6,6]}';
    print(havaintoja(jsonMerkkijono));
}

havaintoja(String jsonMerkkijono) {
    var sanakirja = json.decode(jsonMerkkijono);
    var havainnot = sanakirja['havainnot'].length;
    return havainnot;
}