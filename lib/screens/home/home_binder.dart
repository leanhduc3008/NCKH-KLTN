import 'package:get/instance_manager.dart';

import 'controller/tab_reported_controller.dart';
import 'home_view_model.dart';

class HomeBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());

    Get.put(TabReportedController());
  }
}
