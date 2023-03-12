import 'package:flutter/material.dart';

import 'dimens.dart';

class AppStyles {
  const AppStyles._();

  static const String fontFamily = 'Montserrat';
  static const textBaseline = TextBaseline.alphabetic;
  static const leadingDistribution = TextLeadingDistribution.even;

  static const TextStyle displayLarge = TextStyle(
    fontSize: 57.0,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.16,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.22,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.25,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.29,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.33,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.27,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );

  static TextTheme textTheme = const TextTheme(
    displayLarge: AppStyles.displayLarge,
    displayMedium: AppStyles.displayMedium,
    displaySmall: AppStyles.displaySmall,
    headlineLarge: AppStyles.headlineLarge,
    headlineMedium: AppStyles.headlineMedium,
    headlineSmall: AppStyles.headlineSmall,
    titleLarge: AppStyles.titleLarge,
    titleMedium: AppStyles.titleMedium,
    titleSmall: AppStyles.titleSmall,
    labelLarge: AppStyles.labelLarge,
    labelMedium: AppStyles.labelMedium,
    labelSmall: AppStyles.labelSmall,
    bodyLarge: AppStyles.bodyLarge,
    bodyMedium: AppStyles.bodyMedium,
    bodySmall: AppStyles.bodySmall,
  ).apply(fontSizeFactor: Dimens.s0 * 0.6);
}
