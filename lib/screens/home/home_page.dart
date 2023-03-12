import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import '../../widgets/widget.dart';
import 'home_view_model.dart';
import 'widget/tab_reported.dart';

class HomePage extends GetView<HomeViewModel> {
  const HomePage({super.key});

  static const String routePath = '/HomePage';
  static Future<void>? goToPage([bool success = false]) {
    return Get.offAllNamed(HomePage.routePath, arguments: success);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = context.colorScheme.onPrimaryContainer;

    return Scaffold(
      drawer: RouteMenu.drawer,
      appBar: AppNavbar.search(
        title: context.l10n.home_page,
        hintText: context.l10n.search_tickets,
        bottom: TabBar(
          isScrollable: true,
          labelColor: textColor,
          unselectedLabelColor: textColor.withOpacity(.5),
          controller: controller.tabController,
          tabs: [
            Tab(text: context.l10n.reported_issues),
            Tab(text: context.l10n.issues_assigned),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          const TabReported(),
          Center(child: Text(context.l10n.feature_in_development)),
        ],
      ),
    );
  }
}
