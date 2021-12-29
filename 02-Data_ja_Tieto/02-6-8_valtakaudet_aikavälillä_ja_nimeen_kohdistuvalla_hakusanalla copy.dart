//Luo neliparametrinen funktio nimeltä valtakaudetAikavalillaJaHakusanalla. 
//Funktio saa parametrinaan presidenttejä sisältävän tietokokoelman, aikavälin 
// alkua kuvaavan kokonaisluvun, aikavälin loppua kuvaavan kokonaisluvun, ja 
// hakusanan. Funktion tulee tehdä tietokokoelmaan haku ja palauttaa lukumäärä 
// presidenteistä, joiden kausi on alkanut aikavälin alussa tai sen jälkeen ja 
// loppunut aikavälin lopussa tai sitä ennen, ja joiden nimessä esiintyy hakusana.


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
    await kokoelma.insert(data: {
        'nimi': 'Paasikivi, Juho Kusti', 
        'alku': 1946,
        'loppu': 1956
    });

    var lkm = await valtakaudetAikavalillaJaHakusanalla(
        kokoelma, 1900, 1960, 'Juho');
    print(lkm);
}

valtakaudetAikavalillaJaHakusanalla(kokoelma, alku, loppu, hakusana) async {
    var kysely = Query(
        filter: MapFilter(
            sorter: {
            'nimi': KeywordFilter(hakusana),
            'alku': RangeFilter(min: alku),
            'loppu': RangeFilter(max: loppu)
            })
        );
    var tulokset = await kokoelma.search(query: kysely);
    var dokumentit = tulokset.snapshots;

    return(dokumentit.length);    
}