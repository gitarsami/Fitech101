// Lisää luokalle Henkilo toString-metodi, joka palauttaa henkilon nimen ja syntymävuoden muodossa "nimi (syntymavuosi)".

main() {
  var henkilo = Henkilo();
  henkilo.nimi = 'Ada Lovelace';
  henkilo.syntymavuosi = 1815;

  print(henkilo);
}

class Henkilo {
  String? nimi;
  int? syntymavuosi;

  toString() {
      return '$nimi ($syntymavuosi)';
  }
}
