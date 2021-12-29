//Toteuta tehtäväpohjaan tämän materiaalisivun aliluvua "Useamman kysymyksen näyttäminen" 
// esimerkkiä noudattaen toiminnallisuus useamman kysymyksen näyttämiseen. 
//Kun ohjelma toimii siten, että ohjelma asettaa sivulle kysymyksen ja vastaukset, 
// näyttää käyttäjälle meneekö käyttäjän valitsema vastaus oikein, ja mahdollistaa uuden
// kysymyksen näyttämisen, palauta ohjelma tehtäväpalvelimelle. 
import 'dart:html';
import 'dart:convert';

main() async {
  var osoite = 'https://csfoundations.cs.aalto.fi/json-data/kysymykset.json';
  var sisalto = await HttpRequest.getString(osoite);
  var sanakirja = jsonDecode(sisalto);
  var kysymykset = sanakirja['kysymykset'];
 // print(kysymykset[0]['vaihtoehdot']);
  querySelector('#seuraava').onClick.listen((e) {
    kysymykset.shuffle();
    asetaKysymys(kysymykset[0]);
  });
}

asetaKysymys(kysymys) {
  asetaKysymysteksti(kysymys['teksti']);
  asetaVastausvaihtoehdot(kysymys['vaihtoehdot']);
}

asetaKysymysteksti(teksti) {
  querySelector('#kysymys').text = teksti;
}

asetaVastausvaihtoehdot(vaihtoehdot) {
  querySelector('#vastaukset').children.clear();
  for (var i = 0; i < vaihtoehdot.length; i++) {
    lisaaVastausvaihtoehto(vaihtoehdot[i]);
  }
}

lisaaVastausvaihtoehto(vaihtoehto) {
  var elementti = Element.div();
  elementti.className = 'vaihtoehto';
  elementti.text = vaihtoehto['teksti'];
  elementti.onClick.listen((e) {
    if (vaihtoehto['oikein']) {
      elementti.text = 'oikein!';
    } else {
      elementti.text = 'väärin!';
    }
  });
  querySelector('#vastaukset').children.add(elementti);
}
