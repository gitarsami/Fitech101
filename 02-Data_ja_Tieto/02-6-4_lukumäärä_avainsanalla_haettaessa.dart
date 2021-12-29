//Luo kaksiparametrinen asynkroninen funktio nimeltä lukumaara. 
//Funktio saa ensimmäisenä parametrinaan tietokokoelman ja toisena parametrina 
// merkkijonon. Funktion tulee tehdä tietokokoelmaan haku ja palauttaa tieto 
// tietokokoelmassa olevien henkilöiden lukumäärästä, joiden nimessä esiintyy 
// parametrina annettu merkkijono.

import 'package:database/database.dart';
import 'package:database/filter.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('nimet');
    await kokoelma.insert(data: {'nimi' : 'Venla'});
    await kokoelma.insert(data: {'nimi' : 'Venla'});
    await kokoelma.insert(data: {'nimi' : 'Venla-Maaria'});
    await kokoelma.insert(data: {'nimi' : 'Sylvi'});
    await kokoelma.insert(data: {'nimi' : 'Milla'});
    await kokoelma.insert(data: {'nimi' : 'Milla'});

    var lkm = await lukumaara(kokoelma, 'Venla');
    print(lkm);
}


lukumaara(kokoelma, mjono) async {
    var kysely = Query(
        filter: MapFilter({
            'nimi': KeywordFilter(mjono)
            })
        );

    var tulokset = await kokoelma.search(query: kysely);
    var dokumentit = tulokset.snapshots;

    return(dokumentit.length);

}