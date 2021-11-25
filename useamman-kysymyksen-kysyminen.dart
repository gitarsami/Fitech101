// Kirjoita funktio kysyKaikki(lista), joka saa parametrinaan listan kysymyksiä.
// Funktion tulee kysyä käyttäjältä listan kysymykset yksi kerrallaan annetussa järjestyksessä.
// Tulostusmuodon tulee olla sama kuin aiemmin toteutetussa kysy-funktiossa.

import 'dart:io';

main() {
    var lista = [];
    lista.add(Kysymys('Mikä on hauki englanniksi?', 'pike'));
    lista.add(Kysymys('Mikä on ahven englanniksi?', 'perch'));
  //  print(lista.length);
    kysyKaikki(lista);    
}

kysyKaikki(lista) {
//  print(lista.length);
  
  for (int i = 0; i < lista.length; i++) {
    print(lista[i].kysymys);
    var vastaus = stdin.readLineSync();
    if (vastaus == lista[i].vastaus) {
      print('Oikein meni!');
    } else {
      print('Väärin meni!');
    }
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

// Mallivastaus:
main() {
  var lista = [];
  lista.add(Kysymys('Mikä on hauki englanniksi?', 'pike'));
  lista.add(Kysymys('Mikä on ahven englanniksi?', 'perch'));
  kysyKaikki(lista);
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
  String kysymys;
  String vastaus;

  Kysymys(this.kysymys, this.vastaus);

  toString() {
    return '$kysymys (vastaus: $vastaus)';
  }
}