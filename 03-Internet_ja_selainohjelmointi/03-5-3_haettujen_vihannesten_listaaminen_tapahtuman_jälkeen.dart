//Tehtäväpohjassa on eräs ratkaisu edelliseen tehtävään. Edellisessä tehtävässä
// luotiin ohjelma, joka listaa tietokannassa olevat ka-merkkijonon sisältävät
// vihannekset napin painalluksen jälkeen. 
//Lisää tässä tehtävässä ohjelmaan tekstikenttä (input), johon käyttäjä voi 
// syöttää merkkijonon. Muokkaa tämän // jälkeen hakutoiminnallisuutta siten, 
// että napin painaminen hakee ja näyttää tietokannasta ne vihannekset, joiden 
// nimessä esiintyy tekstikenttään syötetty merkkijono. Kuten edellisessä 
// tehtävässä, ohjelma voi toimia niin, että jokainen napin painalluskerta lisää 
// vihannekset "uudelleen" listaan, eli vihannekset näkyvät listalla useaan kertaan.

import 'dart:html';
import 'package:database/database.dart';
import 'package:database/filter.dart';

main() async {
  var tietokanta = MemoryDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('vihannekset');
  await lisaaKokoelmaan(kokoelma);

  querySelector('#nappi').onClick.listen((e) {
    naytaSivulla(kokoelma);
  });
}

lisaaKokoelmaan(kokoelma) async {
  await kokoelma.insert(data: {'nimi': 'Bataatti'});
  await kokoelma.insert(data: {'nimi': 'Kaurajuuri'});
  await kokoelma.insert(data: {'nimi': 'Lanttu'});
  await kokoelma.insert(data: {'nimi': 'Maa-artisokka'});
  await kokoelma.insert(data: {'nimi': 'Mustajuuri'});
  await kokoelma.insert(data: {'nimi': 'Nauris'});
  await kokoelma.insert(data: {'nimi': 'Palsternakka'});
  await kokoelma.insert(data: {'nimi': 'Persilja'});
  await kokoelma.insert(data: {'nimi': 'Peruna'});
  await kokoelma.insert(data: {'nimi': 'Piparjuuri'});
  await kokoelma.insert(data: {'nimi': 'Porkkana'});
  await kokoelma.insert(data: {'nimi': 'Punajuurikas'});
  await kokoelma.insert(data: {'nimi': 'Retiisi'});
  await kokoelma.insert(data: {'nimi': 'Selleri'});
  await kokoelma.insert(data: {'nimi': 'Vesikastanja'});
}

naytaSivulla(kokoelma) async {
  InputElement haettava = querySelector('#haku');
//TAI:  var haettava = (querySelector('#haku') as InputElement).value;
  var kysely = Query(
    filter: MapFilter({
      'nimi': KeywordFilter(haettava.value)
    })
  );

  var tulos = await kokoelma.search(query: kysely);
  var dokumentit = tulos.snapshots;

  querySelector('#vihannekset').children.clear(); //tyhjää tulokset ennen kuin näyttää uudet

  for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    lisaaSivulle(data);
  }
}

lisaaSivulle(tuote) {
  var lista = querySelector('#vihannekset');
  var listaelementti = Element.li();
  listaelementti.text = tuote['nimi'];
  lista.children.add(listaelementti);
}


//HTML
// <input type='text' id='haku'></input>
// <button id='nappi'>Hae vihannekset</button>
// <ul id='vihannekset'></ul>