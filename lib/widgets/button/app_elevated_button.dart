import 'package:flutter/material.dart';

import '../../../common/extension/context_extension.dart';
import '../../../common/extension/text_extension.dart';
import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.child,
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

  factory AppElevatedButton.error({
    Key? key,
    required Widget? child,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: Dimens.s3),
    bool expandedWith = true,
    bool isLoading = false,
    AlignmentGeometry? alignment,
    double height = Dimens.s8,
    BorderRadiusGeometry? borderRadius,
    BorderSide? borderSide,
  }) {
    return AppElevatedButton(
      backgroundColor: AppColors.error,
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      padding: padding,
      expandedWith: expandedWith,
      isLoading: isLoading,
      alignment: alignment,
      height: height,
      borderRadius: borderRadius,
      borderSide: borderSide,
      child: child,
    );
  }

  factory AppElevatedButton.warning({
    Key? key,
    required Widget? child,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: Dimens.s3),
    bool expandedWith = true,
    bool isLoading = false,
    AlignmentGeometry? alignment,
    double height = Dimens.s8,
    BorderRadiusGeometry? borderRadius,
    BorderSide? borderSide,
  }) {
    return AppElevatedButton(
      backgroundColor: AppColors.warning,
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      padding: padding,
      expandedWith: expandedWith,
      isLoading: isLoading,
      alignment: alignment,
      height: height,
      borderRadius: borderRadius,
      borderSide: borderSide,
      child: child,
    );
  }

  factory AppElevatedButton.success({
    Key? key,
    required Widget? child,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: Dimens.s3),
    bool expandedWith = true,
    bool isLoading = false,
    AlignmentGeometry? alignment,
    double height = Dimens.s8,
    BorderRadiusGeometry? borderRadius,
    BorderSide? borderSide,
  }) {
    return AppElevatedButton(
      backgroundColor: AppColors.success,
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      padding: padding,
      expandedWith: expandedWith,
      isLoading: isLoading,
      alignment: alignment,
      height: height,
      borderRadius: borderRadius,
      borderSide: borderSide,
      child: child,
    );
  }

  final Widget? child;

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

    return ElevatedButton(
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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.fastOutSlowIn,
        child: isLoading
            ? SizedBox.square(
                dimension: height - 10,
                child: CircularProgressIndicator(
                  color: colors.onPrimary,
                ),
              )
            : child,
      ),
    );
  }
}
