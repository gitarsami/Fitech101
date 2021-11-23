// Luo luokka Joukkue. Jokaisella joukkueella tulee olla nimi, kotikaupunki ja perustamisvuosi.

main() {
    var joukkue = Joukkue();
    joukkue.nimi = 'FPS';
    joukkue.kotikaupunki = 'Forssa';
    joukkue.perustamisvuosi = 1931;
    print('nimi: ${joukkue.nimi}');
    print('kotikaupunki: ${joukkue.kotikaupunki}');
    print('perustamisvuosi: ${joukkue.perustamisvuosi}');
}

class Joukkue {
    String? nimi;
    String? kotikaupunki;
    int? perustamisvuosi;
}