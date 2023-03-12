import 'package:get/instance_manager.dart';

import 'otp_view_model.dart';

class OtpRegisterBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<OtpRegisterViewModel>(OtpRegisterViewModel());
  }
}
