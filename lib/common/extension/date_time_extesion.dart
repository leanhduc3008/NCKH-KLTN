import '../utils/utils.dart';

extension DateTimeExtesion on DateTime {
  String get toDateString => StringUtils.convertToDate(this);
  String get toDateTimeString => StringUtils.convertToDateTime(this);
  String get toRelativeString => StringUtils.convertToDateRelative(this);
}
