// Tehtäväpohjassa on eräs mahdollinen ratkaisu edelliseen tehtävään. Jatketaan 
// tässä sanakirjan tekemistä. Lisää HTML-dokumenttiin uusi tekstikenttä, nappi, ja 
// elementti järjestämättömälle listalle (ul). Tekstikentän id:n tulee olla "hakuteksti" 
// ja napin id:n "hae". Kun olet täydentänyt HTML-dokumenttia, toteuta ohjelmaan 
// toiminnallisuus sanojen hakemiseksi. Kun käyttäjä kirjoittaa merkkijonon tekstikenttään, 
// jonka id on "hakuteksti", ja painaa nappia, jonka id on "hae", ohjelman tulee hakea 
// tietokannasta ne dokumentit, joiden sana-attribuutissa esiintyy syötetty merkkijono. 
// Tämän jälkeen sivulla olevassa listassa näytetään löydettyjä sanoja vastaavat sanaparit 
// muodossa (sana: kaannos). Esimerkiksi, mikäli tietokannassa on sanaparit hauki-pike ja 
// ahven-perch, tulee haulla "hau" näyttää merkkijono hauki: pike. Vastaavasti haulla "a" 
// listassa tulee näyttää sanat hauki: pike ja ahven: perch.


import 'dart:html';
import 'package:database/filter.dart';
import 'package:database/database.dart';
import 'package:database/browser.dart';

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
  InputElement hakuElementti = querySelector('#hakuteksti');
  var hakuteksti = hakuElementti.value;
  var kysely = Query(filter: MapFilter({'sana': KeywordFilter(hakuteksti)}));
                     
  var tulos = await kokoelma.search(query: kysely);
  var dokumentit = tulos.snapshots;
  for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    //print('${data['sana']}' + ': ' + '${data['kaannos']}');
    lisaaListalle(data);
  }
}

lisaaListalle(data) {
  var lista = querySelector('#lista');
  var listaElementti = Element.li();

  var sana = sanapari['sana'];
  var kaannos = sanapari['kaannos'];

  listaelementti.text = '$sana: $kaannos';
  lista.children.add(listaelementti);

//   listaElementti.text = '${data['sana']}' + ': ' + '${data['kaannos']}';
//   lista.children.add(listaElementti);
}

//HTML
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
//     <tr>
//         <td>
//             Käännös
//         </td>
//         <td>
//             <input type='text' id='hakuteksti'></input>
//         </td>
//     </tr>
//     <tr>
//         <td></td>
//         <td>
//             <button id='hae'>Hae</button>
//         </td>
//     </tr>
// </table>
// <ul id='lista'>
// </ul>