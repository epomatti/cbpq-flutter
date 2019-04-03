import 'package:xml/xml.dart' as xml;
import 'dart:io';

/* steps
remove br
remove hr
remove ç ã
append </img> after class="img-thumbnail cbpq-consulta-img">
remove checked
remove  color=black
  */

class Extractor {
   siteToXml(String response) {
    String cleanResponse = _extractContent(response);
    //print(response);
    write(cleanResponse);
    //return xml.parse(cleanResponse);
  }

  _extractContent(String response) {
    // extract content
    String start = "<!-- content 7 -->";
    int startIndex = response.indexOf(start);
    startIndex = startIndex + start.length;
    int endIndex = response.lastIndexOf("<!-- side right -->");
    response = response.substring(startIndex, endIndex);

    // replaces
    response = response
        .replaceAll("<br>", "")
        .replaceAll("<hr>", "")
        .replaceAll("&ccedil;", "ç")
        .replaceAll("&atilde;", "ã")
        .replaceAll("checked", "")
        .replaceAll("color=black", "");

    // Appends
    String img = "class=\"img-thumbnail cbpq-consulta-img\">";
    response.replaceFirst(img, img + "</img>");

    return response;
  }

  write(String cleanResponse) async {
    print(File('/home/evandro/Desktop/data.txt').existsSync());
  var file = File('/home/evandro/Desktop/data.txt').createSync();
  var contents;
    var fileCopy = await File('/home/evandro/Desktop/data.txt').writeAsString(cleanResponse);
    //print(await fileCopy.exists());
    //print(await fileCopy.length());

}
}
