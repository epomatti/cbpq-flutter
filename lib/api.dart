import 'package:http/http.dart' as http;
import 'package:cbpq/url_helper.dart';
import 'package:cbpq/xml_normalizer.dart';
import 'package:xml/xml.dart';
import 'package:cbpq/mapping.dart';
import 'package:cbpq/cbpq.dart';

class Api {
  Future<CBPQ> call(String documento) {
    String url = UrlHelper().urlCbpq(documento);
    return http.read(url).then((text) {
      XmlDocument xml = XmlNormalizer().normalize(text);
      return Mapping().map(xml);
    });
  }
}
