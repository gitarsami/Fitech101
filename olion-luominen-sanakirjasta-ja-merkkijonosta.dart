// Lisää tehtäväpohjassa olevalle luokalle Henkilo seuraavat kaksi konstruktoria. 
// Konstruktori Henkilo.sanakirjasta(sanakirja) saa parametrinaan sanakirjan. Sanakirjassa on nimi ja syntymavuosi, jotka tulee asettaa luotavan henkilöolion nimeksi ja syntymävuodeksi. 
// Konstruktori Henkilo.csvRivista(rivi) saa parametrinaan merkkijonon, joka sisältää pilkulla eroteltuna nimen ja syntymävuoden, jotka tulee asettaa luotavan henkilöolion nimeksi ja syntymävuodeksi. 

main() {
  var sanakirja = {};
  sanakirja['nimi'] = 'Charles Babbage';
  sanakirja['syntymavuosi'] = 1791;

  var charles = Henkilo.sanakirjasta(sanakirja);
  print(charles);

  var ada = Henkilo.csvRivista('Ada Lovelace',1815);
  print(ada);

// var henkilo = Henkilo();
// henkilo.nimi = 'Ada Lovelace';
// henkilo.syntymavuosi = 1815;
//
// print(henkilo);
}

class Henkilo {
  String? nimi;
  int? syntymavuosi;

  Henkilo.sanakirjasta(sanakirja) {
    nimi = sanakirja['nimi'];
    syntymavuosi = sanakirja['syntymavuosi'];
    }

  Henkilo.csvRivista(this.nimi,this.syntymavuosi);

  toString() {
    return '$nimi ($syntymavuosi)';
  }
}