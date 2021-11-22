// Kirjoita yksiparametrinen funktio vuodet(String merkkijono), 
// joka saa parametrinaan vuosilukuja sisältävän merkkijonon. 
// Kukin vuosiluku on merkkijonossa omalla rivillään. 
// Funktion vuodet tulee pilkkoa merkkijono osiin ja tulostaa vain ne vuosiluvut, 
// joiden arvo on suurempi kuin 2000.

//main() {
//    String merkkijono = '''
//1974
//1977
//1996
//2003
//2000
//2021''';
//    vuodet(merkkijono);
//}
//
//vuodet(String merkkijono) {
//    var rivit = merkkijono.split('\n');
//    for (var i = 0; i < rivit.length; i++) {
//        int vuosi = int.parse(rivit[i]);
//        if (vuosi > 2000) {
//            print(vuosi);
//        }
//    }
//
//}

//Mallivastaus:
main() {
    String merkkijono = '''
1974
1977
1996
2003
2000
2021''';
vuodet(merkkijono);
}

vuodet(String merkkijono) {
  var rivit = merkkijono.split('\n');
  for (var i = 0; i < rivit.length; i++) {
    var rivi = rivit[i];

    var luku = int.parse(rivi);
    if (luku <= 2000) {
      continue; 
    }

    print(luku);
  }
}