import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/app_provider.dart';

class SettingsViewModel extends GetxController {
  final AppProvider provider = Get.find();

  final useDarkMode = RxBool(false);
  final useEnglish = RxBool(false);

  @override
  void onReady() {
    super.onReady();
    useDarkMode.value = provider.themeMode == ThemeMode.dark;
    useEnglish.value = provider.locale.languageCode == 'en';
  }

  void changedTheme(bool value) {
    useDarkMode.value = value;
    provider.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  void changedLanguage(bool value) {
    useEnglish.value = value;
    provider.changeLocale(value ? const Locale('en') : const Locale('vi'));
  }
}
