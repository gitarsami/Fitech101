//Luo yksiparametrinen funktio nimi, joka saa parametrinaan JSON-muotoisen 
// merkkijonon. Funktion tulee muuntaa merkkijono JSON-muotoiseksi dokumentiksi 
// ja palauttaa JSON-dokumentin sisältämän muuttujan nimi arvo.
//Esimerkiksi kutsu print(nimi('{"nimi":"Blaise"}')); tulostaa merkkijonon Blaise.

import 'dart:convert';

main() async {
  print(nimi('{"nimi":"Ada"}'));
}

nimi(tyyppi) {
  var nimi = jsonDecode(tyyppi)['nimi'];
 
  return(nimi);
}

// Mallivastaus:
// nimi(jsonMerkkijono) {
//   var data = jsonDecode(jsonMerkkijono);
//   return data['nimi'];
// }