// Kirjoita funktio kaynnista(lista), joka käynnistää kyselyohjelman.
// Kyselyohjelma tarjoaa käyttäjälle kolme komentoa: (1) kysymyksen lisäämisen,
// (2) kysymysten kysymisen, ja (3) ohjelman sammuttamisen. 
// Huom! Hyödynnä edellisissä osissa toteuttamiasi funktioita sovelluksen toiminnan toteuttamisessa.

import 'dart:io';

main() {
    var lista = [];
//    menu();
    print('Komennot:');
    print('1: Lisää kysymys');
    print('2: Kysy kysymyksiä');
    print('3: Lopeta');
    
    var valinta = stdin.readLineSync();
    while(valinta != '3') {
        if(valinta == '1') {
            //lisaaKysymys(lista);
        } 
        if(valinta == '2') {
         
         //   kysyKaikki(lista);
        }
    }
}

//  print('');
//  print('Kysymykset:');
//  for (var i = 0; i < lista.length; i++) {
//    print(lista[i]);
//  }


//menu() {
//    print('Komennot:');
//    print('1: Lisää kysymys');
//    print('2: Kysy kysymyksiä');
//    print('3: Lopeta');
//    
//    var valinta = stdin.readLineSync();
//    while(valinta != '3') {
//        if(valinta == '1') {
//            lisaaKysymys(lista);
//        } 
//        if(valinta == '2') {
//            kysyKaikki(lista);
//        }
//    }
//}

lisaaKysymys(lista) {
  print('Kirjoita kysymys.');
  var kysymys = stdin.readLineSync();
  print('Kirjoita vastaus.');
  var vastaus = stdin.readLineSync();
  lista.add(Kysymys(kysymys, vastaus));
//  menu();
}

kysyKaikki(lista) {
  for (var i = 0; i < lista.length; i++) {
    kysy(lista[i]);
  }
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
  String? kysymys;
  String? vastaus;

  Kysymys(this.kysymys, this.vastaus);

  toString() {
    return '$kysymys (vastaus: $vastaus)';
  }
}
