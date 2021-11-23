main() {
  var ohjelmoi = Tehtava();
  ohjelmoi.nimi = 'Aloita ohjelmointi';
  //ohjelmoi.tulosta();
  print(ohjelmoi);
}

class Tehtava {
  String? nimi;
  bool? tehty;

  //tulosta() {
  //  print(nimi);
  //}
  toString() {
    return '[$tehty] $nimi';  
  }
}

//--

//main() {
//  var blaise = Henkilo();
//  blaise.nimi = 'Blaise';
//
//  var charles = Henkilo();
//  charles.nimi = 'Charles';
//
//  print(charles);
//  charles.toString();
//  charles.tulosta();
//}
//
//class Henkilo {
//  String nimi = '';
//  int? syntymavuosi;
//    
//  toString() {
//    return nimi;
//  }
//
//  tulosta() {
//      print(nimi);
//  }
//}