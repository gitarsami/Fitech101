//Luo yksiparametrinen funktio nimet, joka saa parametrinaan JSON-muotoisen
// merkkijonon. Funktion tulee muuntaa merkkijono JSON-muotoiseksi dokumentiksi
// ja palauttaa JSON-dokumentin sisältämän muuttujan nimet arvon.
//Esimerkiksi kutsu nimet('{"nimet":["Ada","Blaise"]}'); palauttaa listan, joka
// sisältää merkkijonot "Ada" ja "Blaise".
import 'dart:convert';

main() {
    print(nimet('{"nimet":["Ada","Blaise"]}'));
}

nimet(tyyppi) {
    var nimet = jsonDecode(tyyppi)['nimet'];
    return(nimet);

}

// Mallivastaus:
// nimet(jsonMerkkijono) {
//   var data = jsonDecode(jsonMerkkijono);
//   return data['nimet'];
// }
