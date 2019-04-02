import 'dart:io';
import 'dart:convert';
import 'package:cbpq/url_helper.dart';

Future main() async {
  String url = UrlHelper().urlCbpq('90155');
  Uri uri = Uri.parse(url);
  HttpClient client = new HttpClient();
  HttpClientRequest request = await client.getUrl(uri);
  HttpClientResponse response = await request.close();
  await response.transform(utf8.decoder /*5*/).forEach(print);
}