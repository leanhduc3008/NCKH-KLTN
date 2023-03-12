import 'package:get/instance_manager.dart';

import 'add_ticket_view_model.dart';

class AddTicketBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTicketViewModel>(() => AddTicketViewModel());
  }
}
