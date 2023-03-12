import 'package:get/get.dart';

import '../../login/login_page.dart';

class RegisterSuccessViewModel extends GetxController {
  Future<void> login() async {
    Get.until((route) => Get.currentRoute == LoginPage.routePath);
  }
}
