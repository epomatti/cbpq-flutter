import 'package:cbpq/screens/consulta_cadastro_result.dart';
import 'package:flutter/material.dart';
import 'package:cbpq/commons/app_bar.dart';
import 'package:cbpq/api.dart';

class ConsultaCadastroForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsultaCadastroState();
}

class _ConsultaCadastroState extends State<ConsultaCadastroForm> {
  String _documento;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  _onChange(String text) {
    this._documento = text;
  }

  _submit(BuildContext context) {
    // setState(() {
    //   _loading = true;
    // });
    print('a');

    try {

    } catch (e) {
    }

    Api().call(_documento).then((cbpq) {
      setState(() {
        _loading = false;
      });
      return cbpq;
    }).then((cbpq) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConsultaCadastroResult(cbpq: cbpq)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
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
                  Text(
                    'Digite a CBPQ:',
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.display1,
                    onChanged: (String text) {
                      _onChange(text);
                    },
                    keyboardType: TextInputType.number,
                  ),
                  RaisedButton(
                    onPressed: () => _submit(context),
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
