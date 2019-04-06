import 'package:cbpq/screens/consulta_cadastro_form.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBPQ',
      home: ConsultaCadastroForm(),
    );
  }
}
