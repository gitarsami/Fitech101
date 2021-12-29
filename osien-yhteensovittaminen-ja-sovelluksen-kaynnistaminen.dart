// Kirjoita funktio kaynnista(lista), joka käynnistää kyselyohjelman.
// Kyselyohjelma tarjoaa käyttäjälle kolme komentoa: (1) kysymyksen lisäämisen,
// (2) kysymysten kysymisen, ja (3) ohjelman sammuttamisen. 
// Huom! Hyödynnä edellisissä osissa toteuttamiasi funktioita sovelluksen toiminnan toteuttamisessa.

// Komennot:
// 1: Lisää kysymys
// 2: Kysy kysymyksiä
// 3: Lopeta
// < 1
// Kirjoita kysymys.
// < Mikä on hauki englanniksi?
// Kirjoita vastaus.
// < pike
// Komennot:
// 1: Lisää kysymys
// 2: Kysy kysymyksiä
// 3: Lopeta
// < 1
// Kirjoita kysymys.
// < Mikä on ahven englanniksi?
// Kirjoita vastaus.
// < perch
// Komennot:
// 1: Lisää kysymys
// 2: Kysy kysymyksiä
// 3: Lopeta
// < 2
// Mikä on hauki englanniksi?
// < perch
// Väärin meni!
// Mikä on ahven englanniksi?
// < perch
// Oikein meni!
// Komennot:
// 1: Lisää kysymys
// 2: Kysy kysymyksiä
// 3: Lopeta
// < 3

import 'dart:io';

main() {
  var lista = [];
//  while(true) {
    kaynnista(lista);

//  }
  
}


kaynnista(lista) {
while(true) {
  print('Komennot:');
  print('1: Lisää kysymys');
  print('2: Kysy kysymyksiä');
  print('3: Lopeta');

  var valinta = stdin.readLineSync();

    if (valinta == '1') {
      lisaaKysymys(lista);
      } 
    if (valinta == '2') {
      kysyKaikki(lista);
      }
    if (valinta == '3') {
      break;
      }
    }
}

lisaaKysymys(lista) {
  print('');
  print('Kirjoita kysymys.');
  var kysymys = stdin.readLineSync();
  print('Kirjoita vastaus.');
  var vastaus = stdin.readLineSync();
  lista.add(Kysymys(kysymys, vastaus));
}

kysyKaikki(lista) {
//  print('Kysymykset:');
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

// // Mallivastaus:
// import 'dart:io';// 
// main() {
//   var lista = [];
//   kaynnista(lista);
// }// 
// kaynnista(lista) {
//   while(true) {
//     print('Komennot:');
//     print('1: Lisää kysymys');
//     print('2: Kysy kysymyksiä');
//     print('3: Lopeta');
//     var komento = stdin.readLineSync();
//     if (komento == '1') {
//       lisaaKysymys(lista);
//     } else if (komento == '2') {
//       kysyKaikki(lista);
//     } else if (komento == '3') {
//       break;
//     }
//   }
// }// 
// lisaaKysymys(lista) {
//   print('Kirjoita kysymys.');
//   var kysymys = stdin.readLineSync();
//   print('Kirjoita vastaus.');
//   var vastaus = stdin.readLineSync();
//   lista.add(Kysymys(kysymys, vastaus));
// }// 
// kysyKaikki(lista) {
//   for (var i = 0; i < lista.length; i++) {
//     kysy(lista[i]);
//   }
// }// 
// kysy(kysymys) {
//   print(kysymys.kysymys);
//   var vastaus = stdin.readLineSync();
//   if (vastaus == kysymys.vastaus) {
//     print('Oikein meni!');
//   } else {
//     print('Väärin meni!');
//   }
// }// 
// class Kysymys {
//   String kysymys;
//   String vastaus;// 
//   Kysymys(this.kysymys, this.vastaus);// 
//   toString() {
//     return '$kysymys (vastaus: $vastaus)';
//   }
// }// 