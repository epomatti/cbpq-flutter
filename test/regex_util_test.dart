import "package:test/test.dart";
import 'package:cbpq/regex_util.dart';

void main() {
  test("Replace All Regex", () {
    String text = "123<!--\n\r-->456<!--\n\r-->789";
    String result = RegexUtil.replaceAllBlockRegex(text, "<!--", "-->", "");
    expect(result, "123456789");
  });
}
