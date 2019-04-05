import 'package:cbpq/cbpq.dart';
import 'package:xml/xml.dart';

class Mapping {
  CBPQ map(XmlDocument xml) {
    CBPQ cbpq = CBPQ();
    print(xml.children
        .elementAt(1).children.elementAt(1).children.elementAt(1));
    // XmlNode dados = xml.children
    //     .elementAt(1)
    //     .children
    //     .elementAt(0)
    //     .children
    //     .elementAt(0);

    //cbpq.status = _getValue(dados.children.elementAt(0));
    //print(cbpq);
    return cbpq;
  }

  String _getValue(XmlNode node) {
    return node.children
        .elementAt(1)
        .children
        .elementAt(0)
        .children
        .elementAt(0)
        .text;
  }
}
