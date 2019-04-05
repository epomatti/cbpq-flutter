import 'package:http/http.dart' as http;
import 'package:cbpq/url_helper.dart';
import 'package:cbpq/extract_xml.dart';

class Api {
  void call(String documento) {
    String url = UrlHelper().urlCbpq(documento);
    http.read(url).then((text) {
      Extractor().siteToXml(text);
    });
  }
}
