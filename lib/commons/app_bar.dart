import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  final titleText;

  DefaultAppBar({
    @required this.titleText,
  }) : super(
          elevation: 0.0,
          title: Text(
            titleText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
        );
}
