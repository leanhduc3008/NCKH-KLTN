import 'package:get/state_manager.dart';

import '../../data/network/network_exception.dart';
import 'base_page_reponse.dart';

export 'base_page_reponse.dart';

abstract class BasePagingViewModel<T> extends GetxController
    with StateMixin<BasePageResponse<T>>, ScrollMixin {
  @override
  void onReady() {
    super.onReady();
    onRefresh();
  }

  @override
  Future<void> onTopScroll() async {}

  @override
  Future<void> onEndScroll() async {
    if (!(state?.page.last ?? true) && !status.isLoadingMore) {
      change(state, status: RxStatus.loadingMore());
      try {
        final BasePageResponse<T>? newState = await onLoadMore();
        change(
            newState?.copyWith(
              page: newState.page.copyWith(
                content: (state?.page.content ?? []) + newState.page.content,
              ),
            ),
            status: RxStatus.success());
      } on NetworkException catch (e) {
        change(state, status: RxStatus.error(e.statusText));
      }
    }
  }

  Future<void> onRefresh([Future<BasePageResponse<T>?>? body]) async {
    change(state, status: RxStatus.loading());
    try {
      final BasePageResponse<T>? newState = await (body ?? initialData());
      if (newState == null || newState.page.content.isEmpty) {
        change(newState, status: RxStatus.empty());
      } else {
        change(newState, status: RxStatus.success());
      }
    } on NetworkException catch (e) {
      change(state, status: RxStatus.error(e.statusText));
    }
  }

  /// Load data from local
  Future<BasePageResponse<T>?> initialData();

  /// Add more data when user scroll to end
  Future<BasePageResponse<T>?> onLoadMore();
}
