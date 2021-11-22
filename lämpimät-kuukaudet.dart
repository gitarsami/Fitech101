// Kirjoita yksiparametrinen funktio lampimatKuukaudet(String merkkijono), 
// joka saa parametrinaan kuukausi-keskilämpötila -pareja sisältävän merkkijonon. 
// Kukin kuukausi-keskilämpötila -pari on merkkijonossa omalla rivillään, 
// ja kuukausi ja lämpötila on eroteltu toisistaan pilkuilla. 
// Lämpötilat on esitetty aina kokonaislukuja. 
//
// Funktion tulee tulostaa vain kuukausien, joiden keskilämpötila on yli +15 astetta, nimet. 



main() {
    String merkkijono = '''
Tammikuu,-4
Helmikuu,-5
Maaliskuu,-1
Huhtikuu,4
Toukokuu,10
Kesäkuu,15
Heinäkuu,18
Elokuu,16
Syyskuu,12
Lokakuu,7
Marraskuu,2
Joulukuu,-2''';
lampimatKuukaudet(merkkijono);
}

lampimatKuukaudet(String merkkijono) {
    var rivit = merkkijono.split('\n');


    for (var i = 0; i < rivit.length; i++) {
        var rivi = rivit[i];        
        var osat = rivi.split(',');
        if (int.parse(osat[1]) <= 15) {
            continue;    
        }
        print(osat[0]);
    }
}