//Luo yksiparametrinen funktio nimelta tehtavakokoelma. 
//Funktion saa parametrinaan tietokannan. 
//Funktion tulee palauttaa parametrina saadusta tietokannasta 'tehtavat'-niminen tietokokoelma.

import 'package:database/database.dart';

main() {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tehtavakokoelma(tietokanta);
//    print(kokoelma);
}

tehtavakokoelma(tietokanta) {
  return(tietokanta.collection('tehtavat'));
}
