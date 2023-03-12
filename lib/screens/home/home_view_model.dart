import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../common/extension/getx_extension.dart';
import '../../l10n/generated/l10n.dart';
import '../../widgets/dialog/message_dialog.dart';

class HomeViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    super.onReady();

    if (Get.arguments == true) {
      Get.showOverlayRaw<dynamic>(
        builder: (context) => MessageDialog.alert(
          L10n.current.create_request_ticket_successfully,
        ),
        asyncFunction: () => Future.delayed(const Duration(seconds: 2)),
      );
    }
  }
}
