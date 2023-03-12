import 'package:get/state_manager.dart';

import '../../data/network/network_exception.dart';

abstract class BaseViewModel<T> extends GetxController with StateMixin<T> {
  @override
  void onReady() {
    super.onReady();
    onRefresh();
  }

  Future<void> onRefresh([Future<T?>? body]) async {
    change(state, status: RxStatus.loading());
    try {
      final T? newValue = await (body ?? initialData());
      change(newValue, status: RxStatus.success());
    } on NetworkException catch (e) {
      change(state, status: RxStatus.error(e.statusText));
    }
  }

  /// Load data from local
  Future<T?> initialData();
}
