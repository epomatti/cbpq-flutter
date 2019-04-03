import 'dart:io';
import "package:test/test.dart";
import "package:cbpq/extract_xml.dart";
import "package:cbpq/api.dart";
import 'package:cbpq/url_helper.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

void main() {
  test("extract", () {
    print(File('/home/evandro/Desktop/data.txt').existsSync());
    String url = UrlHelper().urlCbpq('90155');
    print('url');
    http.read(url).then((text) {
      print('text');
      Extractor().siteToXml(text);
      print('print');
    });
  });
}
