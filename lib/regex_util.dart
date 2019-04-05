class RegexUtil {
  static String replaceAllBlockRegex(
      String text, String start, String end, String replaceWith) {        
    return text.replaceAll(RegExp('/^$start|$end\$/'), replaceWith);
  }
}
