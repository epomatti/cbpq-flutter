import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  final titleText;
  final actions;

  DefaultAppBar({
    @required this.titleText,
    this.actions,
  }) : super(
          title: Text(titleText),
          actions: actions,
        );
}
