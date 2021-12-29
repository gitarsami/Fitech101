//Luo kaksiparametrinen asynkroninen funktio nimeltä dokumenttienLukumaara. 
//Funktio saa ensimmäisenä parametrinaan tietokokoelman ja toisena parametrinaan 
// Query-tyyppisen kyselyn. Funktion tulee tehdä tietokokoelmaan haku parametrina 
// saatua kyselyä käyttäen ja palauttaa kyselyn vastauksena saatujen dokumenttien lukumaara. 

import 'package:database/database.dart';
import 'package:database/filter.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('vuodet');
    await kokoelma.insert(data: {'vuosi' : 1915});
    await kokoelma.insert(data: {'vuosi' : 1916});
    await kokoelma.insert(data: {'vuosi' : 1917});

    var kysely = Query();

    var lkm = await dokumenttienLukumaara(kokoelma, kysely);
    print(lkm);
}

dokumenttienLukumaara(kokoelma, kysely) async {
    var tulokset = await kokoelma.search(query: kysely);
    var dokumentit = tulokset.snapshots;
//    print(dokumentit.length);
    return(dokumentit.length);
}