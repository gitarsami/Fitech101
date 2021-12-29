//Luo yksiparametrinen asynkroninen funktio nimeltä nimet. 
//Funktio saa parametrinaan henkilöitä sisältävän tietokokoelman. 
//Funktion tulee hakea tietokokoelmassa olevat henkilöt, lisätä kunkin henkilön nimi listalle,
// ja palauttaa nimet listana.

import 'package:database/database.dart';

main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('henkilot');
    await kokoelma.insert(data: {'nimi': 'Ada Lovelace'});
    await kokoelma.insert(data: {'nimi': 'Ramon Llull'});
    await kokoelma.insert(data: {'nimi': 'Blaise Pascal'});

    var lista = await nimet(kokoelma);
    for (var i = 0; i < lista.length; i++) {
        print(lista[i]);
    }
}

nimet(kokoelma) async {
    var tulokset = await kokoelma.search();
    var dokumentit = tulokset.snapshots;
    //print(dokumentit[1].data['nimi']);
    var lista = [];
    for (var i = 0; i < dokumentit.length; i++) {
        var data = dokumentit[i].data['nimi'];
        lista.add(data);
    }
    return(lista);

}