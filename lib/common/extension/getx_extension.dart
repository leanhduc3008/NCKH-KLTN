// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/base_paging_view_model.dart';
import '../base/base_view_model.dart';
import '../base/query_view_model.dart';
import '../constants/dimens.dart';
import '../constants/theme.dart';
import 'context_extension.dart';

extension BaseViewModeExtension<T> on BaseViewModel<T> {
  Widget builder(
    Widget Function(T? state) widget, {
    bool showLoading = true,
    bool showError = true,
    bool showEmpty = true,
  }) {
    return SimpleBuilder(builder: (context) {
      if (showLoading && status.isLoading) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else if (showError && status.isError) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.error),
                iconSize: Dimens.s8,
                onPressed: onRefresh,
                color: AppColors.error,
              ),
              Text(
                status.errorMessage ?? '',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      } else if (showEmpty && status.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.block),
                iconSize: Dimens.s8,
                onPressed: onRefresh,
                color: AppColors.primary,
              ),
              Text(context.l10n.no_data)
            ],
          ),
        );
      }

      return widget(value);
    });
  }
}

extension BasePagingViewModelExtension<T> on BasePagingViewModel<T> {
  Widget builder(
    Widget Function(BasePageResponse<T>? state, RxStatus status) widget, {
    bool showLoading = true,
    bool showError = true,
    bool showEmpty = true,
  }) {
    return SimpleBuilder(builder: (context) {
      if (showLoading && status.isLoading) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else if (showError && status.isError) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.error),
                iconSize: Dimens.s8,
                onPressed: onRefresh,
                color: AppColors.error,
              ),
              Text(status.errorMessage ?? '', textAlign: TextAlign.center)
            ],
          ),
        );
      } else if (showEmpty && status.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.block),
                iconSize: Dimens.s8,
                onPressed: onRefresh,
                color: AppColors.primary,
              ),
              Text(context.l10n.no_data)
            ],
          ),
        );
      }

      return widget(value, status);
    });
  }
}

extension QueryViewModelExtension<T> on QueryViewModel<T> {
  Widget builder(
    Widget Function(List<T>? state, RxStatus status) widget, {
    bool showLoading = true,
    bool showError = true,
    bool showEmpty = true,
  }) {
    return SimpleBuilder(builder: (context) {
      if (showLoading && status.isLoading) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else if (showError && status.isError) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.error),
                iconSize: Dimens.s8,
                onPressed: onRefresh,
                color: AppColors.error,
              ),
              Text(status.errorMessage ?? '', textAlign: TextAlign.center)
            ],
          ),
        );
      } else if (showEmpty && status.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.block),
                iconSize: Dimens.s8,
                onPressed: onRefresh,
                color: AppColors.primary,
              ),
              Text(context.l10n.no_data)
            ],
          ),
        );
      }

      return widget(value, status);
    });
  }
}

extension StateMixinExtension<T> on StateMixin<T> {}

extension OverlayExtension on GetInterface {
  Future<T> showOverlayRaw<T>({
    required WidgetBuilder builder,
    required Future<T> Function() asyncFunction,
  }) async {
    final entry = OverlayEntry(builder: builder);

    overlayState?.insert(entry);
    return asyncFunction().whenComplete(() => entry.remove());
  }

  OverlayState? get overlayState => Navigator.of(Get.overlayContext!).overlay;
}

extension InstanceExtension on GetInterface {
  T? tryFind<T>({String? tag}) {
    try {
      return GetInstance().find<T>(tag: tag);
    } catch (_) {
      return null;
    }
  }

  T findOrPut<T>(T dependency, {String? tag, bool permanent = false}) {
    try {
      return GetInstance().find<T>(tag: tag);
    } catch (e) {
      return GetInstance().put<T>(dependency, tag: tag, permanent: permanent);
    }
  }

  T putOrReplace<T>(T dependency, {String? tag, bool permanent = false}) {
    if (GetInstance().isRegistered<T>(tag: tag)) {
      delete<T>(tag: tag, force: permanent);
    }
    return GetInstance().put<T>(dependency, tag: tag, permanent: permanent);
  }

  InstanceInfo getInstanceInfo<T>({String? tag}) {
    return GetInstance().getInstanceInfo<T>(tag: tag);
  }
}
