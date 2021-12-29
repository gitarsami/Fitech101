//Tässä tehtäväsarjassa luodaan elokuvien hallintaan tarkoitettu sovellus. 
//Luo ensin asynkroninen funktio kaynnista(kokoelma), joka käynnistää sovelluksen.
//Funktion kutsuminen käynnistää sovelluksen, tulostaa valikon, ja jää odottamaan 
//käyttäjän syötettä. Valikon vaihtoehdot 1-4 eivät tee vielä mitään, ja 
// vaihtoehto 5 lopettaa ohjelman suorituksen. 

import 'dart:io';

import 'package:database/database.dart';
import 'package:database/filter.dart';
import 'package:database/browser.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
//    var tietokanta = BrowserDatabaseAdapter().database();
    var elokuvat = tietokanta.collection('elokuvat');
    kaynnista(elokuvat);  
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
//      await lisaa(kokoelma);
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