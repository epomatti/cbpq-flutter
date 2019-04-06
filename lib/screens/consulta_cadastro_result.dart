import 'package:cbpq/cbpq.dart';
import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String name;
  final String value;
  final Color textColor;
  final FontWeight fontWeight;
  final Shadow shadow;
  final double fontSize;

  const Item({
    @required this.name,
    @required this.value,
    this.textColor,
    this.fontWeight,
    this.shadow,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            height: 30,
            child: Text(
              '$name: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 30,
            child: Text(
              value,
              style: TextStyle(
                fontSize: fontSize != null ? fontSize : 20,
                color: textColor,
                fontWeight: fontWeight,
                shadows: <Shadow>[
                  shadow,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultaCadastroResult extends StatelessWidget {
  final CBPQ cbpq;

  const ConsultaCadastroResult(this.cbpq);

  Color statusColor() {
    String status = cbpq.status;
    if (status == 'REGULAR') {
      return Colors.green;
    } else if (status == 'INATIVO') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Widget buildInfoList() {
    return Column(
      children: <Widget>[
        Item(name: 'Atleta', value: cbpq.atleta),
        Item(
          name: 'Status',
          value: cbpq.status,
          textColor: statusColor(),
          fontWeight: FontWeight.bold,
          shadow: Shadow(
            color: Colors.black,
            blurRadius: 0.1,
            offset: Offset(0.5, 0.5),
          ),
          fontSize: 22,
        ),
        Item(name: 'CBPQ', value: cbpq.cbpq),
        Item(name: 'Categoria', value: cbpq.categoria),
        Item(name: 'Clube', value: cbpq.clube),
        Item(name: 'Federação', value: cbpq.federacao),
        Item(name: 'Habilitação', value: cbpq.habilitacao),
        Item(name: 'Filiação', value: cbpq.filiacao),
        Item(name: 'Validade', value: cbpq.validade),
        Item(name: 'Emissão', value: cbpq.emissao),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Licença',
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: Container(
                width: 150,
                height: 150,
                child: Image(
                  image: NetworkImage(cbpq.foto),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: buildInfoList(),
            )
          ],
        ),
      ),
    );
  }
}
