import 'package:cbpq/cbpq.dart';
import 'package:xml/xml.dart';

class Mapping {
  CBPQ map(XmlDocument xml) {
    CBPQ cbpq = CBPQ();
    //print(xml.toXmlString(pretty: true, indent: '\t'));
    print(xml.children[1].children[15].children[1]);
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
