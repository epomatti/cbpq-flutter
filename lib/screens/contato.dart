import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';

class Contato extends StatelessWidget {
  const Contato();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Contato',
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text("Envie uma sugestão, faça um elogio, ou reporte um problema."),
            TextField(
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }
}
