//Muokkaa ohjelmaa siten, että ohjelma listaa nimien Ada Lovelace ja 
// Blaise Pascal lisäksi nimen Maria Mitchell.

import 'dart:html';
import 'package:database/database.dart';

main() async {
  var tietokanta = MemoryDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('henkilot');
  await lisaaKokoelmaan(kokoelma);
  await naytaSivulla(kokoelma);
}

lisaaKokoelmaan(kokoelma) async {
  await kokoelma.insert(data: {'nimi': 'Ada Lovelace'});
  await kokoelma.insert(data: {'nimi': 'Blaise Pascal'});
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
  listaelementti.text = henkilo['nimi'];
  henkilolista.children.add(listaelementti);
}

//HTML
<ul id='henkilot'>
<li>Maria Mitchell</li> //lisäys
</ul>