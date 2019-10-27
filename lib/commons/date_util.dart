import 'package:intl/intl.dart';

class DateUtil {
  static convertToBrDate(String isoDate) {
    DateTime date = DateFormat('yyyy-M-d').parse(isoDate);
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
