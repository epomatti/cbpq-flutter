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
  String toxicologico;
  String cma;
  String cem;
  String imagem;

  static CBPQ fromJson(Map<String, dynamic> json) {
    CBPQ cbpq = CBPQ();
    cbpq.status = json['status'];
    cbpq.cbpq = json['cbpq'];
    cbpq.categoria = json['categoria'];
    cbpq.atleta = json['atleta'];
    cbpq.clube = json['clube'];
    cbpq.federacao = json['federacao'];
    cbpq.filiacao = json['data_filiacao'];
    cbpq.validade = json['data_validade_licenca'];
    cbpq.emissao = json['data_emissao_credencial'];
    cbpq.toxicologico = json['data_validade_toxicologico'];
    cbpq.cma = json['data_validade_cma'];
    cbpq.cem = json['data_validade_cem'];
    cbpq.imagem = json['foto'];
    return cbpq;
  }

  String getImageUrl() {
    var base = DotEnv().env['IMAGE_BASE_URL'];
    return '$base/$imagem';
  }
}
