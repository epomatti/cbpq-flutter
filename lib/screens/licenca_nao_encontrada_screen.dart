import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';

class LicencaNaoEncontrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Licença CBPQ',
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 50, left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Licença não encontrada'),
            ],
          ),
        ),
      ),
    );
  }
}
