//Luo yksiparametrinen asynkroninen funktio korjaaMittaukset. 
//Funktio saa parametrinaan mittausarvoja (arvo) sisältävän tietokokoelman. 
//Funktion tulee muokata tietokokoelmaa siten, että kaikki nollaa pienemmät
// arvot asetetaan nollaksi ja kaikki kymmentä suuremmat arvot asetetaan kymmeneksi.
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

    await korjaaMittaukset(kokoelma);

    var tulos = await kokoelma.search();
    var dokumentit = tulos.snapshots;

    for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    print(data['arvo']);
    }
}


korjaaMittaukset(kokoelma) async {
    var kysely1 = Query(
        filter: MapFilter({
            'arvo': RangeFilter(max: 0)
        })
    );
    var kysely2 = Query(
        filter: MapFilter({
            'arvo': RangeFilter(min: 10)
        })
    );
    var tulos = await kokoelma.search(query: kysely1);
    var dokumentit1 = tulos.snapshots;

    for (var i = 0; i < dokumentit1.length; i++) {
        var dokumentti = dokumentit1[i].document;
        await dokumentti.update(data: {
            'arvo': 0
        });
        }

    var tulos2 = await kokoelma.search(query: kysely2);
    var dokumentit2 = tulos2.snapshots;

    for (var i = 0; i < dokumentit2.length; i++) {
        var dokumentti = dokumentit2[i].document;
        await dokumentti.update(data: {
            'arvo': 10
        });
        }
}

// Mallivastaus:
// korjaaMittaukset(kokoelma) async {
//   var kysely = Query(
//     filter: MapFilter({
//       'arvo': NotFilter(RangeFilter(min: 0, max: 10))
//     })
//   );

//   var tulokset = await kokoelma.search(query: kysely);
//   var dokumentit = tulokset.snapshots;
  
//   for (var i = 0; i < dokumentit.length; i++) {
//     var dokumentti = dokumentit[i].document;
//     var data = dokumentit[i].data;

//     if (data['arvo'] > 10) {
//       await dokumentti.update(data: {
//         'arvo': 10
//       });
//     }

//     if (data['arvo'] < 0) {
//       await dokumentti.update(data: {
//         'arvo': 0
//       });
//     }
//   }
  
// }