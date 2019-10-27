import 'dart:io';

import 'package:cbpq/commons/app_bar.dart';
import 'package:cbpq/commons/app_menu.dart';
import 'package:cbpq/factories/document_handler.dart';
import 'package:cbpq/screens/atleta_nao_encontrado.dart';
import 'package:cbpq/screens/consulta_cadastro_result.dart';
import 'package:flutter/material.dart';

class ConsultaCadastroForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsultaCadastroState();
}

class _ConsultaCadastroState extends State<ConsultaCadastroForm> {
  String documento;
  bool loading;
  String errorMessage;
  bool isButtonDisabled;
  String hint;
  DocumentType docType;
  DocumentHandler cpfHandler = CpfHandler();
  DocumentHandler cbpqHandler = CbpqHandler();

  @override
  void initState() {
    super.initState();
    loading = false;
    isButtonDisabled = true;
    docType = DocumentType.cbpq;
    hint = getDocHandler().hint;
  }

  DocumentHandler getDocHandler() {
    if (docType == DocumentType.cpf) {
      return cpfHandler;
    } else {
      return cbpqHandler;
    }
  }

  onChange(String text) {
    int value = int.tryParse(text);
    if (value != null) {
      if (value >= 0) {
        setState(() {
          documento = text;
          errorMessage = null;
          isButtonDisabled = false;
        });
      } else {
        setState(() {
          errorMessage = text.length > 0 ? 'Valor inválido.' : null;
          isButtonDisabled = true;
        });
      }
    } else {
      setState(() {
        errorMessage =
            text.length > 0 ? 'Digite apenas caracteres numéricos.' : null;
        isButtonDisabled = true;
      });
    }
  }

  onError(error) {
    if (error.runtimeType == SocketException) {
      setState(() {
        errorMessage = 'Falha de conexão.';
        loading = false;
      });
    } else {
      print(error);
      setState(() {
        errorMessage = 'Falha inesperada.';
        loading = false;
      });
    }
  }

  submit(BuildContext context) {
    if (getDocHandler().sumitValidate(documento) == false) {
      setState(() {
        errorMessage = 'Documento inválido.';
        isButtonDisabled = true;
      });
      return;
    }
    setState(() {
      loading = true;
    });
    getDocHandler().consultar(documento).then((cbpq) {
      // setState(() {
      //   loading = false;
      //   documento = null;
      //   isButtonDisabled = true;
      // });
      return cbpq;
    }).then((cbpq) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => cbpq != null
              ? ConsultaCadastroResult(cbpq)
              : AtletaNaoEncontrado(),
        ),
      );
    }).then((value) {
      setState(() {
        loading = false;
        documento = null;
        isButtonDisabled = true;
      });
    }).catchError((error) {
      onError(error);
    });
  }

  void changeDocumentType(DocumentType docType) {
    setState(() {
      this.docType = docType;
      this.hint = getDocHandler().hint;
    });
  }

  Widget buildButtonForBar(
    String text,
    DocumentType doctype,
    DocumentType doctypeCompare,
  ) {
    bool isNotSelected = docType == doctypeCompare;
    return RaisedButton(
      child: new Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 10.0,
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
        side: isNotSelected
            ? BorderSide(style: BorderStyle.none)
            : BorderSide(color: Colors.blue, width: 2.0),
      ),
      onPressed: isNotSelected
          ? () {
              changeDocumentType(doctype);
            }
          : null,
    );
  }

  Widget buildButtonBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: buildButtonForBar('CBPQ', DocumentType.cbpq, DocumentType.cpf),
        ),
        Expanded(
          child: buildButtonForBar('CPF', DocumentType.cpf, DocumentType.cbpq),
        ),
      ],
    );
  }

  Widget buildTextField() {
    return TextField(
      style: Theme.of(context).textTheme.display1,
      onChanged: (String text) {
        onChange(text);
      },
      autofocus: false,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorText: errorMessage != null ? errorMessage : null,
        errorStyle: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      onPressed: isButtonDisabled ? null : () => submit(context),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
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
        appBar: DefaultAppBar(
          titleText: 'Licença CBPQ',
          actions: <Widget>[
            Menu(),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50, left: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildButtonBar(),
                SizedBox(
                  height: 15.0,
                ),
                buildTextField(),
                SizedBox(
                  height: 20.0,
                ),
                buildSubmitButton(),
              ],
            ),
          ),
        ),
      );
    }
  }
}
