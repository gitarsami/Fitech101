//Osoitteessa https://www.frankfurter.app/docs/ on euroopan keskuspankin 
// valuuttakurssien muutoksia seuraavan palvelun rajapintakuvaus. Osoitteessa
// https://api.frankfurter.app/latest olevasta rajapinnasta voi hakea viimeisimmät
// valuuttakurssit. Haun rajoitus lähtö- ja kohdevaluuttoihin onnistuu from ja 
// to -parametrien avulla, joiden arvoiksi asetetaan valuuttakurssien nimet.

//Esimerkiksi pyyntö osoitteeseen https://api.frankfurter.app/latest?from=EUR&to=USD
// hakee uusimman valuuttakurssin eurosta yhdysvaltain dollariin.

//Tehtäväpohjassa on ohjelma, joka näyttää käyttäjälle 250 euroa vastaavan summan
// dollareissa. Muokkaa ohjelmaa siten, että käyttäjälle näytetään tekstikenttä
// ja nappi. Kun käyttäjä syöttää tekstikenttään euromäärän ja painaa nappia, 
//ohjelma muuntaa tekstikenttään syötetyn euromäärän dollareiksi. Lopulta käyttäjän
// syöttämää summaa vastaava dollarimäärä näytetään käyttäjälle.

//Dart

import 'dart:html';
import 'dart:convert';

main() {

  //print(maara.value + ' ' + valuutta.value);
  querySelector('#nappi').onClick.listen(muunna);
}

muunna(e) async {
  InputElement eurot = querySelector('#eurot');
//  InputElement valuutta = querySelector('#valuutta');

//  var lyhenne = valuutta.value;
  var kpl = int.parse(eurot.value);
  var uri = 'https://api.frankfurter.app/latest?from=EUR&to=USD';
  var sisalto = await HttpRequest.getString('$uri');
  
  //print('$uri');
  //print('$sisalto');
  var data = jsonDecode(sisalto);
  //print('$data');
  var kurssi = data['rates']['USD'];
  //print('$kurssi');
  var rahaa = kpl * kurssi;
  //print('$rahaa');
  querySelector('#vastaus').text = rahaa.toString();
}


// HTML

// <input type='text' id='eurot' />
// <button id='nappi'>Muunna</button>
// <p id='vastaus'></p>