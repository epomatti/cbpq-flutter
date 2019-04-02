import "package:test/test.dart";
import 'package:cbpq/url_helper.dart';

void main() {
  test("URL CPF", () {
    String expected = 'https://www.cbpq.org.br/site/filiados/consulta-licenca?cpf=123';
    String url = UrlHelper().urlCpf('123');
    expect(url, expected);
  });
  test("URL CBPQ", () {
    String expected = 'https://www.cbpq.org.br/site/filiados/consulta-licenca?cbpq=456';
    String url = UrlHelper().urlCbpq('456');
    expect(url, expected);
  });
}
