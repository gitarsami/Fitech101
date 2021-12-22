import 'package:database/database.dart';

main() {  
  print(tehtavakokoelma);
}

tehtavakokoelma() {
  var tietokanta = MemoryDatabaseAdapter().database();
  var tehtavakokoelma = tietokanta.collection('tehtavat');
  return tehtavakokoelma;
}

//Mallivastaus
//import 'package:database/database.dart';
//
//main() {
//
//}
//
//tehtavakokoelma() {
//  return MemoryDatabaseAdapter().database().collection('tehtavat');
//}