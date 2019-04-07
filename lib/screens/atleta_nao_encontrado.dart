import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';

class AtletaNaoEncontrado extends StatelessWidget {
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
            children: <Widget>[
              Text(
                'Atleta não encontrado',
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
