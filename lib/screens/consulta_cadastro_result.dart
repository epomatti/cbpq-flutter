import 'package:cbpq/commons/app_bar.dart';
import 'package:cbpq/model/cbpq.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            child: Text(
              '$name: ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: fontSize != null ? fontSize : 16,
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
    if (status.toUpperCase() == 'REGULAR') {
      return Colors.green;
    } else if (status.toUpperCase() == 'IRREGULAR') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Color validadeColor(context) {
    DateTime validade = DateFormat('yyyy-M-d').parse(cbpq.validade);
    DateTime now = DateTime.now();
    now = DateTime(now.year, now.month, now.day);
    DateTime warningDate =
        DateTime(validade.year, validade.month - 1, validade.day);
    if (now.isAfter(validade)) {
      return Colors.red;
    } else if (now.isAfter(warningDate)) {
      return Colors.orange[400];
    } else {
      return Theme.of(context).textTheme.body1.color;
    }
  }

  Widget buildInfoList(context) {
    return Column(
      children: <Widget>[
        Item(name: 'Atleta', value: cbpq.atleta),
        Item(
          name: 'Status',
          value: cbpq.status.toUpperCase(),
          textColor: statusColor(),
          fontWeight: FontWeight.bold,
          shadow: Shadow(
            color: Colors.black,
            blurRadius: 0.1,
            offset: Offset(0.5, 0.5),
          ),
          fontSize: 17,
        ),
        Item(name: 'CBPQ', value: cbpq.cbpq),
        Item(name: 'Categoria', value: cbpq.categoria),
        Item(name: 'Clube', value: cbpq.clube),
        Item(name: 'Federação', value: cbpq.federacao),
        Item(name: 'Filiação', value: cbpq.filiacao),
        Item(
          name: 'Validade',
          value: cbpq.validade,
          textColor: validadeColor(context),
        ),
        Item(name: 'Emissão', value: cbpq.emissao),
      ],
    );
  }

  _buildImage() {
    var hasImage = cbpq.imagem != null && cbpq.imagem.isNotEmpty;
    return Center(
      child: Container(
        width: 150,
        height: 150,
        child: hasImage
            ? Image(
                image: NetworkImage(cbpq.getImageUrl()),
              )
            : Image.asset('assets/no_foto.jpg'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Licença CBPQ',
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            _buildImage(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: buildInfoList(context),
            )
          ],
        ),
      ),
    );
  }
}
