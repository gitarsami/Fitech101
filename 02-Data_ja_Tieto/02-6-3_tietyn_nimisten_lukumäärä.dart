//Luo kaksiparametrinen asynkroninen funktio nimeltä nimienLukumaara. 
//Funktio saa ensimmäisenä parametrinaan tietokokoelman ja toisena parametrina nimen. 
//Funktion tulee tehdä tietokokoelmaan haku ja palauttaa tieto tietokokoelmassa 
// olevien henkilöiden lukumäärästä, joiden nimi on parametrina annettu nimi.


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
    
    var lkm = await nimienLukumaara(kokoelma, 'Sylvi');
    print(lkm);
}

nimienLukumaara(kokoelma, nimi) async {
    
    var kysely = Query(
        filter: MapFilter({
            'nimi': ValueFilter('$nimi')
            })
        );

    var tulokset = await kokoelma.search(query: kysely);
    var dokumentit = tulokset.snapshots;

    return(dokumentit.length);
}

//Mallivastaus:
//nimienLukumaara(kokoelma, nimi) async {
//  var kysely = Query(
//    filter: MapFilter({
//      'nimi': ValueFilter(nimi)
//    })
//  );