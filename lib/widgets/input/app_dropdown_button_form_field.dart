import 'package:flutter/material.dart';

import '../../common/constants/dimens.dart';
import 'border_input_decoration.dart';

class AppDropdownButtonFormField<T> extends StatelessWidget {
  const AppDropdownButtonFormField({
    super.key,
    required this.items,
    required this.onChanged,
    this.icon,
    this.hint,
    this.decoration,
    this.fieldKey,
    this.value,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.onSaved,
  });

  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final Widget? icon;
  final Widget? hint;
  final InputDecoration? decoration;
  // Form
  final GlobalKey<FormFieldState<T>>? fieldKey;
  final T? value;
  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<T>? validator;
  final FormFieldSetter<T>? onSaved;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      key: fieldKey,
      items: items,
      onChanged: onChanged,
      icon: icon,
      hint: hint,
      decoration: decoration ??
          BorderInputDeconration(
            contentPadding: const EdgeInsets.all(Dimens.s2),
          ),
      value: value,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
