// Kirjoita funktio sanakirjaksi(jsonMerkkijono), joka saa parametrinaan 
// JSON-muotoisen merkkijonon. Funktion tulee palauttaa JSON-muotoisesta 
// merkkijonosta muodostettu sanakirja.

import 'dart:convert';

main() {
    String jsonMerkkijono = '''{
    "nimi":"Ada Lovelace", 
    "syntymavuosi": 1815,
    "supertaidot": ["matematiikka", "ohjelmointi"]
}''';
    print(sanakirjaksi(jsonMerkkijono));
} 

sanakirjaksi(jsonMerkkijono) {
    var sanakirja = json.decode(jsonMerkkijono);
    return sanakirja;
//    return sanakirja['nimi'];
}