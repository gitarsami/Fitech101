//Luo yksiparametrinen asynkroninen funktio korjaaNegatiiviset. 
//Funktio saa parametrinaan mittausarvoja (arvo) sisältävän tietokokoelman.
//Funktion tulee muokata tietokokoelmaa siten, että kaikki nollaa pienemmät
// arvot asetetaan nollaksi.

import 'package:database/database.dart';
import 'package:database/filter.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('mittaukset');
    await kokoelma.insert(data: { 'arvo' : 3 });
    await kokoelma.insert(data: { 'arvo' : 0 });
    await kokoelma.insert(data: { 'arvo' : 11 });
    await kokoelma.insert(data: { 'arvo' : -4 });
    await kokoelma.insert(data: { 'arvo' : -3 });

    await korjaaNegatiiviset(kokoelma);

    var tulos = await kokoelma.search();
    var dokumentit = tulos.snapshots;

    for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    print(data['arvo']);
    }
}


korjaaNegatiiviset(kokoelma) async {
    var kysely = Query(
        filter: MapFilter({
            'arvo': RangeFilter(max: 0)
        })
    );
    var tulos = await kokoelma.search(query: kysely);
    var dokumentit = tulos.snapshots;

    for (var i = 0; i < dokumentit.length; i++) {
        var dokumentti = dokumentit[i].document;
        await dokumentti.update(data: {
            'arvo': 0
        });
        }
}