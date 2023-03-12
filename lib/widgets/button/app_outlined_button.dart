import 'package:flutter/material.dart';

import '../../../common/extension/context_extension.dart';
import '../../../common/extension/text_extension.dart';
import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.child,
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

  factory AppOutlinedButton.error({
    Key? key,
    required Widget child,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    bool expandedWith = true,
    AlignmentGeometry? alignment,
    bool isLoading = false,
    double height = Dimens.s8,
    BorderRadiusGeometry? borderRadius,
    double? width,
  }) {
    return AppOutlinedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      padding: padding,
      primary: AppColors.error,
      backgroundColor: backgroundColor,
      expandedWith: expandedWith,
      alignment: alignment,
      isLoading: isLoading,
      height: height,
      borderRadius: borderRadius,
      width: width,
      child: child,
    );
  }

  factory AppOutlinedButton.warning({
    Key? key,
    required Widget child,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    bool expandedWith = true,
    AlignmentGeometry? alignment,
    bool isLoading = false,
    double height = Dimens.s8,
    BorderRadiusGeometry? borderRadius,
    double? width,
  }) {
    return AppOutlinedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      padding: padding,
      primary: AppColors.warning,
      backgroundColor: backgroundColor,
      expandedWith: expandedWith,
      alignment: alignment,
      isLoading: isLoading,
      height: height,
      borderRadius: borderRadius,
      width: width,
      child: child,
    );
  }

  factory AppOutlinedButton.success({
    Key? key,
    required Widget child,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    bool expandedWith = true,
    AlignmentGeometry? alignment,
    bool isLoading = false,
    double height = Dimens.s8,
    BorderRadiusGeometry? borderRadius,
    double? width,
  }) {
    return AppOutlinedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      padding: padding,
      primary: AppColors.success,
      backgroundColor: backgroundColor,
      expandedWith: expandedWith,
      alignment: alignment,
      isLoading: isLoading,
      height: height,
      borderRadius: borderRadius,
      width: width,
      child: child,
    );
  }

  final Widget child;

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
    final ColorScheme colors = context.colorScheme;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: Dimens.s3),
        side: BorderSide(color: primary ?? colors.primary),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(Dimens.s3)),
        textStyle: context.textStyle.titleMedium?.weight500,
        foregroundColor: primary ?? colors.primary,
        surfaceTintColor: primary ?? colors.primary,
        backgroundColor: backgroundColor ?? AppColors.transparentColor,
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
                child: CircularProgressIndicator(color: primary))
            : child,
      ),
    );
  }
}
