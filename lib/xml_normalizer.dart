import 'package:xml/xml.dart' as xml;

class XmlNormalizer {
  xml.XmlDocument normalize(String response) {
    String cleanResponse = _extractContent(response);
    return xml.parse(cleanResponse);
  }

  _extractContent(String response) {
    // extract content
    String start = "<!-- content 7 -->";
    int startIndex = response.indexOf(start);
    startIndex = startIndex + start.length;
    int endIndex = response.lastIndexOf("<!-- side right -->");
    response = response.substring(startIndex, endIndex);

    // Replaces
    response = response
        .replaceAll("\r", "")
        .replaceAll("\n", "")
        .replaceAll("<br>", "")
        .replaceAll("<hr>", "")
        .replaceAll("&ccedil;", "ç")
        .replaceAll("&atilde;", "ã")
        .replaceAll("checked", "")
        .replaceAll("color=black", "");

    // Appends
    String img = "class=\"img-thumbnail cbpq-consulta-img\">";
    response = response.replaceFirst(img, img + "</img>");

    return response;
  }

}
