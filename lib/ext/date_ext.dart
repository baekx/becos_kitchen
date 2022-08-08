import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateExt on DateTime? {
  String dateOfMonth() {
    if (this == null) return '';
    return DateFormat('yyyy/MM/dd').format(this!);
  }

  String dateOfMonthWithWeek() {
    if (this == null) return '';
    initializeDateFormatting('ja');
    return DateFormat.yMMMEd('ja').format(this!);
  }
}
