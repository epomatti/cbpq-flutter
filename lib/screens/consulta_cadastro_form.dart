import 'package:cbpq/commons/app_bar.dart';
import 'package:cbpq/factories/document_handler.dart';
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
    docType = DocumentType.cpf;
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
    getDocHandler().consultar(documento).then((cbpq) {
      setState(() {
        loading = false;
      });
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
          child: buildButtonForBar('CPF', DocumentType.cpf, DocumentType.cbpq),
        ),
        Expanded(
          child: buildButtonForBar('CBPQ', DocumentType.cbpq, DocumentType.cpf),
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
          titleText: 'Consultar Licença',
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
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
