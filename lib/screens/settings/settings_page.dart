import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import '../../widgets/appbar/app_navbar.dart';
import 'settings_view_model.dart';

class SettingsPage extends GetView<SettingsViewModel> {
  const SettingsPage({super.key});

  static const String routePath = '/SettingsPage';
  static Future<void>? goToPage() {
    return Get.toNamed(SettingsPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: RouteMenu.drawer,
        appBar: AppNavbar(title: context.l10n.settings_page),
        body: Padding(
          padding: Dimens.s3.insetAll,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(context.l10n.dark_theme),
                trailing: Obx(() => Switch.adaptive(
                      value: controller.useDarkMode.value,
                      onChanged: controller.changedTheme,
                      activeColor: context.colorScheme.primary,
                    )),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(context.l10n.english),
                trailing: Obx(() => Switch.adaptive(
                      value: controller.useEnglish.value,
                      onChanged: controller.changedLanguage,
                      activeColor: context.colorScheme.primary,
                    )),
              )
            ],
          ),
        ));
  }
}
