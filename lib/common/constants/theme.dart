// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'styles.dart';

class AppColors {
  static const Color black = Color(0xFF000000);

  static const Color dark = Color(0xFF1E232C);

  static const Color white = Color(0xFFFFFFFF);

  static const Color bgLogin = Color(0xFFF5F5F5);

  static const Color bgTextFormField = Color(0xFFF7F8F9);

  static const Color borderTextFormField = Color(0xFFDADADA);

  static const Color blueText = Color(0xFF35C2C1);

  static const Color disabled = Color(0xFFeaeaea);

  static const Color grayColor = Color(0xFF979797);

  static const Color grayText = Color(0xFF6A707C);

  static const Color transparentColor = Color(0x00000000);

  static const Color defaultColor = Color(0xFF888888);

  static const Color primary = Color(0xFF0F61A4);

  static const Color secondary = Color(0xFF535F70);

  static const Color label = Color(0xFFFE2472);

  static const Color neutral = Color(0x33FFFFFF);

  static const Color tabs = Color.fromRGBO(222, 222, 222, 0.3);

  static const Color info = Color.fromRGBO(44, 168, 255, 1.0);

  static const Color error = Color.fromRGBO(255, 54, 54, 1.0);

  static const Color success = Color.fromRGBO(24, 206, 15, 1.0);

  static const Color warning = Color.fromRGBO(255, 178, 54, 1.0);

  static const Color text = Color.fromRGBO(44, 44, 44, 1.0);

  static const Color bgColorScreen = Color.fromRGBO(255, 255, 255, 1.0);

  static const Color border = Color.fromRGBO(165, 165, 165, 1);

  static const Color inputSuccess = Color.fromRGBO(27, 230, 17, 1.0);

  static const Color input = Color.fromRGBO(220, 220, 220, 1.0);

  static const Color inputError = Color.fromRGBO(255, 54, 54, 1.0);

  static const Color muted = Color.fromRGBO(136, 152, 170, 1.0);

  static const Color time = Color.fromRGBO(154, 154, 154, 1.0);

  static const Color priceColor = Color.fromRGBO(234, 213, 251, 1.0);

  static const Color active = Color.fromRGBO(249, 99, 50, 1.0);

  static const Color buttonColor = Color.fromRGBO(156, 38, 176, 1.0);

  static const Color hintText = Color.fromRGBO(159, 165, 170, 1.0);

  static const Color switchON = Color.fromRGBO(249, 99, 50, 1.0);

  static const Color switchOFF = Color.fromRGBO(137, 137, 137, 1.0);

  static const Color socialFacebook = Color.fromRGBO(59, 89, 152, 1.0);

  static const Color socialTwitter = Color.fromRGBO(91, 192, 222, 1.0);

  static const Color socialDribbble = Color.fromRGBO(234, 76, 137, 1.0);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0F61A4),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD2E4FF),
    onPrimaryContainer: Color(0xFF001C37),
    secondary: Color(0xFF535F70),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD7E3F8),
    onSecondaryContainer: Color(0xFF101C2B),
    tertiary: Color(0xFF6C5677),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFF4D9FF),
    onTertiaryContainer: Color(0xFF261431),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFDFCFF),
    onBackground: Color(0xFF1A1C1E),
    surface: Color(0xFFFDFCFF),
    onSurface: Color(0xFF1A1C1E),
    surfaceVariant: Color(0xFFDFE2EB),
    onSurfaceVariant: Color(0xFF43474E),
    outline: Color(0xFF73777F),
    onInverseSurface: Color(0xFFF1F0F4),
    inverseSurface: Color(0xFF2F3033),
    inversePrimary: Color(0xFFA1C9FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF0F61A4),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFA1C9FF),
    onPrimary: Color(0xFF00325A),
    primaryContainer: Color(0xFF004880),
    onPrimaryContainer: Color(0xFFD2E4FF),
    secondary: Color(0xFFBBC7DB),
    onSecondary: Color(0xFF263141),
    secondaryContainer: Color(0xFF3C4858),
    onSecondaryContainer: Color(0xFFD7E3F8),
    tertiary: Color(0xFFD8BDE4),
    onTertiary: Color(0xFF3C2947),
    tertiaryContainer: Color(0xFF533F5F),
    onTertiaryContainer: Color(0xFFF4D9FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1C1E),
    onBackground: Color(0xFFE3E2E6),
    surface: Color(0xFF1A1C1E),
    onSurface: Color(0xFFC6C6CA),
    surfaceVariant: Color(0xFF43474E),
    onSurfaceVariant: Color(0xFFC3C6CF),
    outline: Color(0xFF8D9199),
    onInverseSurface: Color(0xFF1A1C1E),
    inverseSurface: Color(0xFFE3E2E6),
    inversePrimary: Color(0xFF0F61A4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFA1C9FF),
  );
}

class AppTheme {
  const AppTheme._();

  static final ThemeData light = ThemeData.from(
    useMaterial3: true,
    textTheme: AppStyles.textTheme,
    colorScheme: AppColors.lightColorScheme,
  );

  static final ThemeData dark = ThemeData.from(
    useMaterial3: true,
    textTheme: AppStyles.textTheme,
    colorScheme: AppColors.darkColorScheme,
  );
}
