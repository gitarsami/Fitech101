//Luo yksiparametrinen asynkroninen funktio siistiMittaukset. 
//Funktio saa parametrinaan mittausarvoja (arvo) sisältävän tietokokoelman. 
//Funktion tulee poistaa tietokokoelmasta kaikki arvot, jotka ovat pienempiä 
// kuin nolla tai suurempia kuin 10. 

import 'package:database/database.dart';
import 'package:database/filter.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('mittaukset');
    await kokoelma.insert(data: { 'arvo' : 3 });
    await kokoelma.insert(data: { 'arvo' : 7 });
    await kokoelma.insert(data: { 'arvo' : 0 });
    await kokoelma.insert(data: { 'arvo' : 11 });
    await kokoelma.insert(data: { 'arvo' : 10 });
    await kokoelma.insert(data: { 'arvo' : -4 });
    await kokoelma.insert(data: { 'arvo' : -3 });

    await siistiMittaukset(kokoelma);

    var tulos = await kokoelma.search();
    var dokumentit = tulos.snapshots;

    for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    print(data['arvo']);
    }
}

siistiMittaukset(kokoelma) async {
    var kysely = Query(
        filter: MapFilter({
            'arvo': NotFilter(RangeFilter(min:0, max:10))
        })
    );
    var tulos = await kokoelma.search(query: kysely);
    var dokumentit = tulos.snapshots;

    for (var i = 0; i < dokumentit.length; i++) {
        var dokumentti = dokumentit[i].document;
        await dokumentti.delete();
        }
}