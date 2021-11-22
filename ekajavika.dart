// Kirjoita ohjelma, joka lukee käyttäjältä merkkijonon.
// Tämän jälkeen ohjelma tulostaa merkkijonon ensimmäisen ja viimeisen merkin samalle riville.
import 'dart:io';

main() {
  var mjono = stdin.readLineSync() ?? ''; //estää herjat mahdollisesta null:sta
  if (mjono != '') {
    print('${mjono[0]}' + '${mjono[mjono.length - 1]}');
  }
}

//mallivastaus:
main() {
  var syote = stdin.readLineSync();
  var eka = syote[0];
  var vika = syote[syote.length - 1];
  print('$eka$vika');
}
