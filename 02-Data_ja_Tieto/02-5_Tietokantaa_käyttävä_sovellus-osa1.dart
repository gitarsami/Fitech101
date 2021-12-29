import 'package:database/database.dart';
import 'dart:io';

main() {
  var tietokanta = MemoryDatabaseAdapter().database();
  kaynnista(tietokanta);
}

kaynnista(tietokanta) async {
  while(true) {
    print('Komennot:');
    print('1: Lisää vapaaehtoinen');
    print('2: Listaa vapaaehtoiset');
    print('3: Lopeta');

    var komento = stdin.readLineSync();
    if (komento == '1') {
      await lisaa(tietokanta);
    } else if (komento == '2') {
      await listaa(tietokanta);
    } else if (komento == '3') {
      break;
    } else {
      print('Tuntematon komento!');
    }
  }
}

lisaa(tietokanta) async {
  print('Nimi?');
  var nimi = stdin.readLineSync();
  print('Puhelinnumero?');
  var puhelinnumero = stdin.readLineSync();
  print('Kotikaupunki?');
  var kotikaupunki = stdin.readLineSync();

  Map<String, Object> sanakirja = {};
  sanakirja['nimi'] = '$nimi';
  sanakirja['puhelinnumero'] = '$puhelinnumero';
  sanakirja['kotikaupunki'] = '$kotikaupunki';

  var kokoelma = tietokanta.collection('vapaaehtoiset');
  await kokoelma.insert(data: sanakirja);
}

listaa(tietokanta) async {
  print('Mitä kaupunkia haetaan?');
  var kaupunki = stdin.readLineSync();
    
  var kokoelma = tietokanta.collection('vapaaehtoiset');
  var tulokset = await kokoelma.search();
  var dokumentit = tulokset.snapshots;

  for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
      if (data['kotikaupunki'] != kaupunki) {
      continue;
      }

    var nimi = data['nimi'];
    var puhelinnumero = data['puhelinnumero'];
    var kotikaupunki = data['kotikaupunki'];
    print("$nimi, $puhelinnumero ($kotikaupunki)");
  }
}