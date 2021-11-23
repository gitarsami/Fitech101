// Lisää luokalle Kori toString-metodi, joka palauttaa tiedon korin tilanteesta. 
// Mikäli korissa ei ole yhtäkään esinettä, metodin tulee palauttaa merkkijono "Kori on tyhjä.". 
// Mikäli korissa on yksi esine, metodin tulee palauttaa merkkijono "Korissa on 1 esine.". 
// Muulloin metodin tulee palauttaa merkkijono "Korissa on N esinettä.", missä N on korissa olevien esineiden lukumäärä. 

main() {
  var kori = Kori();
  print(kori);
  kori.esineet.add('Nauris');
  print(kori);
  kori.esineet.add('Nauris');
  print(kori);
}

class Kori {
  var esineet = [];

  toString() {
//      return '${esineet.length}';

      if (esineet.length == 0) {
          return 'Kori on tyhjä.';
      } else if (esineet.length == 1) {
          return 'Korissa on 1 esine.';
      } else
        return "Korissa on ${esineet.length} esinettä.";
  }
}