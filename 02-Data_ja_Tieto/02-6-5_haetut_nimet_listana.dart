//Luo kaksiparametrinen asynkroninen funktio nimeltä haetutNimetListana. 
//Funktio saa ensimmäisenä parametrinaan nimiä sisältävän tietokokoelman ja 
// toisena parametrina merkkijonon. Funktion tulee tehdä tietokokoelmaan haku ja 
// palauttaa lista, joka sisältää ne nimet, joissa esiintyy parametrina annettu 
// merkkijono.

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

    var lista = await haetutNimetListana(kokoelma, 'la');
    for (var i = 0; i < lista.length; i++) {
        print(lista[i]);
    }
}


haetutNimetListana(kokoelma, mjono) async {
    var kysely = Query(
        filter: MapFilter({
            'nimi': KeywordFilter(mjono)
            })
        );

    var tulokset = await kokoelma.search(query: kysely);
    var dokumentit = tulokset.snapshots;
    var lista = [];
    for (var i = 0; i < dokumentit.length; i++) {
        var data = dokumentit[i].data;
        lista.add(data['nimi']);
    }
    return(lista);

}  