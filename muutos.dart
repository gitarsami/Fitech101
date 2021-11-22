// Kirjoita yksiparametrinen funktio muutos(String jsonMerkkijono), joka saa parametrinaan
// lämpötilahavaintoja sisältävän JSON-muotoisen merkkijonon. Lämpötilahavainnot ovat JSON
// -muotoisessa dokumentissa listana nimeen havainnot liitettynä. 
// Mikäli viimeinen havainnot-listalla oleva havainto on lämpimämpi kuin viimeistä edeltävä
// havainto, tulee funktion palauttaa merkkijono "lämpenee". 
// Mikäli viimeinen havainnot-listalla oleva havainto on viileämpi kuin viimeistä edeltävä
// havainto, tulee funktion palauttaa merkkijono "viilenee". 
// Mikäli lista on tyhjä, siinä on vain 1 arvo, tai listan kaksi viimeistä arvoa ovat samat,
// tulee funktion palauttaa merkkijono "epävarmaa".
//
// {"havainnot":[3,2,2,3,4,5,6,6]}
// Mikäli funktio saa parametrinaan yllä olevan merkkijonon, tulee sen palauttaa merkkijono
// "epävarmaa". Vinkki: listan viimeinen arvo on indeksissä lista.length - 1.



import 'dart:convert';

main() {
    var jsonMerkkijono = '{"havainnot":[3,2,2,3,4,5,6,8]}';
    print(muutos(jsonMerkkijono));
}

muutos(String jsonMerkkijono) {
    var sanakirja = json.decode(jsonMerkkijono);
    var ennuste = sanakirja['havainnot'];
    //print(ennuste.length);
    if (ennuste.length == 0||ennuste.length == 1) {
        return 'epävarmaa';
    } else if (ennuste[ennuste.length-1] == ennuste[ennuste.length-2]) {
        return 'epävarmaa';
    } else if (ennuste[ennuste.length-1] > ennuste[ennuste.length-2]) {
        return 'lämpenee';
    } else if (ennuste[ennuste.length-1] < ennuste[ennuste.length-2]) {
        return 'viilenee';
    } 
}


//Mallivastaus:
// muutos(String jsonMerkkijono) {
//   var sanakirja = json.decode(jsonMerkkijono);
//   var lista = sanakirja['havainnot'];
//   if (lista.length < 2) {
//     return 'epävarmaa';
//   }
// 
//   var vika = lista[lista.length - 1];
//   var tokavika = lista[lista.length - 2];
// 
//   if (vika == tokavika) {
//     return 'epävarmaa';
//   } else if (vika > tokavika) {
//     return 'lämpenee';
//   } else {
//     return 'viilenee';
//   }
// }