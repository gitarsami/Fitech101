import 'package:database/database.dart';


main() async {
    var tietokanta = MemoryDatabaseAdapter().database();
    await lisaa(tietokanta, 'keitä kahvia');
    await lisaa(tietokanta, 'anna keksi');
    var tulokset = await tietokanta.collection('tehtavat').search();
    var dokumentit = tulokset.snapshots;
    var lista = [];
    for (var i = 0; i < dokumentit.length; i++) {
    var data = dokumentit[i].data;
    lista.add(data);
    //print(data); 
    }
    print('Hakutuloksia: ${lista.length}');
    print('Hakutulokset: ${lista}');
}

lisaa(tietokanta, tehtava) {
    var kokoelma = tietokanta.collection('tehtavat');
    kokoelma.insert(data: {
    'nimi': tehtava,
    'tehty': false
});
}
lisaa2(tietokanta, tehtava) {
    var kokoelma = tietokanta.collection('tehtavat');
    kokoelma.insert(data: {
    'nimi': tehtava,
    'tehty': false
});
}