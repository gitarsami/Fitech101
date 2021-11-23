// Kirjoita luokka Kappale. Jokaisella kappaleella tulee olla artisti (merkkijono), nimi (merkkijono), ja pituus (kokonaisluku). 

main() {
  
  var kappale = Kappale();
  kappale.artisti = 'Dire Straits';
  kappale.nimi = 'Sultans of Swing';
  kappale.pituus = 350;
  print('${kappale.nimi} (${kappale.artisti}), ${kappale.pituus} sekuntia.');
}

class Kappale {
  String? artisti;
  String? nimi;
  int? pituus;
}
