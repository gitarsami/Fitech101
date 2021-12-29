//Luo kaksiparametrinen funktio nimeltä lisaa. 
//Funktio saa parametrinaan tietokannan ja lisättävän tehtävän nimen. 
//Funktion tulee luoda (tai hakea) tietokokoelma nimeltä 'tehtavat' ja lisätä 
// tietokokoelmaan uusi tehtävä. Tehtävän nimeksi ('nimi') asetetaan parametrina 
// annettu tehtävän nimi. Lisättyä tehtävää ei ole vielä tehty ('tehty': false). 

import 'package:database/database.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    await lisaa(tietokanta, 'keitä kahvia');
    var tulokset = await tietokanta.collection('tehtavat').search();
    var dokumentit = tulokset.snapshots;
    print(dokumentit[0].data);
}

lisaa(tietokanta, tehtava) {
    var kokoelma = tietokanta.collection('tehtavat');
    kokoelma.insert(data: {
    'nimi': tehtava,
    'tehty': false
});
}

////Mallivastaus:
//lisaa(tietokanta, tehtava) async {
//  var kokoelma = tietokanta.collection('tehtavat');
//  await kokoelma.insert(data: {
//    'nimi': tehtava,
//    'tehty': false
//  });
//}