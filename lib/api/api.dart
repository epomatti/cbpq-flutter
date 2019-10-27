import 'package:cbpq/model/cbpq.dart';
import 'package:cbpq/screens/atleta_nao_encontrado.dart';
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
  return http.get(url).then((response) {
    var status = response.statusCode;
    if (status == 200) {
      var parsedJson = json.decode(response.body);
      return CBPQ.fromJson(parsedJson);
    } else if (status == 404) {
      return null;
    } else {
      throw Exception("Falha inesperada");
    }
  });
}
