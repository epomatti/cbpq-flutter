import 'package:cbpq/cbpq.dart';
import 'package:flutter/material.dart';
import 'package:cbpq/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Protótipo CBPQ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _documento;
  CBPQ _cbpq;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _cbpq = CBPQ();
      },
    );
  }

  _submit() {
    Api().call(_documento).then((cbpq) {
      setState(() {
        _cbpq = cbpq;
      });
    });
  }

  _onChange(String text) {
    this._documento = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CBPQ"),
      ),
      body: Center(
        child: Column(
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
              onPressed: () => _submit(),
              child: Text('Submit'),
            ),
            Text(_cbpq.atleta),
          ],
        ),
      ),
    );
  }
}
