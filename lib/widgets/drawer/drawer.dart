import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/constants/theme.dart';
import '../../data/provider/auth_provider.dart';
import '../../screens/home/home_page.dart';
import '../../screens/login/login_page.dart';
import '../../screens/profile/profile_page.dart';
import '../../screens/settings/settings_page.dart';
import '../../screens/template/articles.dart';
import '../../screens/template/components.dart';
import '../../screens/template/register.dart';
import 'drawer_tile.dart';

class NowDrawer extends StatelessWidget {
  const NowDrawer({super.key, required this.currentPage});

  final String currentPage;

  Future<bool> _launchURL() async {
    const url = 'https://creative-tim.com';
    return launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: AppColors.primary,
      child: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Image.asset('assets/images/now-logo.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(
                          icon: Icon(Icons.menu,
                              color: AppColors.white.withOpacity(0.82),
                              size: 24.0),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: ListView(
            padding: const EdgeInsets.only(top: 36, left: 8, right: 16),
            children: [
              DrawerTile(
                  icon: FontAwesomeIcons.house,
                  onTap: () {
                    if (currentPage != HomePage.routePath) {
                      HomePage.goToPage();
                    }
                  },
                  iconColor: AppColors.primary,
                  title: HomePage.routePath,
                  isSelected: currentPage == HomePage.routePath),
              DrawerTile(
                  icon: FontAwesomeIcons.dharmachakra,
                  onTap: () {
                    if (currentPage != Components.routePath) {
                      Components.goToPage();
                    }
                  },
                  iconColor: AppColors.error,
                  title: Components.routePath,
                  isSelected: currentPage == Components.routePath),
              DrawerTile(
                  icon: FontAwesomeIcons.newspaper,
                  onTap: () {
                    if (currentPage != Articles.routePath) {
                      Articles.goToPage();
                    }
                  },
                  iconColor: AppColors.primary,
                  title: Articles.routePath,
                  isSelected: currentPage == Articles.routePath),
              DrawerTile(
                  icon: FontAwesomeIcons.user,
                  onTap: () {
                    if (currentPage != ProfilePage.routePath) {
                      ProfilePage.goToPage();
                    }
                  },
                  iconColor: AppColors.warning,
                  title: ProfilePage.routePath,
                  isSelected: currentPage == ProfilePage.routePath),
              DrawerTile(
                  icon: FontAwesomeIcons.fileInvoice,
                  onTap: () {
                    if (currentPage != Register.routePath) {
                      Register.goToPage();
                    }
                  },
                  iconColor: AppColors.info,
                  title: Register.routePath,
                  isSelected: currentPage == Register.routePath),
              DrawerTile(
                  icon: FontAwesomeIcons.gear,
                  onTap: () {
                    if (currentPage != SettingsPage.routePath) {
                      SettingsPage.goToPage();
                    }
                  },
                  iconColor: AppColors.success,
                  title: SettingsPage.routePath,
                  isSelected: currentPage == SettingsPage.routePath),
            ],
          ),
        ),
        Expanded(
          child: Container(
              padding: const EdgeInsets.only(left: 8, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                      height: 4,
                      thickness: 0,
                      color: AppColors.white.withOpacity(0.8)),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                    child: Text('DOCUMENTATION',
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 13,
                        )),
                  ),
                  DrawerTile(
                      icon: FontAwesomeIcons.satellite,
                      onTap: _launchURL,
                      iconColor: AppColors.muted,
                      title: 'Getting Started',
                      isSelected: currentPage == 'Getting started'),
                  DrawerTile(
                      icon: FontAwesomeIcons.outdent,
                      onTap: () {
                        final AuthProvider provider = Get.find();
                        provider.logout();
                        LoginPage.goToPage();
                      },
                      iconColor: AppColors.muted,
                      title: 'Logout'),
                ],
              )),
        ),
      ]),
    ));
  }
}
