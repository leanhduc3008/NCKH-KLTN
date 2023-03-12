import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import 'template_page.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  static const String routePath = '/ColorPage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(TemplatePage.routePath + ColorPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> menu = ['Color scheme', 'Color custom'];

    return DefaultTabController(
      length: menu.length,
      child: Scaffold(
        drawer: RouteMenu.drawer,
        appBar: AppBar(
          title: const Text('Color'),
          bottom: TabBar(
            labelColor: context.colorScheme.primary,
            indicatorColor: context.colorScheme.primary,
            tabs: menu.map<Tab>((e) => Tab(text: e)).toList(),
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              _TabColorScheme(),
              _TabColorCustom(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),
      ),
    );
  }
}

class _TabColorCustom extends StatelessWidget {
  const _TabColorCustom();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(2),
      children: const [
        Card(
          color: AppColors.primary,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Primary',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.secondary,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Secondary',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.label,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Label',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.neutral,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Neutral',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.info,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Info',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.error,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Error',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.success,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Success',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.warning,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Waring',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.text,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Text',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.active,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Active',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.socialFacebook,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Facebook',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.socialTwitter,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Twitter',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
        Card(
          color: AppColors.socialDribbble,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Dribble',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _TabColorScheme extends StatelessWidget {
  const _TabColorScheme();

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 100,
      ),
      children: [
        Card(
          elevation: 5,
          color: context.colorScheme.primary,
          child: Center(
            child: Text(
              'Primary',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.primaryContainer,
          child: Center(
            child: Text(
              'Primary container',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.secondary,
          child: Center(
            child: Text(
              'Secondary',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.secondaryContainer,
          child: Center(
            child: Text(
              'Secondary container',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.tertiary,
          child: Center(
            child: Text(
              'Tertiary',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.tertiaryContainer,
          child: Center(
            child: Text(
              'Tertiary container',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.error,
          child: Center(
            child: Text(
              'Error',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onError,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.errorContainer,
          child: Center(
            child: Text(
              'Error container',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onErrorContainer,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.background,
          child: Center(
            child: Text(
              'Backgroud',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.surface,
          child: Center(
            child: Text(
              'Surface',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.surfaceVariant,
          child: Center(
            child: Text(
              'Surface variant',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.surfaceTint,
          child: Center(
            child: Text(
              'Surface tint',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.background,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.inverseSurface,
          child: Center(
            child: Text(
              'Inverse surface',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.background,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.inversePrimary,
          child: Center(
            child: Text(
              'Inverse primary',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.background,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.shadow,
          child: Center(
            child: Text(
              'Shadow',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: context.colorScheme.outline,
          child: Center(
            child: Text(
              'Outline',
              style: context.textStyle.titleSmall?.copyWith(
                color: context.colorScheme.background,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
