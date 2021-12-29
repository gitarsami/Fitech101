//Tehtäväpohjassa on valmiina edellisen osan ratkaisu. Lisää tässä sovellukseen 
// asynkroninen funktio lisaa(kokoelma), joka kysyy käyttäjältä elokuvan nimeä 
// ja lisää sen tietokokoelmaan. Elokuvan nimeä kysytään muodossa Elokuvan nimi?. 
//Jokaisesta lisätystä elokuvasta tulee säilöä sekä nimi että tieto siitä, onko 
// elokuva katsottu. Oletuksena elokuvaa ei ole katsottu.

import 'dart:io';

import 'package:database/database.dart';
import 'package:database/filter.dart';
import 'package:database/browser.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
//    var tietokanta = BrowserDatabaseAdapter().database();
    var elokuvat = tietokanta.collection('elokuvat');
    kaynnista(elokuvat);
//    lisaa(elokuvat);
}


kaynnista(kokoelma) async {
    while(true) {
        print('');
        print('Komennot:');
        print('1: Lisää elokuva');
        print('2: Katso elokuva');
        print('3: Listaa elokuvat');
        print('4: Poista katsotut');
        print('5: Lopeta');

    var komento = stdin.readLineSync();
    if (komento == '1') {
      await lisaa(kokoelma);
    } else if (komento == '2') {
//      await listaa(kokoelma);
    } else if (komento == '3') {
//      await poista(kokoelma);
    } else if (komento == '4') {
//      await kasvata(kokoelma);
    } else if (komento == '5') {
      break;
    } else {
      print('Tuntematon komento!');
    }
  }
}

lisaa(elokuvat) async {
    print('Elokuvan nimi?');
    var elokuva = stdin.readLineSync();
    await elokuvat.insert(data: {
        'nimi': elokuva,
        'katsottu': false
    });
}