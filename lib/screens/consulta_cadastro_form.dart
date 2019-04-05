import 'package:cbpq/screens/consulta_cadastro_result.dart';
import 'package:flutter/material.dart';
import 'package:cbpq/commons/app_bar.dart';
import 'package:cbpq/api.dart';

class ConsultaCadastroForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsultaCadastroState();
}

class _ConsultaCadastroState extends State<ConsultaCadastroForm> {
  String documento;
  bool loading;
  String errorMessage;
  bool isButtonDisabled;

  @override
  void initState() {
    super.initState();
    loading = false;
    isButtonDisabled = true;
  }

  onChange(String text) {
    int value = int.tryParse(text);
    if (value != null) {
      setState(() {
        documento = text;
        errorMessage = null;
        isButtonDisabled = false;
      });
    } else {
      setState(() {
        errorMessage =
            text.length > 0 ? 'Digite apenas caracteres numéricos.' : null;
        isButtonDisabled = true;
      });
    }
  }

  submit(BuildContext context) {
    setState(() {
      loading = true;
    });

    // Todo: Tratar exceção
    Api().call(documento).then((cbpq) {
      setState(() {
        loading = false;
      });
      print(cbpq.atleta);
      return cbpq;
    }).then((cbpq) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConsultaCadastroResult(cbpq),
        ),
      );
    });
  }

  TextField buildTextField() {
    return TextField(
      style: Theme.of(context).textTheme.display1,
      onChanged: (String text) {
        onChange(text);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        errorText: errorMessage != null ? errorMessage : null,
        hintText: 'Número da CBPQ',
      ),
    );
  }

  RaisedButton buildSubmitButton() {
    return RaisedButton(
      onPressed: isButtonDisabled ? null : () => submit(context),
      child: Text('Submit'),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
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
                  buildTextField(),
                  buildSubmitButton(),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
