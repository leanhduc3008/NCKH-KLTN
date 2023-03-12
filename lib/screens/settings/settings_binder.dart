import 'package:get/instance_manager.dart';

import 'settings_view_model.dart';

class SettingsBinder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsViewModel>(() => SettingsViewModel());
  }
}
