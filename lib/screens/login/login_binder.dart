import 'package:get/instance_manager.dart';

import 'login_view_model.dart';

class LoginBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginViewModel>(LoginViewModel());
  }
}
