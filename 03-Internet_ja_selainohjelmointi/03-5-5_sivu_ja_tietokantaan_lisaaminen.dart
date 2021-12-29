// Tässä tehtäväsarjassa tehdään verkossa toimiva sanakirja. Luo ensin 
// HTML-dokumentti, jossa on kaksi tekstikenttää (input) ja nappi (button). 
// Ensimmäisen tekstikentän id:n tulee olla "sana" ja toisen tekstikentän id:n tulee 
// olla "kaannos". Napin id:n tulee olla "tallenna". Kun olet tehnyt HTML-dokumentin, 
// toteuta ohjelmaan toiminnallisuus tietokantaan lisäämiseksi. Kun käyttäjä painaa 
// nappia, selaimen tietokannassa olevaan kokoelmaan "sanakirja" tulee lisätä 
// dokumentti, jossa on kaksi attribuuttia. Tietokantaan tallennettavan dokumentin 
// attribuutin 'sana' arvoksi tulee id:llä "sana" tunnistettavan tekstikentän arvo, 
// ja attribuutin 'kaannos' arvoksi tulee id:llä "kaannos" tunnistettavan tekstikentän arvo.



import 'dart:html';
import 'package:database/database.dart';
import 'package:database/browser.dart';

main() async {
  querySelector('#tallenna').onClick.listen(tallenna);
}

tallenna(e) async {
  var tietokanta = BrowserDatabaseAdapter().database();
  var kokoelma = tietokanta.collection('sanakirja');

  var sana = (querySelector('#sana') as InputElement).value;;
  var kaannos = (querySelector('#kaannos') as InputElement).value;;
  var dokumentti = await kokoelma.insert(data: {
      'teksti': sana, 
      'kaannos': kaannos
      });

}

//HTML
<input type='text' id='sana'></input>
<input type='text' id='kaannos'></input>
<button id='tallenna'>Tallenna</button>
