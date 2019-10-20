import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlHelper {
  static final _baseUrl = DotEnv().env['CBPQ_BASE_URL'] + '/api/licenca';

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
