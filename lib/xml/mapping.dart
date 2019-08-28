import 'package:cbpq/model/cbpq.dart';
import 'package:xml/xml.dart';

class Mapping {
  CBPQ map(XmlDocument xml) {
    CBPQ cbpq = CBPQ();
    var root = xml.children[1].children[15];
    // Data

    if (root.children[0].toString() == 'ATLETA NÃO ENCONTRADO') {
      return null;
    }

    var dataRoot = root.children[1];
    var div = dataRoot.children;
    cbpq.status = _getValue1(div[1]);
    cbpq.cbpq = _getValue2(div[3]);
    cbpq.categoria = _getValue2(div[5]);
    cbpq.atleta = _getValue2(div[7]);
    cbpq.clube = _getValue2(div[9]);
    cbpq.federacao = _getValue2(div[11]);
    cbpq.habilitacao = _getValue2(div[13]);
    cbpq.filiacao = _getValue2(div[15]);
    cbpq.validade = _getValue1(div[17]);

    // Img
    var imgRoot = root.children[3];
    String imgPath =
        imgRoot.children[1].children[1].children[1].attributes[0].value;
    cbpq.foto = 'http:$imgPath';

    // Emissão
    cbpq.emissao = xml
        .children[1].children[17].children[3].children[1].children[2]
        .toString()
        .trim();

    return cbpq;
  }

  String _getValue1(XmlNode node) {
    return node.children[1].children[3].children[1].children[0].children[0]
        .toString();
  }

  String _getValue2(XmlNode node) {
    return node.children[1].children[3].children[1].children[0].toString();
  }
}
