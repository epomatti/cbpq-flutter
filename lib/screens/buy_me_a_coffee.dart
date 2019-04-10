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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              SizedBox(width: 20, height: 20),
              Text(
                'Sobre o aplicativo',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(width: 10, height: 10),
              Text(
                'Dados obtidos online diretamente do site oficial da Federação (www.cbpq.org.br).',
                // textAlign: TextAlign.,
              ),
              SizedBox(width: 20, height: 20),
              Text(
                'Desenvolvedor',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(width: 10, height: 10),
              Text(
                'Evandro Pomatti é um desenvolvedor de sistemas e paraquedista de Santa Catarina. Feito por paraquedistas, para paraquedistas ;)',
                // textAlign: TextAlign.center,
              ),
              SizedBox(width: 10, height: 10),
              Center(child:  Container(
                width: 120,
                height: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dev.png'),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                ),
              ),),
             
              SizedBox(width: 20, height: 20),
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
              SizedBox(width: 20, height: 20),
              Text(
                'Gostou do app? Me pague um café 😁',
                textAlign: TextAlign.center,
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    _launchURL();
                  },
                  child: Image.asset(
                    'assets/buymeacoffee.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
