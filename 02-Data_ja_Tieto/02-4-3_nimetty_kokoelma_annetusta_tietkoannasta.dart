//Luo kaksiparametrinen funktio nimelta tietokokoelma. 
//Funktion saa ensimmäisenä parametrina tietokannan ja toisena parametrina kokoelman nimen. 
//Funktion tulee palauttaa ensimmäisenä parametrina saadusta tietokannasta toisena parametrina 
//saadun nimen niminen tietokokoelma. 

import 'package:database/database.dart';

main() {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokokoelma(tietokanta, 'henkilot');
    print(kokoelma);
}

tietokokoelma(tietokanta, kokoelma) {
    return(tietokanta.collection(kokoelma));
}