import 'package:http/http.dart' as http;
import 'package:cbpq/url_helper.dart';
import 'package:cbpq/extract_xml.dart';

class Api {
  Future call() async {
    String url = UrlHelper().urlCbpq('90155');
    http.read(url).then((text) {
      Extractor().siteToXml(text);
    });
  }
}
