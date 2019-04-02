import 'package:http/http.dart' as http;
import 'package:cbpq/url_helper.dart';
import 'package:cbpq/extract_xml.dart';

class Api {

  Future call() async {

    String url = UrlHelper().urlCbpq('90155');
    http.read(url).then((text) {
        Extractor(text).siteToXml();
    });
  }

  String removeHead(String xml) {
    int start = xml.indexOf('<head>');
    int end = xml.indexOf('</head>') + 7;
    return xml.replaceRange(start, end, '');
  }
}
