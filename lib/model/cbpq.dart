import 'package:flutter_dotenv/flutter_dotenv.dart';

class CBPQ {
  String status;
  String cbpq;
  String categoria;
  String atleta;
  String clube;
  String federacao;
  String filiacao;
  String validade;
  String emissao;
  String imagem;

  static CBPQ fromJson(Map<String, dynamic> json) {
    CBPQ cbpq = CBPQ();
    cbpq.status = json['status'];
    cbpq.cbpq = json['cbpq'];
    cbpq.categoria = json['categoria'];
    cbpq.atleta = json['atleta'];
    cbpq.clube = json['clube'];
    cbpq.federacao = json['federacao'];
    cbpq.filiacao = json['filiacao'];
    cbpq.validade = json['validade'];
    cbpq.emissao = json['emissao'];
    cbpq.imagem = json['imagem'];
    return cbpq;
  }

  String getImageUrl() {
    var base = DotEnv().env['IMAGE_BASE_URL'];
    return '$base/$imagem';
  }
}
