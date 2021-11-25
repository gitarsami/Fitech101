// Luo ensin luokka Kysymys, joka sisältää muuttujat kysymys (merkkijono) ja vastaus (merkkijono).
// Luokalla tulee olla kaksiparametrinen oletuskonstruktori, jolle annetaan parametrina kysymys ja vastaus.
// Lisää luokalle lisäksi toString-metodi, joka tulostaa Kysymys-luokasta tehdyn olion 


import 'dart:io';

main() {
    var kysymys = Kysymys('Mikä on hauki englanniksi?', 'pike');
    print(kysymys);
}

class Kysymys {
    String? kysymys;
    String? vastaus;

    Kysymys(this.kysymys,this.vastaus);

    toString() {
        return '$kysymys (vastaus: $vastaus)';
    }
}