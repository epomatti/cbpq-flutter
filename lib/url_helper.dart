class UrlHelper {
  static const _baseUrl =
      'https://www.cbpq.org.br/site/filiados/consulta-licenca';

  urlCpf(String cpf) {
    return _buildUrl('cpf', cpf);
  }

  urlCbpq(String cbpq) {
    return _buildUrl('cbpq', cbpq);
  }

  _buildUrl(String name, String value) {
    return '$_baseUrl?$name=$value';
  }
}
