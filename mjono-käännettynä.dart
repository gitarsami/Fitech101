import 'dart:io';

//main() {
//    var syote = stdin.readLineSync() ?? '';
//
//    print(syote.split('').reversed.join());
////var koko = syote.length;
////while (koko >= 0) {
////    if (koko > 0) {
////        print(syote[koko-1]);
////        }
////    koko--;
////    }
////
//}


// Mallivastaus:
main() {
  var kaannettyna = '';

  var syote = stdin.readLineSync() ?? '';
  for (var i = 0; i < syote.length; i++) {
    kaannettyna = kaannettyna + syote[syote.length - 1 - i];
  }

  print(kaannettyna);
}