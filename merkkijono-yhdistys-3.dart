import 'dart:io';

void main() {
  var yhdessa = '';

  while (true) {
    var syote = stdin.readLineSync();
    if (syote == '') {
      break;
    }
    yhdessa = '$yhdessa' + '$syote';
  }
  print(yhdessa);
}
