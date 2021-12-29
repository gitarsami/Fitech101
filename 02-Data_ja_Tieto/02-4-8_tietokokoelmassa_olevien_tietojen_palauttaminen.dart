//Luo yksiparametrinen asynkroninen funktio nimeltä tulosta. 
//Funktio saa parametrinaan tietokokoelman. 
//Funktion tulee hakea tietokokoelmassa olevat arvot ja tulostaa ne.

import 'package:database/database.dart';


main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('vuodet');
    await kokoelma.insert(data: {'vuosi' : 1915});
    await kokoelma.insert(data: {'vuosi' : 1916});
    await kokoelma.insert(data: {'vuosi' : 1917});

    var lista = await palauta(kokoelma);
    for (var i = 0; i < lista.length; i++) {
        print(lista[i]);
    }

}

palauta(kokoelma) async {
    var tulokset = await kokoelma.search();
    var dokumentit = tulokset.snapshots;
    var lista = [];
    for (var i = 0; i < dokumentit.length; i++) {
        var data = dokumentit[i].data;
        lista.add(data);
    }
    return(lista);

}
