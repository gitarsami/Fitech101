//Luo yksiparametrinen funktio nimenPerusteellaJarjestettyna. 
//Funktio saa parametrinaan presidenttejä sisältävän tietokokoelman. 
//Funktion tulee tehdä tietokokoelmaan haku ja palauttaa lista presidenttien 
// nimistä nimen perusteella järjestettynä. 

import 'package:database/database.dart';
import 'package:database/filter.dart';


main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    var kokoelma = tietokanta.collection('presidentit');
    await kokoelma.insert(data: {
        'nimi': 'Ståhlberg, Kaarlo Juho', 
        'alku': 1919,
        'loppu': 1925
    });
    await kokoelma.insert(data: {
        'nimi': 'Relander, Lauri Kristian', 
        'alku': 1925,
        'loppu': 1931
    });
    await kokoelma.insert(data: {
        'nimi': 'Svinhufvud, Pehr Evind', 
        'alku': 1931,
        'loppu': 1937
    });

    var nimet = await nimenPerusteellaJarjestettyna(kokoelma);

    for (var i = 0; i < nimet.length; i++) {
        print(nimet[i]);
    }
}

nimenPerusteellaJarjestettyna(kokoelma) async {
    var kysely = Query(
        sorter: PropertySorter('nimi', isDescending: false)
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