import 'dart:html';
import 'package:database/database.dart';

main() {
    var vaihtoehdot = [];
    vaihtoehdot.add({'teksti': '1+3', 'oikein': true});
    vaihtoehdot.add({'teksti': '3--2', 'oikein': false});
    vaihtoehdot.add({'teksti': '3', 'oikein': false});

    var kysymys = {};
    kysymys['teksti'] = 'Paljonko on 2+2?';
    kysymys['vaihtoehdot'] = vaihtoehdot;

    asetaKysymys(kysymys);
}

asetaKysymysteksti(teksti) {
  querySelector('#kysymys').text = teksti;
}

asetaVastausvaihtoehdot(vaihtoehdot) {
    querySelector('#vastaukset').children.clear();

    for (var i = 0; i < vaihtoehdot.length; i++) {
        lisaaVastausvaihtoehto(vaihtoehdot[i]);
        }
}

lisaaVastausvaihtoehto(vaihtoehto) {
    var elementti = Element.div();
    elementti.className = 'vaihtoehto';
    elementti.text = vaihtoehto['teksti'];

    querySelector('#vastaukset').children.add(elementti);
    }

asetaKysymys(kysymys) {
    asetaKysymysteksti(kysymys['teksti']);
    asetaVastausvaihtoehdot(kysymys['vaihtoehdot']);
}

lisaaVastausvaihtoehto(vaihtoehto) {
  var elementti = Element.div();
  elementti.className = 'vaihtoehto';
  elementti.text = vaihtoehto['teksti'];

  elementti.onClick.listen((e) {
    if (vaihtoehto['oikein']) {
      elementti.text = 'oikein!';
    } else {
      elementti.text = 'väärin!';
    }
  });

  querySelector('#vastaukset').children.add(elementti);
}
