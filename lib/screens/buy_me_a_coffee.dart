import 'package:cbpq/commons/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyMeaCoffee extends StatelessWidget {
  final String url = 'https://www.buymeacoffee.com/29ricNQ';
  final String email = 'evandro.pomatti@gmail.com';

  const BuyMeaCoffee();

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Informações',
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: <Widget>[
              Text('Olá, meu nome é Evandro e '),
              Container(
                width: 150,
                height: 150,
                //child: Image.asset('assets/dev.png'),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Contato: ',
                  ),
                  InkWell(
                    child: Text(
                      email,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    highlightColor: Colors.yellow,
                    onTap: () => launch('mailto:$email?subject=Contato'),
                  ),
                ],
              ),
              Text('Gostou do app? Me pague um café 😀'),
              Container(
                child: FlatButton(
                  onPressed: () {
                    _launchURL();
                  },
                  child: Image.asset('assets/buymeacoffee.png'),
                ),
              ),
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
