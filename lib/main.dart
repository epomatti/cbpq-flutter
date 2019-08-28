import 'package:cbpq/screens/SplashPage.dart';
import 'package:cbpq/screens/consulta_cadastro_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBPQ',
      home: new SplashPage(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => new ConsultaCadastroForm(),
      },
    );
  }
}
