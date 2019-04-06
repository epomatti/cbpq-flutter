import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  final titleText;

  DefaultAppBar({
    @required this.titleText,
  }) : super(
          title: Text(
            titleText
          ),
        );
}
