import 'package:get/instance_manager.dart';
import 'register_success_view_model.dart';

class RegisterSuccessBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterSuccessViewModel>(RegisterSuccessViewModel());
  }
}
