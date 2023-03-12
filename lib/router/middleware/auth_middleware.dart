import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../data/provider/auth_provider.dart';
import '../../screens/login/login_page.dart';

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware() : super(priority: 1000);

  late final _auth = Get.find<AuthProvider>();

  @override
  RouteSettings? redirect(String? route) {
    if (_auth.user == null) {
      return const RouteSettings(
          name: LoginPage.routePath, arguments: 'Phiên đăng nhập đã hết hạn');
    }
    return null;
  }
}
