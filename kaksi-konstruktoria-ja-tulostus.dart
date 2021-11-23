// Toteuta tehtäväpohjassa tulevalle luokalle Joukkue kaksi konstruktoria. Oletuskonstruktorille annetaan kolme parametria: 
// nimi, kotikaupunki, perustamisvuosi. Nimetylle konstruktorille "Joukkue.nimenJaVuodenPerusteella" annetaan parametrina joukkueen nimi ja perustamisvuosi. 
// Muuta lisäksi luokan Joukkue rakennetta siten, että kotikaupunki on oletuksena "Tuntematon".
// Lisää luokalle lopulta toString-metodi, joka tulostaa joukkueen tiedot.

main() {
  var fps = Joukkue('FPS','Forssa',1931);
  print(fps);
  var sapko = Joukkue.nimenJaVuodenPerusteella('SaPKo',1929);
  print(sapko);
} 

class Joukkue {
  String? nimi;
  String kotikaupunki = 'Tuntematon';
  int? perustamisvuosi;

  Joukkue(this.nimi, this.kotikaupunki, this.perustamisvuosi);
  Joukkue.nimenJaVuodenPerusteella(this.nimi, this.perustamisvuosi);

  toString() {
      return '$nimi ($kotikaupunki, $perustamisvuosi)';
  }
}