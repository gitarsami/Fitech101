//Luo yksiparametrinen asynkroninen funktio nimeltä lisaa. 
//Funktio saa parametrinaan tietokannan. Funktion tulee luoda (tai hakea) tietokokoelma
// nimeltä 'tehtavat' ja lisätä tietokokoelmaan uusi tehtävä. 
//Tehtävän nimeksi ('nimi') asetetaan 'lisää tehtävä' ja tehtävää ei ole vielä tehty ('tehty': false). 

import 'package:database/database.dart';

var tietokanta = MemoryDatabaseAdapter().database();
await lisaa(tietokanta);

var hakutulos = await tietokanta.collection('tehtavat').search();
var dokumentit = hakutulos.snapshots;
print(dokumentit[0].data);

lisaa() {
  
}