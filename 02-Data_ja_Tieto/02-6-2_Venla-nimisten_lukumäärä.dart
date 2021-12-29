//Luo yksiparametrinen asynkroninen funktio nimeltä venlojenLukumaara. 
//Funktio saa parametrinaan tietokokoelman. 
//Funktion tulee tehdä tietokokoelmaan haku ja palauttaa tieto tietokokoelmassa 
//olevien Venla-nimisten henkilöiden lukumäärästä. 


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

    var lkm = await venlojenLukumaara(kokoelma);
    print(lkm);
}


venlojenLukumaara(kokoelma) async {
    var etsitty = 'Venla';
    var kysely = Query(
        filter: MapFilter({
            'nimi': ValueFilter('$etsitty')
            })
        );

    var tulokset = await kokoelma.search(query: kysely);
    var dokumentit = tulokset.snapshots;
    return(dokumentit.length);
}