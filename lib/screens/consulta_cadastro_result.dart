import 'package:cbpq/cbpq.dart';
import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';

class ConsultaCadastroResult extends StatelessWidget {

  final CBPQ _cbpq;

  const ConsultaCadastroResult(this._cbpq);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Consulta Cadastro',
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_cbpq.atleta),
                SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: CircleAvatar(
                    child: Image(
                      image: NetworkImage(_cbpq.foto),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}