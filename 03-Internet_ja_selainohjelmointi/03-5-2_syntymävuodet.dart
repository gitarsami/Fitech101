//Tehtäväpohjassa olevassa ohjelmassa on toiminnallisuus henkilöiden nimien ja
// syntymävuosien listaamiseen. Henkilöiden syntymävuosia ei kuitenkaan tällä
// hetkellä lisätä tietokantaan. Muokkaa tietokantaan lisäämiseen käytettyä
// funktiota lisaaKokoelmaan siten, että lisättävillä henkilöillä on myös
// syntymävuodet. Blaise Pascal on syntynyt vuonna 1623, Ada Lovelace vuonna 1815,
// ja Maria Mitchell vuonna 1818. Sivulla listattuna näiden tulee näkyä muodossa
// Blaise Pascal (1623), Ada Lovelace (1815), ja Maria Mitchell (1818).

import 'dart:html';
import 'package:database/database.dart';

main() async {
  var tietokanta = MemoryDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('henkilot');
  await lisaaKokoelmaan(kokoelma);
  await naytaSivulla(kokoelma);
}

lisaaKokoelmaan(kokoelma) async {
//   await kokoelma.insert(data: {'nimi': 'Ada Lovelace'});
//   await kokoelma.insert(data: {'nimi': 'Blaise Pascal'});
//   await kokoelma.insert(data: {'nimi': 'Maria Mitchell'});
  await kokoelma.insert(data: {'nimi': 'Ada Lovelace', 'syntymavuosi': 1815});
  await kokoelma.insert(data: {'nimi': 'Blaise Pascal', 'syntymavuosi': 1623 });
  await kokoelma.insert(data: {'nimi': 'Maria Mitchell', 'syntymavuosi': 1818 });

}

naytaSivulla(kokoelma) async {
  var tulos = await kokoelma.search();
  var dokumentit = tulos.snapshots;
  for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    lisaaHenkiloSivulle(data);
  }
}

lisaaHenkiloSivulle(henkilo) {
  var henkilolista = querySelector('#henkilot');
  var listaelementti = Element.li();
  
  var nimi = henkilo['nimi'];
  var syntymavuosi = henkilo['syntymavuosi'];

  listaelementti.text = '$nimi ($syntymavuosi)';
  henkilolista.children.add(listaelementti);
}
