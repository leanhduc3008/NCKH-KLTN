import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/extension/extenstion.dart';
import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../l10n/generated/l10n.dart';
import '../button/app_elevated_button.dart';
import '../button/app_outlined_button.dart';

extension DefaultDialogExtGetX on GetInterface {
  Future<T?> showDefaultDialog<T>({
    Widget? image,
    Widget? title,
    Widget? content,
    Widget? action,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    BorderRadiusGeometry? radius,
    double dialogWidth = Dimens.s7 * 10,
    Duration? timeClose = const Duration(seconds: 2),
  }) {
    final dialog = DefaultDialog(
      image: image,
      title: title,
      content: content,
      action: action,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      dialogWidth: dialogWidth,
    );
    if (timeClose != null) {
      Future.delayed(timeClose).whenComplete(dialog.closeDialog);
    }

    return Get.dialog(dialog);
  }
}

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    this.image,
    this.title,
    this.content,
    this.action,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.dialogWidth = Dimens.s7 * 10,
  }) : assert(title != null || content != null);

  factory DefaultDialog.warning({
    Key? key,
    required VoidCallback onAgree,
    Widget? title,
    Widget? content,
  }) {
    final L10n l10n = L10n.current;

    return DefaultDialog(
      key: key,
      image: const Icon(
        Icons.warning,
        size: Dimens.s8,
        color: AppColors.warning,
      ),
      title: title,
      content: content,
      action: Row(
        children: [
          Expanded(
            child: AppOutlinedButton(
              height: Dimens.s7,
              onPressed: Get.back,
              child: Text(l10n.no),
            ),
          ),
          const SizedBox(width: Dimens.s2),
          Expanded(
            child: AppElevatedButton(
              height: Dimens.s7,
              onPressed: onAgree,
              child: Text(l10n.agree),
            ),
          ),
        ],
      ),
    );
  }

  factory DefaultDialog.alert({
    Key? key,
    VoidCallback? onAgree,
    Widget? title,
    Widget? content,
  }) {
    final L10n l10n = L10n.current;

    return DefaultDialog(
      key: key,
      image: const Icon(
        Icons.check_circle,
        size: Dimens.s8,
        color: AppColors.success,
      ),
      title: title,
      content: content,
      action: AppElevatedButton(
        height: Dimens.s7,
        onPressed: onAgree ?? Get.back,
        child: Text(l10n.accept),
      ),
    );
  }

  final Widget? image;
  final Widget? title;
  final Widget? content;
  final Widget? action;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final double dialogWidth;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: Dimens.s4.borderRadius),
      backgroundColor: context.colorScheme.background,
      child: Container(
        width: dialogWidth,
        padding: Dimens.s3.insetAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            if (image != null) ...<Widget>[
              Center(child: image),
              Dimens.s2.gapHeight,
            ],
            if (title != null)
              DefaultTextStyle(
                style: context.textStyle.titleMedium!,
                textAlign: TextAlign.center,
                child: title!,
              ),
            if (title != null && content != null) Dimens.s3.gapHeight,
            if (content != null)
              DefaultTextStyle(
                style: context.textStyle.bodyMedium!,
                textAlign: TextAlign.center,
                child: content!,
              ),
            if (action != null) ...[
              Dimens.s3.gapHeight,
              Center(child: action),
            ]
          ],
        ),
      ),
    );
  }

  void closeDialog() {
    if (Get.isDialogOpen ?? false) {
      return Get.back();
    }
  }
}
