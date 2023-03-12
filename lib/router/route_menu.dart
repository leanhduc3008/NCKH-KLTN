import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';

import '../common/constants/dimens.dart';
import '../common/extension/extenstion.dart';
import '../data/provider/app_provider.dart';
import '../data/provider/auth_provider.dart';
import '../l10n/generated/l10n.dart';
import '../screens/floor/floor_page.dart';
import '../screens/home/home_page.dart';
import '../screens/login/login_page.dart';
import '../screens/profile/profile_page.dart';
import '../screens/settings/settings_page.dart';
import '../screens/template/colors.dart';
import '../screens/template/components.dart';
import '../screens/template/template_page.dart';
import '../widgets/widget.dart';

class RouteMenu {
  const RouteMenu._();

  static final Widget drawer = Builder(builder: (context) {
    final AppProvider provider = Get.find();
    final List<AppDrawerItem> menu = [
      AppDrawerItem(
        icon: FontAwesomeIcons.house,
        label: L10n.current.home_page,
        routePath: HomePage.routePath,
        onTap: HomePage.goToPage,
      ),
      AppDrawerItem(
        icon: Icons.room,
        label: L10n.current.floors_page,
        routePath: FloorPage.routePath,
        items: provider.floors
            .map<AppDrawerItem>((floor) => AppDrawerItem(
                  icon: _iconFromInt(floor.position),
                  label: floor.name,
                  routePath: '${FloorPage.routePath}/${floor.name}',
                  onTap: () => FloorPage.goToPage(floor),
                ))
            .toList(),
      ),
      AppDrawerItem(
        icon: FontAwesomeIcons.user,
        label: L10n.current.profile_page,
        routePath: ProfilePage.routePath,
        onTap: ProfilePage.goToPage,
      ),
      AppDrawerItem(
        icon: FontAwesomeIcons.gear,
        label: L10n.current.settings_page,
        routePath: SettingsPage.routePath,
        onTap: SettingsPage.goToPage,
      ),
      const AppDrawerItem(
        icon: FontAwesomeIcons.compassDrafting,
        label: 'Template',
        routePath: TemplatePage.routePath,
        onTap: TemplatePage.goToPage,
        items: [
          AppDrawerItem(
            icon: Icons.widgets,
            label: 'Component',
            routePath: Components.routePath,
            onTap: Components.goToPage,
          ),
          AppDrawerItem(
            icon: Icons.palette,
            label: 'Color',
            routePath: ColorPage.routePath,
            onTap: ColorPage.goToPage,
          ),
        ],
      ),
    ];

    return AppDrawer(
      items: menu,
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Dimens.s2),
          AppElevatedIconButton(
              backgroundColor: context.colorScheme.error,
              borderRadius: Dimens.s3.borderRadius,
              icon: const Icon(FontAwesomeIcons.rightFromBracket),
              label: Text(L10n.current.logout),
              onPressed: () {
                Get.find<AuthProvider>().logout();
                LoginPage.goToPage();
              }),
          const SizedBox(height: Dimens.s1),
        ],
      ),
    );
  });

  static IconData _iconFromInt(int index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.zero;
      case 1:
        return FontAwesomeIcons.one;
      case 2:
        return FontAwesomeIcons.two;
      case 3:
        return FontAwesomeIcons.three;
      case 4:
        return FontAwesomeIcons.four;
      case 5:
        return FontAwesomeIcons.five;
      case 6:
        return FontAwesomeIcons.six;
      case 7:
        return FontAwesomeIcons.seven;
      case 8:
        return FontAwesomeIcons.eight;
      case 9:
        return FontAwesomeIcons.nine;
    }
    return FontAwesomeIcons.hashtag;
  }
}
