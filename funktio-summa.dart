import 'dart:io';

main() {
//  int eka = int.parse(stdin.readLineSync() ?? '');
//  int toka = int.parse(stdin.readLineSync() ?? '');
//  summa(eka, toka);
  int eka = -9;
  int toka = 18;
  print(summa(eka,toka));
}

summa(int eka, int toka) {
    int total = eka + toka;
    return total;
}