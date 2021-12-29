import 'dart:math';
import 'dart:html';

main() {
  querySelector('#uusi').onClick.listen(lisaa);
}

lisaa(e) async {
  var rnd = Random().nextDouble();
  ImageElement kuva = Element.img();
  kuva.src = 'https://cataas.com/c?type=small&t=$rnd';
  kuva.width = 100;
  
  var kuvaus = Element.p();
  kuvaus.text = 'kuvaus!';
  
  var kissa = Element.div();
  kissa.children.add(kuva);
  kissa.children.add(kuvaus);
  kissa.className = 'kissa';
  
  var kissat = querySelector('#kissat');
  kissat.children.add(kissa);
}