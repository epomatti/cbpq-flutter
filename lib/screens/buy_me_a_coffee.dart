import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyMeaCoffee extends StatelessWidget {
  const BuyMeaCoffee();
  final String url = 'https://cbpq-58c95.firebaseapp.com/buymeacoffee.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Informações',
      ),
      body: Center(
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
