import 'package:cbpq/commons/date_util.dart';
import "package:test/test.dart";

void main() {
  test("convertToBrDate", () {
    // arrange
    var isoDate = '2019-10-27';
    var expected = '27/10/2019';
    // act
    var actual = DateUtil.convertToBrDate(isoDate);
    // assert
    expect(actual, expected);
  });
}