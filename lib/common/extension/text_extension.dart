import 'package:flutter/widgets.dart';

import '../utils/utils.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get weight100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get weight300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get weight400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get weight500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get weight700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get weight900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension StringExtension on String {
  String get toDateFormattedString => StringUtils.dateFormattedString(this);
}
