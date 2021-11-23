// Tehtäväpohjassa on luokka Kappale. Muokkaa luokkaa siten, että sillä on kolmeparametrinen konstruktori.
// Ensimmäinen parametri on artistin nimi, toinen parametri on kappaleen nimi, ja kolmas parametri on kappaleen pituus.
// Lisää luokalle myös toString-metodi, joka tulostaa kappaleen tiedot.

main() {
  var kappale = Kappale('Dire Straits','Sultans of Swing',350);
  print(kappale);
}

class Kappale {
  String artisti;
  String nimi;
  int pituus;

  Kappale(this.artisti, this.nimi, this.pituus);

  toString() {
      return '$nimi ($artisti), $pituus sekuntia.';
  }
}