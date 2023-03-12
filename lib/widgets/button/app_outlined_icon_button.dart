import 'package:flutter/material.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';

class AppOutlinedIconButton extends StatelessWidget {
  const AppOutlinedIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
    this.primary,
    this.backgroundColor,
    this.expandedWith = true,
    this.alignment,
    this.isLoading = false,
    this.height = Dimens.s8,
    this.borderRadius,
    this.width,
  });

  final Widget icon;

  final Widget label;

  final Color? primary;

  final Color? backgroundColor;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHover;

  final ValueChanged<bool>? onFocusChange;

  final bool expandedWith;

  final AlignmentGeometry? alignment;

  final bool isLoading;

  final double height;

  final BorderRadiusGeometry? borderRadius;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: Dimens.s3),
        side: BorderSide(color: primary ?? context.colorScheme.primary),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(Dimens.s3)),
        textStyle: context.textStyle.titleMedium?.weight500,
        foregroundColor: primary ?? context.colorScheme.primary,
        surfaceTintColor: primary ?? context.colorScheme.primary,
        backgroundColor: backgroundColor ?? AppColors.transparentColor,
        minimumSize: Size(
          expandedWith ? double.infinity : 0,
          height,
        ),
        alignment: alignment,
      ),
      onPressed: isLoading ? () {} : onPressed,
      onLongPress: isLoading ? () {} : onLongPress,
      icon: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: isLoading
            ? SizedBox.square(
                dimension: height - 10,
                child: CircularProgressIndicator(color: primary),
              )
            : icon,
      ),
      label: label,
    );
  }
}
