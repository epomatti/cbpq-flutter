import 'package:cbpq/screens/consulta_cadastro_result.dart';
import 'package:flutter/material.dart';
import 'package:cbpq/commons/app_bar.dart';
import 'package:cbpq/api.dart';

class ConsultaCadastroForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsultaCadastroState();
}

enum TipoDocumento { cpf, cbpq }

class _ConsultaCadastroState extends State<ConsultaCadastroForm> {
  String documento;
  bool loading;
  String errorMessage;
  bool isButtonDisabled;
  TipoDocumento tipoDocumento;

  @override
  void initState() {
    super.initState();
    loading = false;
    isButtonDisabled = true;
    tipoDocumento = TipoDocumento.cpf;
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

  void handleTipoDocumentoChanged(TipoDocumento value) {
    setState(() {
      tipoDocumento = value;
    });
  }

  Widget buildButtonBar() {
    return Center(
      child: new ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new RaisedButton(
            child: new Text('CPF'),
            onPressed: () {
              handleTipoDocumentoChanged(TipoDocumento.cpf);
            },
          ),
          new RaisedButton(
            child: new Text('CBPQ'),
            onPressed: () {
              handleTipoDocumentoChanged(TipoDocumento.cbpq);
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        style: Theme.of(context).textTheme.display1,
        onChanged: (String text) {
          onChange(text);
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          errorText: errorMessage != null ? errorMessage : null,
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      onPressed: isButtonDisabled ? null : () => submit(context),
      padding: EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 20.0,
      ),
      child: Text(
        'Consultar',
        style: Theme.of(context).textTheme.display1,
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtonBar(),
              SizedBox(
                height: 16.0,
              ),
              buildTextField(),
              SizedBox(
                height: 16.0,
              ),
              buildSubmitButton(),
            ],
          ),
        ),
      );
    }
  }
}
