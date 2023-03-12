import 'package:get/get.dart';

import '../../../../common/base/base_view_model.dart';
import '../register_success/register_success_page.dart';

class OtpRegisterViewModel extends BaseViewModel<bool> {
  String? inputOtp = '';

  @override
  Future<bool?> initialData() async {
    return null;
  }

  Future<void> confirm() async {
    Get.toNamed(Get.currentRoute + RegisterSuccessPage.routePath);
  }
}
