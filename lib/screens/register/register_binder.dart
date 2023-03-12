import 'package:get/instance_manager.dart';

import 'register_view_model.dart';

class RegisterBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterViewModel>(RegisterViewModel());
  }
}
