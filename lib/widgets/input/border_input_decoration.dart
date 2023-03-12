import 'package:flutter/material.dart';

import '../../../common/extension/extenstion.dart';
import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';

/// Bỏ vào widget AppTextFormField (TextFormField, TextField, ...)
///
/// ```dart
/// AppTextFormField(
///   decoration: const BorderInputDeconration(
///     icon: Icon(Icons.person),
///     hintText: 'What do people call you?',
///     labelText: 'Name *',
///   ),
///   onSaved: (String? value) {
///     // This optional block of code can be used to run
///     // code when the user saves the form.
///   },
///   validator: (String? value) {
///     return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
///   },
/// )
/// ```
class BorderInputDeconration extends InputDecoration {
  BorderInputDeconration({
    BorderRadius? borderRadius,
    Color? borderColor,
    super.icon,
    super.iconColor,
    super.label,
    super.labelText,
    super.labelStyle,
    super.floatingLabelStyle,
    super.helperText,
    super.helperStyle,
    super.helperMaxLines,
    super.hintText,
    super.hintStyle,
    super.hintTextDirection,
    super.hintMaxLines,
    super.errorText,
    super.errorStyle,
    super.errorMaxLines,
    super.floatingLabelBehavior,
    super.floatingLabelAlignment,
    super.isCollapsed = false,
    super.isDense,
    super.contentPadding,
    super.prefixIcon,
    super.prefixIconConstraints,
    super.prefix,
    super.prefixText,
    super.prefixStyle,
    super.prefixIconColor,
    super.suffixIcon,
    super.suffix,
    super.suffixText,
    super.suffixStyle,
    super.suffixIconColor,
    super.suffixIconConstraints,
    super.counter,
    super.counterText = '',
    super.counterStyle,
    super.filled,
    super.fillColor,
    super.focusColor,
    super.hoverColor,
    super.enabled = true,
    super.semanticCounterText,
    super.alignLabelWithHint,
    super.constraints,
  }) : super(
          border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.all(Dimens.s3.radius),
              borderSide: BorderSide(
                  color: borderColor?.withOpacity(0.4) ?? AppColors.border)),
          enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.all(Dimens.s3.radius),
              borderSide: BorderSide(
                  color: borderColor?.withOpacity(0.4) ?? AppColors.border)),
          disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.all(Dimens.s3.radius),
              borderSide: BorderSide(
                  color: (borderColor ?? AppColors.border).withOpacity(0.1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.all(Dimens.s3.radius),
              borderSide: BorderSide(color: borderColor ?? AppColors.primary)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.all(Dimens.s3.radius),
              borderSide: const BorderSide(color: AppColors.error)),
          errorBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.all(Dimens.s3.radius),
              borderSide: BorderSide(color: AppColors.error.withOpacity(0.4))),
        );
}
