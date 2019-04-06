import 'package:http/http.dart' as http;
import 'package:cbpq/url_helper.dart';
import 'package:cbpq/xml_normalizer.dart';
import 'package:xml/xml.dart';
import 'package:cbpq/mapping.dart';
import 'package:cbpq/cbpq.dart';

Future<CBPQ> consultarCpf(String cpf) {
  String url = UrlHelper().urlCpf(cpf);
  return _read(url);
}

Future<CBPQ> consultarCbpq(String cbpq) {
  String url = UrlHelper().urlCbpq(cbpq);
  return _read(url);
}

Future<CBPQ> _read(String url) {
  return http.read(url).then((text) {
    XmlDocument xml = XmlNormalizer().normalize(text);
    return Mapping().map(xml);
  });
}
