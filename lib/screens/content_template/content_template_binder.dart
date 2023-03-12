import 'package:get/instance_manager.dart';

import 'content_template_view_model.dart';

class ContenTemplateBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentTemplateViewModel>(() => ContentTemplateViewModel());
  }
}
