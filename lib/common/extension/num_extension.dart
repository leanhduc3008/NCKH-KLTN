import 'package:flutter/material.dart';

import '../utils/string_utils.dart';

extension NumExtension on num {
  SizedBox get gapHeight => SizedBox(height: toDouble());
  SizedBox get gapWidth => SizedBox(width: toDouble());

  EdgeInsets get insetHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get insetVertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get insetTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get insetBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get insetLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get insetRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get insetAll => EdgeInsets.all(toDouble());

  Radius get radius => Radius.circular(toDouble());
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  String get toCurrencyFormat => StringUtils.toCurrencyFormat(toDouble());
  String get toThousands => StringUtils.formatThousands(toDouble());
  String toPercent([int surplus = 2]) => StringUtils.formatPercent(
        toDouble(),
        surplus,
      );
}
