import 'package:cbpq/model/cbpq.dart';
import "package:test/test.dart";

void main() {
  test("CBPQ.fromJson()", () {

    Map<String, dynamic> json = new Map<String,dynamic>();
    json['status'] = 'REGULAR';
    json['cbpq'] = '90155';
    json['categoria'] = 'A';
    json['atleta'] = 'Evandro Pomatti';
    json['clube'] = 'Droz Zone 47 Clube Escola Paraquedismo';
    json['federacao'] = 'Federação Catarinense de Paraqueismo';
    json['data_filiacao'] = '10/05/2018';
    json['data_validade_licenca'] = '27/06/2020';
    json['data_emissao_credencial'] = '13/05/2018';
    json['foto'] = 'https://www.cbpq.org.br/site/download/i/foto/90155.jpg';
    
    var cbpq = CBPQ.fromJson(json);

    expect(cbpq.status, 'REGULAR');
    expect(cbpq.cbpq, '90155');
    expect(cbpq.categoria, 'A');
    expect(cbpq.atleta, 'Evandro Pomatti');
    expect(cbpq.clube, 'Droz Zone 47 Clube Escola Paraquedismo');
    expect(cbpq.federacao, 'Federação Catarinense de Paraqueismo');
    expect(cbpq.filiacao, '10/05/2018');
    expect(cbpq.validade, '27/06/2020');
    expect(cbpq.emissao, '13/05/2018');
    expect(cbpq.imagem, 'https://www.cbpq.org.br/site/download/i/foto/90155.jpg');    

  });

}
