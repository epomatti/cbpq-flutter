class XmlNormalizer {
  String normalize(String response) {

    String clean = response;

    // extract content
    String start = "<!-- content 7 -->";
    int startIndex = clean.indexOf(start);
    startIndex = startIndex + start.length;
    int endIndex = clean.lastIndexOf("<!-- side right -->");
    clean = clean.substring(startIndex, endIndex);

    // Replaces
    clean = clean
        .replaceAll("\r", "")
        .replaceAll("\n", "")
        .replaceAll("<br>", "")
        .replaceAll("<hr>", "")
        .replaceAll("&ccedil;", "ç")
        .replaceAll("&atilde;", "ã")
        .replaceAll("checked", "")
        .replaceAll(" color=black", "")
        .replaceAll(" color=red", "");


    // Appends
    String img = "class=\"img-thumbnail cbpq-consulta-img\">";
    clean = clean.replaceFirst(img, img + "</img>");

    return clean;
  }
}
