//Luo kolmeparametrinen funktio nimeltä kaudenAloituksetAikavalilla. 
//Funktio saa parametrinaan presidenttejä sisältävän tietokokoelman, aikavälin 
// alkua kuvaavan kokonaisluvun, ja aikavälin loppua kuvaavan kokonaisluvun. 
//Funktion tulee tehdä tietokokoelmaan haku ja palauttaa lukumäärä presidenteistä, 
// joiden kausi on alkanut annetulla välillä.

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

    var lkm = await kaudenAloituksetAikavalilla(kokoelma, 1900, 1930);
    print(lkm);
}


kaudenAloituksetAikavalilla(kokoelma, alku, loppu) async {
    var kysely = Query(
        filter: MapFilter({
            'alku': RangeFilter(min: alku, max: loppu)
            })
        );
    var tulokset = await kokoelma.search(query: kysely);
    var dokumentit = tulokset.snapshots;

    return(dokumentit.length);
}