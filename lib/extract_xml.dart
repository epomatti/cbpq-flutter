import 'package:xml/xml.dart' as xml;

/* steps
remove br
remove hr
remove ç ã
append </img> after class="img-thumbnail cbpq-consulta-img">
remove checked
remove  color=black
  */

class Extractor {
  xml.XmlDocument siteToXml(String response) {
    String cleanResponse = _extractContent(response);
    print(response);
    return xml.parse(cleanResponse);
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

    response.lastIndexOf("class=\"img-thumbnail cbpq-consulta-img\">", )

  }
}
