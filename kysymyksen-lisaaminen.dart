// Kirjoita funktio lisaaKysymys(lista), joka saa parametrinaan listan kysymyksiä.
// Funktion tulee kysyä käyttäjältä kysymystekstinä "Kirjoita kysymys." ja vastaustekstinä "Kirjoita vastaus.".
// Käyttäjän syötteiden perusteella luodaan kysymysolio, joka lisätään listalle.

import 'dart:io';

main() {
  var lista = [];


  lisaaKysymys(lista);
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

lisaaKysymys(lista) {
    print('Kirjoita kysymys.');
    var syote1 = stdin.readLineSync();
    print('Kirjoita vastaus.');
    var syote2 = stdin.readLineSync();
    lista.add(Kysymys('$syote1', '$syote2'));
    print('');
    print('Kysymykset:');
    for (var i = 0; i < lista.length; i++) {
        print(lista[i]);
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


// Mallivastaus:
import 'dart:io';

main() {
  var lista = [];
  lista.add(Kysymys('Mikä on ahven englanniksi?', 'perch'));
  lisaaKysymys(lista);

  print('');
  print('Kysymykset:');
  for (var i = 0; i < lista.length; i++) {
    print(lista[i]);
  }
}

lisaaKysymys(lista) {
  print('Kirjoita kysymys.');
  var kysymys = stdin.readLineSync();
  print('Kirjoita vastaus.');
  var vastaus = stdin.readLineSync();
  lista.add(Kysymys(kysymys, vastaus));
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