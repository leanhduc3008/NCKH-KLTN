import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../router/route_menu.dart';
import '../../widgets/widget.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  static const String routePath = '/TemplatePage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(TemplatePage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RouteMenu.drawer,
      appBar: const AppNavbar(title: 'Template'),
      body: Container(),
    );
  }
}
