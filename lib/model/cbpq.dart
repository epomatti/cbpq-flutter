class CBPQ {
  // 'REGULAR' 'INATIVO'
  String status;
  String cbpq;
  String categoria;
  String atleta;
  String clube;
  String federacao;
  String habilitacao;
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
    cbpq.habilitacao = json['habilitacao'];
    cbpq.filiacao = json['filiacao'];
    cbpq.validade = json['validade'];
    cbpq.emissao = json['emissao'];
    cbpq.imagem = json['imagem'];
    return cbpq;
  }
}
