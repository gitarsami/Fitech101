// Tehtäväpohjassa on materiaalissa käsitelty henkilöiden lisäämiseen käytetty 
// ohjelma. Muokkaa ohjelmaa siten, että ohjelmassa käytetään selaimen tietokantaa 
// muistiin ladattavan tietokannan sijaan. Huom! Ohjelman tulee toimia samalla 
// tavalla kuin tehtäväpohjan ohjelma -- kun sovellus käynnistetään, tietokantaan 
// tulee lisätä kaksi henkilöä. Älä muokkaa sovelluksen toiminnallisuutta selaimen 
// tietokannan käyttöönoton lisäksi.


import 'package:database/database.dart';
import 'package:database/browser.dart'; //tämä
import 'package:database/filter.dart';
import 'dart:html';

main() async {
  //var tietokanta = MemoryDatabaseAdapter().database();
  var tietokanta = BrowserDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('henkilot');
  await lisaaKokoelmaan(kokoelma);
  querySelector('#haku').onKeyUp.listen((e) {
    hae(kokoelma);
  });
}

lisaaKokoelmaan(kokoelma) async {
  await kokoelma.insert(data: {'nimi': 'Ada Lovelace'});
  await kokoelma.insert(data: {'nimi': 'Blaise Pascal'}); 
}

hae(kokoelma) async {
  InputElement hakukentta = querySelector('#haku');
  var haettava = hakukentta.value; 
  var kysely = Query(
    filter: MapFilter({
      'nimi': KeywordFilter(haettava)
    })
  );  

  var tulos = await kokoelma.search(query: kysely);
  var dokumentit = tulos.snapshots;

  querySelector('#henkilot').children.clear();

  for (var i = 0; i < dokumentit.length; i++) {
    var dokumentti = dokumentit[i];
    var data = dokumentti.data;
    lisaaHenkiloListalle(data['nimi']);
  }
}

lisaaHenkiloListalle(nimi) {
  var henkilolista = querySelector('#henkilot');
  var listaelementti = Element.li();
  listaelementti.text = nimi;
  henkilolista.children.add(listaelementti);
}