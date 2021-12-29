//Tehtäväpohjassa oleva ohjelma tekee kyselyn osoitteessa https://api.ipify.org/
// olevaan rajapintaan. Tehtäväpohjan kyselyssä kysymysmerkillä eroteltu
// format=json on parametri kyselylle, joka kertoo että kyselyn vastaus halutaan
// JSON-muotoisena. Rajapinta palauttaa tällöin kyselyn vastauksena pyytäjän
// IP-osoitteen muodossa {"ip": "osoite"}. Muokkaa ohjelmaa siten, että käyttäjän
// IP-osoite näytetään otsake-elementissä (h1)

//Dart

import 'dart:html';
import 'dart:convert';

main() async {
  var sisalto = await HttpRequest.getString('https://api.ipify.org/?format=json');
  var decode = jsonDecode(sisalto);
  var ip = decode['ip'];
  querySelector('#ip').text = ip;

  print(ip);
  print(sisalto);
}


//HTML
//<h1 id='ip'></h1>