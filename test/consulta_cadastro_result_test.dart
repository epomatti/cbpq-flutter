import 'package:cbpq/cbpq.dart';
import 'package:cbpq/screens/consulta_cadastro_result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:test/test.dart";
import 'package:cbpq/url_helper.dart';

void main() {
  test("validade regular", () {
    CBPQ cbpq = CBPQ();
    DateTime now = DateTime.now();
    cbpq.validade = DateFormat('dd/MM/yyyy').format(DateTime(now.year, now.month + 3, now.day));    
    Color color = ConsultaCadastroResult(cbpq).validadeColor();
    expect(Colors.green, color);
  });
  test("validade irregular", () {
    CBPQ cbpq = CBPQ();
    DateTime now = DateTime.now();
    cbpq.validade = DateFormat('dd/MM/yyyy').format(DateTime(now.year, now.month - 5, now.day));    
    Color color = ConsultaCadastroResult(cbpq).validadeColor();
    expect(Colors.red, color);
  });
  test("validade irregular", () {
    CBPQ cbpq = CBPQ();
    DateTime now = DateTime.now();
    cbpq.validade = DateFormat('dd/MM/yyyy').format(DateTime(now.year, now.month, now.day + 5));    
    Color color = ConsultaCadastroResult(cbpq).validadeColor();
    expect(Colors.yellow, color);
  });
}
