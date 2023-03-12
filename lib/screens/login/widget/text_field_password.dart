import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/extension/extenstion.dart';
import '../../../common/constants/dimens.dart';
import '../../../common/constants/theme.dart';
import '../../../widgets/input/app_text_form_field.dart';
import '../../../widgets/input/border_input_decoration.dart';

class TextFieldLoginPassword extends StatefulWidget {
  const TextFieldLoginPassword({
    super.key,
    this.hintText = '',
    this.validator,
    this.onChanged,
    this.focusNode,
    this.initialValue,
    this.text,
    this.enabled = true,
    this.isWarning = false,
    this.errorText,
    this.maxLength = 32,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? text;
  final String? errorText;
  final bool isWarning;
  final int? maxLength;

  @override
  TextFieldLoginPasswordState createState() => TextFieldLoginPasswordState();
}

class TextFieldLoginPasswordState extends State<TextFieldLoginPassword> {
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      fieldKey: GlobalKey<FormFieldState<String>>(),
      maxLength: widget.maxLength,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      enableSuggestions: false,
      autocorrect: false,
      decoration: BorderInputDeconration(
        filled: true,
        fillColor:
            (widget.enabled) ? AppColors.bgTextFormField : AppColors.disabled,
        hintText: widget.hintText,
        errorText:
            (widget.errorText == null || widget.errorText!.isEmpty == true)
                ? null
                : widget.errorText,
        hintStyle: context.textStyle.titleMedium
            ?.copyWith(color: AppColors.grayColor, fontSize: 16)
            .weight400,
        borderRadius: BorderRadius.circular(Dimens.s2),
        contentPadding: const EdgeInsets.all(17.0),
        prefixIcon: const IconButton(
          padding: EdgeInsets.all(7.0),
          icon: Icon(Icons.lock),
          onPressed: null,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            widget.isWarning
                ? Icons.warning
                : _obscureText
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
            size: 20,
          ),
          onPressed: () => _toggle(),
        ),
      ),
      style: context.textStyle.titleMedium?.weight400,
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
