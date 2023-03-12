import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/extension/extenstion.dart';
import '../../../common/constants/dimens.dart';
import '../../../common/constants/theme.dart';
import '../../../widgets/input/app_text_form_field.dart';
import '../../../widgets/input/border_input_decoration.dart';

class TextFieldLoginCustom extends StatelessWidget {
  const TextFieldLoginCustom({
    super.key,
    this.text,
    this.hintText = '',
    this.validator,
    this.initialValue,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.suffixIcon,
    this.icon,
    this.regExp,
    this.isDropdown = false,
    this.controller,
    this.focusNode,
    this.errorText,
    this.required = false,
  });

  factory TextFieldLoginCustom.dropdown(
      {String? textSelected,
      String? hintText,
      Icon? suffixIcon,
      bool enabled = true,
      dynamic validator,
      FocusNode? focusNode,
      TextEditingController? controller}) {
    return TextFieldLoginCustom(
      hintText: textSelected ?? '',
      text: hintText ?? '',
      suffixIcon: suffixIcon,
      enabled: enabled,
      isDropdown: true,
      validator: validator,
      controller: controller,
      focusNode: focusNode,
    );
  }

  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool enabled;
  final Icon? suffixIcon;
  final Icon? icon;
  final String? text;
  final String? initialValue;
  final bool isDropdown;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? regExp;
  final String? errorText;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
        fieldKey: GlobalKey<FormFieldState<String>>(),
        initialValue: initialValue,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        enableSuggestions: false,
        autocorrect: false,
        decoration: BorderInputDeconration(
          filled: true,
          fillColor: enabled ? AppColors.bgTextFormField : AppColors.disabled,
          hintText: hintText,
          hintStyle: context.textStyle.titleMedium
              ?.copyWith(color: AppColors.grayColor, fontSize: 16)
              .weight400,
          borderRadius: BorderRadius.circular(Dimens.s2),
          errorText: (errorText == null || errorText!.isEmpty == true)
              ? null
              : errorText,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.all(17.0),
          prefixIcon: IconButton(
            padding: const EdgeInsets.all(7.0),
            icon: icon ?? const Icon(FontAwesomeIcons.userAstronaut),
            onPressed: null,
          ),
        ),
        style: context.textStyle.titleMedium?.weight400,
        onChanged: onChanged,
        validator: validator);
  }
}
