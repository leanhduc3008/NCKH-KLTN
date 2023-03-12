import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';

extension OverlayDialogExtGetX on GetInterface {
  Future showMessageDialog({
    required String message,
    Duration timeClose = const Duration(seconds: 2),
    Widget? icon,
    double size = Dimens.s3 * 10,
  }) {
    return Get.showOverlayRaw<dynamic>(
      builder: (context) => MessageDialog(message, icon: icon, size: size),
      asyncFunction: () => Future.delayed(timeClose),
    );
  }
}

class MessageDialog extends StatelessWidget {
  const MessageDialog(
    this.message, {
    super.key,
    this.icon,
    this.size = Dimens.s3 * 10,
  });

  factory MessageDialog.warning(String message) {
    return MessageDialog(
      message,
      icon: const Icon(
        Icons.warning,
        size: Dimens.s4,
        color: AppColors.warning,
      ),
    );
  }

  factory MessageDialog.alert(String message) {
    return MessageDialog(
      message,
      icon: const Icon(
        Icons.check_circle,
        size: Dimens.s4,
        color: AppColors.success,
      ),
    );
  }

  final String message;
  final Widget? icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          padding: Dimens.s3.insetAll,
          decoration: BoxDecoration(
            borderRadius: Dimens.s3.borderRadius,
            color: context.colorScheme.primaryContainer.withOpacity(0.8),
            border: Border.all(color: context.colorScheme.primary),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(height: 6),
              ],
              Text(
                message,
                style: context.textStyle.labelMedium?.copyWith(
                  color: context.colorScheme.onPrimaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
