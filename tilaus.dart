// Luo luokka nimeltä Tilaus. Tilauksella on asiakas (merkkijono), tuote (merkkijono), ja kesto (kokonaisluku). 
// Tuotteen oletusarvon tulee olla 'Aku Ankka' ja tilauksen keston 12 (kuukautta). 
// Lisää luokalle Tilaus myös toString-metodi, joka palauttaa tilauksen tiedot pilkuilla eroteltuna "asiakas,tuote,kesto".

main() {
    var tilaus = Tilaus();
    print(tilaus);
    tilaus.asiakas = 'Sylvi';
    print(tilaus);
    tilaus.kesto = 24;
    print(tilaus);
}

class Tilaus {
    String? asiakas;
    String tuote = '';
    int kesto = 12;

    toString() {
        return '$asiakas,$tuote,$kesto';
    }
}