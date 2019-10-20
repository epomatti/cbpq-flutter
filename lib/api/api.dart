import 'package:cbpq/model/cbpq.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  print(url);
  return http.read(url).then((jsonData) {
    var parsedJson = json.decode(jsonData);
    return CBPQ.fromJson(parsedJson);
  });
}
