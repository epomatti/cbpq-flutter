import 'package:http/http.dart' as http;
import 'package:cbpq/url_helper.dart';
import 'package:cbpq/xml_normalizer.dart';
import 'package:xml/xml.dart';
import 'package:cbpq/mapping.dart';

class Api {
  void call(String documento) {
    String url = UrlHelper().urlCbpq(documento);
    http.read(url).then((text) {
      XmlDocument xml = XmlNormalizer().normalize(text);
      Mapping().map(xml);
    });
  }
}
