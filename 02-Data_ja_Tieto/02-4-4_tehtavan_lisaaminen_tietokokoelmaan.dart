//Luo yksiparametrinen asynkroninen funktio nimeltä lisaa<>. 
//Funktio saa parametrinaan tietokokoelman. Funktion tulee lisätä tietokokoelmaan uusi tehtävä. 
//Tehtävän nimeksi (muuttuja 'nimi') asetetaan 'lisää tehtävä' ja tehtävää ei ole vielä tehty ('tehty': false). 
import 'package:database/database.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('tehtavat');
    lisaa(kokoelma);

    var hakutulos = await kokoelma.search();
    var dokumentit = hakutulos.snapshots;
    print(dokumentit[0].data);
}

//lisaa(kokoelma) {
//    Map<String, Object> sanakirja = {};
//    sanakirja['nimi'] = 'lisää tehtävä';
//    sanakirja['tehty'] = false;
//
//    var vastaus = kokoelma.insert(data: sanakirja);
//    return(vastaus);
//}

//Mallivastaus:
lisaa(kokoelma) async {
  await kokoelma.insert(data: {
    'nimi': 'lisää tehtävä',
    'tehty': false
  });
}