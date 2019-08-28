import 'package:cbpq/model/cbpq.dart';
import 'package:cbpq/xml/mapping.dart';
import 'package:cbpq/xml/xml_normalizer.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:xml/xml.dart' as xml;

import 'url_helper.dart';

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
    String cleanResponse = XmlNormalizer().normalize(text);
    XmlDocument xmlDocument = xml.parse(cleanResponse);
    return Mapping().map(xmlDocument);
  });
}
