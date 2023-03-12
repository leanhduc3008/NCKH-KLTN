import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

abstract class QueryViewModel<T> extends GetxController
    with StateMixin<List<T>>, ScrollMixin {
  QueryViewModel({this.pageSize = 20});

  final int pageSize;
  StreamSubscription? _querySubscription;
  int pageCount = 0;
  bool hasMore = false;

  @override
  void onReady() {
    super.onReady();
    onRefresh();
  }

  @override
  void onClose() {
    _querySubscription?.cancel();
    super.onClose();
  }

  Future<void> onRefresh([Query<T>? newQuery]) async {
    change(state, status: RxStatus.loading());
    pageCount = 0;
    hasMore = false;
    _listenQuery(newQuery ?? queryData());
  }

  @override
  Future<void> onTopScroll() async {}

  @override
  Future<void> onEndScroll() async {
    if (hasMore && !status.isLoadingMore) {
      change(state, status: RxStatus.loadingMore());
      pageCount++;
      _listenQuery(queryData());
    }
  }

  void _listenQuery(Query<T> query) {
    _querySubscription?.cancel();

    final expectedDocsCount = (pageCount + 1) * pageSize + 1;
    final limitQuery = query.limit(expectedDocsCount);

    _querySubscription = limitQuery.snapshots().listen((event) {
      final docs = event.size < expectedDocsCount
          ? event.docs
          : event.docs.take(expectedDocsCount - 1).toList();
      hasMore = event.size == expectedDocsCount;
      final newState = docs.map((item) => item.data()).toList();
      if (newState.isEmpty) {
        change(newState, status: RxStatus.empty());
      } else {
        change(newState, status: RxStatus.success());
      }
    }, onError: (Object error, StackTrace stackTrace) {
      String? messages;
      if (error is FirebaseException) {
        messages = error.message;
      }
      hasMore = false;
      change(state, status: RxStatus.error(messages));
    });
  }

  Query<T> queryData();
}
