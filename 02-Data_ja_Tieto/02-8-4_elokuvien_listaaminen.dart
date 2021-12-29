//Tehtäväpohjassa on valmiina edellisen osan ratkaisu. Lisää tässä sovellukseen 
// asynkroninen funktio listaa(kokoelma). Funktio listaa parametrina annetussa
// kokoelmassa olevat elokuvat aakkosjärjestyksessä. Katsotut elokuvat merkitään
// tulostuksessa ruksilla, katsomattomat ei (katso tulostusesimerkistä tarkempi muoto).

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
      await katso(kokoelma);
    } else if (komento == '3') {
        await listaa(kokoelma);
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


katso(elokuvat) async {
    print('Elokuvan nimi?');
    var elokuva = stdin.readLineSync();

    var kysely = Query(
        filter: MapFilter({
            'nimi': ValueFilter(elokuva)
            })
        );

    var dokumentit = await hae(elokuvat, kysely);

    for (var i = 0; i < dokumentit.length; i++) {
        var dokumentti = dokumentit[i].document;
        var data = dokumentit[i].data;
        await dokumentti.update(data: {
            'nimi': data['nimi'],
            'katsottu': true
            });
        }
      // var katsottu = await hae(elokuvat, kysely);
      // for (var i = 0; i < katsottu.length; i++) {
      //   var data1 = katsottu[i].data['nimi'];
      //   print(data1);
      //   }
}

listaa(elokuvat) async {
    var kysely = Query(
        sorter: PropertySorter('nimi', isDescending: false)
    );

    var dokumentit = await hae(elokuvat, kysely);

    for (var i = 0; i < dokumentit.length; i++) {
        var data = dokumentit[i].data;
        if(data['katsottu'] == true) {
            print('[X]' + ' ' + data['nimi']);
        } else print('[ ]' + ' ' + data['nimi']);
    }
}

// //Mallivastaus:
//   for (var i = 0; i < dokumentit.length; i++) {
//     var data = dokumentit[i].data;
//     if (data['katsottu']) {
//       print("[X] ${data['nimi']}");
//     } else {
//       print("[ ] ${data['nimi']}");
//     }
//   }

//yleiset funktiot
hae(elokuvat, kysely) async {
  var tulos = await elokuvat.search(query: kysely);
  return tulos.snapshots;
}