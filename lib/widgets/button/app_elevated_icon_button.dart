import 'package:flutter/material.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/extenstion.dart';

class AppElevatedIconButton extends StatelessWidget {
  const AppElevatedIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding = const EdgeInsets.symmetric(horizontal: Dimens.s3),
    this.foregroundColor,
    this.backgroundColor,
    this.expandedWith = true,
    this.isLoading = false,
    this.alignment,
    this.height = Dimens.s8,
    this.borderRadius,
    this.borderSide,
  });

  final Widget icon;

  final Widget label;

  final Color? foregroundColor;

  final Color? backgroundColor;

  final EdgeInsetsGeometry padding;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHover;

  final ValueChanged<bool>? onFocusChange;

  final bool expandedWith;

  final AlignmentGeometry? alignment;

  final double height;

  final bool isLoading;

  final BorderRadiusGeometry? borderRadius;

  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = context.colorScheme;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding,
        shape: RoundedRectangleBorder(
          side: borderSide ??
              BorderSide(color: backgroundColor ?? colors.primary),
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.s3),
        ),
        textStyle: context.textStyle.titleMedium?.weight500,
        foregroundColor: foregroundColor ?? colors.onPrimary,
        backgroundColor: backgroundColor ?? colors.primary,
        minimumSize: Size(
          expandedWith ? double.infinity : 0,
          height,
        ),
        alignment: alignment,
      ),
      onPressed: isLoading ? () {} : onPressed,
      onLongPress: isLoading ? () {} : onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      icon: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: isLoading
            ? SizedBox.square(
                dimension: height - 10,
                child: CircularProgressIndicator(color: colors.onPrimary),
              )
            : icon,
      ),
      label: label,
    );
  }
}
