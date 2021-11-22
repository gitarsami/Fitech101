
//Kirjoita kaksiparametrinen funktio nimeltä tulosta, 
// joka tulostaa sille ensimmäisenä parametrina annetun merkkijonon 
// toisena parametrina annetun kokonaisluvun kertoman määrän. 
// Huom! Funktion parametrien tyypit tulee määritellä eksplisiittisesti.

main() {
    String eka = 'HTestiää!"';
    int toka = 2;
    tulosta(eka, toka);
//    print (tulosta);
}

tulosta(String eka, int toka) {
    for (int i = 0; i < toka; i++) {
//        print('$eka' + '$toka' + '$i');
        print(eka);
    }
  //  return tulo;
}