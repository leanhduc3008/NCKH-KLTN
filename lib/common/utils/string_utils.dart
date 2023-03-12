import 'package:intl/intl.dart';

import '../../l10n/generated/l10n.dart';

class StringUtils {
  StringUtils._();

  static const needleRegex = r'{#}';
  static const needle = '{#}';
  static final RegExp exp = RegExp(needleRegex);

  static String interpolate(String string, List l) {
    final Iterable<RegExpMatch> matches = exp.allMatches(string);

    assert(l.length == matches.length);

    var i = -1;
    return string.replaceAllMapped(exp, (match) {
      i = i + 1;
      return '${l[i]}';
    });
  }

  static String toCurrencyFormat(double money) {
    final oCcy = NumberFormat('#,###', 'en_US');
    return '${oCcy.format(money)}đ';
  }

  static String formatThousands(double number) {
    final formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(number);
  }

  static String formatPercent(double number, [int surplus = 2]) {
    String value = '';
    if (number.isInt) {
      value = number.toInt().toString();
      return value;
    } else {
      value = number.toStringAsFixed(surplus);
      final double checkValue = double.parse(value);
      if (checkValue.isInt) {
        value = checkValue.toInt().toString();
        return value;
      } else {
        return value;
      }
    }
  }

  static String toNumberFormat(int number) {
    final oCcy = NumberFormat('#,##0', 'en_US');
    return oCcy.format(number);
  }

  static String dateFormattedString(String dateTime) {
    final tempDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime);
    final str = DateFormat('dd/MM/yyyy').format(tempDate);
    return str;
  }

  static String phoneFormatString(String phoneNumber) {
    if (phoneNumber == '') {
      return phoneNumber;
    } else {
      final String formattedPhoneNumber =
          '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6, phoneNumber.length)}';
      return formattedPhoneNumber;
    }
  }

  static String convertToDate(DateTime dateTime) {
    return DateFormat.yMd().format(dateTime);
  }

  static String convertToTime(DateTime dateTime) {
    return DateFormat.Hms().format(dateTime);
  }

  static String convertToDateTime(DateTime dateTime) {
    return DateFormat.yMd().add_jm().format(dateTime);
  }

  static String convertToDateRelative(
    DateTime dateTime, {
    Duration? formatAfter,
    Duration? timeShowNow = const Duration(seconds: 10),
  }) {
    final DateTime now = DateTime.now();
    // After now
    if (dateTime.isAfter(now)) {
      return convertToDateTime(dateTime);
    }
    // Before formatAfter
    final Duration difference = dateTime.difference(now).abs();
    if (formatAfter != null && difference >= formatAfter) {
      return convertToDateTime(dateTime);
    }
    // Less timeShowNow
    if (timeShowNow != null && difference < timeShowNow) {
      return L10n.current.now;
    }
    // Defaut
    if (difference < const Duration(minutes: 1)) {
      return L10n.current.fewSecondsAgo;
    } else if (difference < const Duration(hours: 1)) {
      return L10n.current.minutes_relative(difference.inMinutes);
    } else if (difference < const Duration(days: 1)) {
      return L10n.current.hoursRelative(difference.inHours);
    } else if (difference < const Duration(days: 30)) {
      return L10n.current.daysRelative(difference.inDays);
    } else if (difference < const Duration(days: 90)) {
      return convertToDate(dateTime);
    } else {
      return convertToDateTime(dateTime);
    }
  }

  static String customStripHtmlIfNeeded(String text) {
    // The regular expression is simplified for an HTML tag (opening or
    // closing) or an HTML escape. We might want to skip over such expressions
    // when estimating the text directionality.
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
  }

  static String convertHtmlToString(String text) {
    final cutFristSpace = text.replaceFirst(RegExp(r'\s+'), ' ');
    final str = customStripHtmlIfNeeded(cutFristSpace);
    return str;
  }

  static bool isURL(String value) {
    final reg = RegExp(r'^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://).+');
    return reg.hasMatch(value);
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}
