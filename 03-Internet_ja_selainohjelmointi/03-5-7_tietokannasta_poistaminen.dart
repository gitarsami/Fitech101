// Tehtäväpohjassa on eräs mahdollinen ratkaisu edelliseen tehtävään. 
// Täydennetään tässä sanakirjaa siten, että hakutuloksia voi poistaa. 
// Muokkaa ohjelmaa siten, että kun käyttäjä klikkaa hakutuloksena näytettävässä 
// listassa olevaa riviä, ohjelma poistaa kyseisen rivin listasta sekä riviä 
// vastaavan dokumentin tietokannasta.

import 'dart:html';
import 'package:database/browser.dart';
import 'package:database/database.dart';
import 'package:database/filter.dart';

main() async {
  querySelector('#tallenna').onClick.listen(tallenna);
  querySelector('#hae').onClick.listen(hae);
}

tallenna(e) async {
  var tietokanta = BrowserDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('sanakirja');
  InputElement sanaElementti = querySelector('#sana');
  InputElement kaannosElementti = querySelector('#kaannos');

  var sana = sanaElementti.value;
  var kaannos = kaannosElementti.value;

  await kokoelma.insert(data: {
    'sana': sana,
    'kaannos': kaannos
  });
}

hae(e) async {
  var tietokanta = BrowserDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('sanakirja');
  InputElement haku = querySelector('#hakuteksti');
  var haettava = haku.value;
  
  var lista = querySelector('#tulokset');
  lista.children.clear();

  var kysely = Query(
    filter: MapFilter({
      'sana': KeywordFilter(haettava)
    })
  );
  
  var tulos = await kokoelma.search(query: kysely);

  var dokumentit = tulos.snapshots;
  for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    lisaaSivulle(data);
  }
}

lisaaSivulle(sanapari) {
  var lista = querySelector('#tulokset');
  var listaelementti = Element.li();

  var sana = sanapari['sana'];
  var kaannos = sanapari['kaannos'];

  listaelementti.text = '$sana: $kaannos';
  lista.children.add(listaelementti);

  listaelementti.onClick.listen((e) async {
    listaelementti.remove();
    await sanapari.delete();
  });
  
}

// //Mallivastaus:
//  ....
//   var dokumentit = tulos.snapshots;
//   for (var i = 0; i < dokumentit.length; i++) {
//     var data = dokumentit[i].data;
//     var dokumentti = dokumentit[i].document;
    
//     lisaaSivulle(data, dokumentti);
//   }
// }

// lisaaSivulle(sanapari, dokumentti) {
//   var lista = querySelector('#tulokset');
//   var listaelementti = Element.li();

//   var sana = sanapari['sana'];
//   var kaannos = sanapari['kaannos'];

//   listaelementti.text = '$sana: $kaannos';
//   lista.children.add(listaelementti);

//   listaelementti.onClick.listen((e) async {
//     listaelementti.remove();
//     await dokumentti.delete();
//   });
// //HTML
// <table>
//     <tr>
//         <td>
//             Sana
//         </td>
//         <td>
//             <input type='text' id='sana'></input>
//         </td>
//     </tr>
//     <tr>
//         <td>
//             Käännös
//         </td>
//         <td>
//             <input type='text' id='kaannos'></input>
//         </td>
//     </tr>
//     <tr>
//         <td></td>
//         <td>
//             <button id='tallenna'>Tallenna</button>
//         </td>
//     </tr>
// </table>

// <input type='text' id='hakuteksti'></input><button id='hae'>Hae</button>
// <ul id='tulokset'></ul>