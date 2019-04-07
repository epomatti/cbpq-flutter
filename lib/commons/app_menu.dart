import 'package:cbpq/screens/buy_me_a_coffee.dart';
import 'package:cbpq/screens/contato.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Widget>(
      onSelected: (Widget screen) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Widget>>[
            const PopupMenuItem<Widget>(
              value: Contato(),
              child: Text('Contato'),
            ),
            const PopupMenuItem<Widget>(
              value: BuyMeaCoffee(),
              child: Text('Informações'),
            ),
          ],
    );
  }
}
