import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';

class BuyMeaCoffee extends StatelessWidget {
  const BuyMeaCoffee();
  final String url = 'https://www.buymeacoffee.com/29ricNQ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Informações',
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text(
                'Olá! Meu nome é Evandro e sou o desenvolvedor desta aplicação. Agradeço por utilizá-la!'),
            Text(
                'E se gostou mesmo, fiquei à voltade e clique no link abaixo para me pagar um café e apoiar o meu trabalho =)'),
            IconButton(
              icon: Icon(Icons.favorite),
              iconSize: 100,
              tooltip: 'Compartilhar',
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
