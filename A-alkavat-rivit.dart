main() {
    String merkkijono = '''tekstiä
Aiheettoman
usealla melko lyhyellä
arivillä
rivillä!''';
    tulosta(merkkijono);    

}
tulosta(String merkkijono) {
    var rivit = merkkijono.split('\n');
  
    for (var i = 0; i < rivit.length; i++) {
        var rivi = rivit[i];
        if (rivi[0] == 'A') {
            print(rivit[i]);
        }
        if (rivi[0] == 'a') {
            print(rivit[i]);
        }
    }
}