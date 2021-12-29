import 'package:database/database.dart';
import 'dart:io';
import 'package:database/filter.dart';

main() {
  var tietokanta = MemoryDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('vapaaehtoiset');
  kaynnista(kokoelma);
}

kaynnista(kokoelma) async {
  while(true) {
    print('');
    print('Komennot:');
    print('1: Lisää vapaaehtoinen');
    print('2: Listaa vapaaehtoiset');
    print('3: Poista vapaaehtoinen');
    print('4: Kasvata avustuskerta');
    print('5: Lopeta');

    var komento = stdin.readLineSync();
    if (komento == '1') {
      await lisaa(kokoelma);
    } else if (komento == '2') {
      await listaa(kokoelma);
    } else if (komento == '3') {
      await poista(kokoelma);
    } else if (komento == '4') {
      await kasvata(kokoelma);
    } else if (komento == '5') {
      break;
    } else {
      print('Tuntematon komento!');
    }
  }
}

lisaa(kokoelma) async {
  var nimi = kysy('Syötä nimi');
  var puhelinnumero = kysy('Syötä puhelinnumero');
  var kotikaupunki = kysy('Syötä kotikaupunki');

  await kokoelma.insert(data: {
    'nimi': nimi,
    'puhelinnumero': puhelinnumero,
    'kotikaupunki': kotikaupunki,
    'avustuskerrat': 0
  });
}

listaa(kokoelma) async {
  var kaupunki = kysy('Mitä kaupunkia haetaan?');

  var kysely = Query(
    filter: MapFilter({
      'kotikaupunki': ValueFilter(kaupunki),
    }),
    sorter: PropertySorter('avustuskerrat', isDescending: true)
  );

  var dokumentit = await hae(kokoelma, kysely);

  if (dokumentit.length == 0) {
    print('Ei vapaaehtoisia.');
    return;
  }

  for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    var nimi = data['nimi'];
    var puhelinnumero = data['puhelinnumero'];
    var kotikaupunki = data['kotikaupunki'];
    var avustuskerrat = data['avustuskerrat'];
    print("$nimi, $puhelinnumero ($kotikaupunki), $avustuskerrat");
  }
}

poista(kokoelma) async {
  var poistettava = kysy('Kenet haluat poistaa? Syötä poistettavan puhnro:');

  var kysely = Query(
    filter: MapFilter({
      'puhelinnumero': ValueFilter(poistettava)
    })
  );

  var dokumentit = await hae(kokoelma, kysely);

  for (var i = 0; i < dokumentit.length; i++) {
    var dokumentti = dokumentit[i].document;
    await dokumentti.delete();
  }
}

kasvata(kokoelma) async {
  var numero = kysy('Syötä vapaaehtoisen puhelinnumero.');

  var kysely = Query(
    filter: MapFilter({
      'puhelinnumero': ValueFilter(numero)
    })
  );

  var dokumentit = await hae(kokoelma, kysely);

  for (var i = 0; i < dokumentit.length; i++) {
    var dokumentti = dokumentit[i].document;
    var data = dokumentit[i].data;
    //print(data);

    var avustuskertoja = 1;
    if (data.containsKey('avustuskerrat')) {
      avustuskertoja = data['avustuskerrat'] + 1;
    }

    await dokumentti.update(data: {
      'nimi': data['nimi'],
      'puhelinnumero': data['puhelinnumero'],
      'kotikaupunki': data['kotikaupunki'],
      'avustuskerrat': avustuskertoja
    });
  }
}

kysy(kysymys) {
  print(kysymys);
  return stdin.readLineSync();
}

hae(kokoelma, kysely) async {
  var tulos = await kokoelma.search(query: kysely);
  return tulos.snapshots;
}