import 'package:flutter/material.dart';

import '../../l10n/generated/l10n.dart';

extension ContextExtension on BuildContext {
  L10n get l10n => L10n.of(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textStyle => theme.textTheme;

  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);
}
