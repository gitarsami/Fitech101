// Kirjoita funktio kysy(kysymys), joka saa parametrinaan kysymysolion.
// Funktiossa tulee kysyä käyttäjältä parametrina annettu kysymys (eli tulostaa kysymys-olion kysymys-muuttujan arvo),
// lukea käyttäjän vastaus, ja kertoa vastauksen perusteella oliko käyttäjän vastaus oikein
// (eli onko käyttäjän syöttämä vastaus sama kuin kysymys-olion vastaus-muuttujan arvo).
// Mikäli vastaus on oikein, ohjelma tulostaa Oikein meni!, muulloin ohjelma tulostaa Väärin meni!.

import 'dart:io';
//
//main() {
//    var kysymys = Kysymys('Mikä on kakasi englanniksi?', 'two');
//    // olion asetus
//    kysy(kysymys);
//    // funtio kutsu
//}
//
//kysy(kysymys) { //funktio
//    print(kysymys);
//    // tulostaa kysymyksen (kysmys-olion kysymys-muuttujan arvon)
//    //var vastaus = Vastaus(stdin.readLineSync() ??'');
//    //// lukee komentoriviltä vastauksen ja asettaa vastaus-olion
//    
//    var vastaus = stdin.readLineSync() ??'';
//    var oikeavastaus = kysymys.vaste();
//    // muuttajaan arvo kysymys luokan funktiosta vaste
//    //print('$oikeavastaus');
//    //// tulostaa oikean vastauksen
//
////    String oletusvastaus = 'pike';
////    print(oletusvastaus + vastaus);
//
//    if(vastaus == oikeavastaus) {
//        print('Oikein!');
//    } else {
//        print('Väärin!');
//    }
//    //print(vastaus);
//}
//
//class Kysymys {
//  String kysymys;
//  String oletusvastaus;
//  
//  Kysymys(this.kysymys,this.oletusvastaus);
//
//  vaste() {
//      return oletusvastaus;
//  }
////// yllä oleva palauttaa oletusvastauksen
//
//  toString() {
//    return '$kysymys';
//  }
//}


// Mallivastaus

main() {
  var kysymys = Kysymys('Mikä on hauki englanniksi?', 'pike');
  kysy(kysymys);
}

kysy(kysymys) {
  print(kysymys.kysymys);
  var vastaus = stdin.readLineSync();
  if (vastaus == kysymys.vastaus) {
    print('Oikein meni!');
  } else {
    print('Väärin meni!');
  }
}

class Kysymys {
  String kysymys;
  String vastaus;

  Kysymys(this.kysymys, this.vastaus);

  toString() {
    return '$kysymys (vastaus: $vastaus)';
  }
}