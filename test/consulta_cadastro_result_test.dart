import 'package:cbpq/model/cbpq.dart';
import 'package:cbpq/screens/consulta_cadastro_result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:test/test.dart";

void main() {
  test("validade irregular", () {
    CBPQ cbpq = CBPQ();
    DateTime now = DateTime.now();
    cbpq.validade = DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month - 5, now.day));    
    Color color = ConsultaCadastroResult(cbpq).validadeColor(null);
    expect(Colors.red, color);
  });
  test("validade aviso", () {
    CBPQ cbpq = CBPQ();
    DateTime now = DateTime.now();
    cbpq.validade = DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, now.day + 5));    
    Color color = ConsultaCadastroResult(cbpq).validadeColor(null);
    expect(Colors.orange[400], color);
  });
}
