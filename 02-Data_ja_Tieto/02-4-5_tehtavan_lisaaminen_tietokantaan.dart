//Luo yksiparametrinen asynkroninen funktio nimeltä lisaa. 
//Funktio saa parametrinaan tietokannan. Funktion tulee luoda (tai hakea) tietokokoelma
// nimeltä 'tehtavat' ja lisätä tietokokoelmaan uusi tehtävä. 
//Tehtävän nimeksi ('nimi') asetetaan 'lisää tehtävä' ja tehtävää ei ole vielä tehty ('tehty': false). 

import 'package:database/database.dart';

main() async{
    var tietokanta = MemoryDatabaseAdapter().database();
    await lisaa(tietokanta);

    var hakutulos = await tietokanta.collection('tehtavat').search();
    var dokumentit = hakutulos.snapshots;
    print(dokumentit[0].data);
}

lisaa(tietokanta) {
    tietokanta.collection('tehtavat').insert(data: {
    'nimi': 'lisää tehtävä',
    'tehty': false
    });
}

//Mallivastaus:
//lisaa(tietokanta) async {
//  var kokoelma = tietokanta.collection('tehtavat');
//  await kokoelma.insert(data: {
//    'nimi': 'lisää tehtävä',
//    'tehty': false
//  });
//}