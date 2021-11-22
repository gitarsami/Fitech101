import 'dart:io';

// Kirjoita ohjelma, joka lukee käyttäjältä merkkijonoja.
// Kun käyttäjä syöttää tyhjän merkkijonon (syote == ''), syötteen lukeminen loppuu.
// Tämän jälkeen ohjelma tulostaa käyttäjän syötteet riville yhtenä merkkijonona.
// Vihje: käytä tässä +-operaatiota merkkijonojen yhdistämiseen.

main() {
  var kokoJono = <String>[];

  while (true) {
    String mjono = stdin.readLineSync() ?? '';
    if (mjono == '') {
      String strinjono = kokoJono.join();
      print('$strinjono');
      break;
    }
    kokoJono.add(mjono);
  }
}
