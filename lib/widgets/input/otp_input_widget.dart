import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../common/extension/context_extension.dart';
import '../../common/constants/theme.dart';

class PinPutOtpWidget extends StatelessWidget {
  const PinPutOtpWidget(
      {super.key,
      this.onCompleted,
      this.onChanged,
      this.error,
      this.errorText,
      this.onSubmitted});
  final Function(String?)? onCompleted;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final bool? error;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      length: 5,
      textInputAction: TextInputAction.next,
      focusedPinTheme: PinTheme(
          width: 62,
          height: 48,
          textStyle:
              context.textStyle.bodyMedium?.copyWith(color: AppColors.dark),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.bgTextFormField,
              border: Border.all(color: AppColors.blueText),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: AppColors.blueText.withOpacity(0.2),
                )
              ])),
      defaultPinTheme: PinTheme(
          width: 60,
          height: 48,
          textStyle:
              context.textStyle.bodyMedium?.copyWith(color: AppColors.dark),
          decoration: BoxDecoration(
              color: AppColors.bgTextFormField,
              border: Border.all(color: AppColors.borderTextFormField),
              borderRadius: BorderRadius.circular(
                12,
              ))),
      errorText: errorText ?? 'OTP chưa chính xác. Vui lòng nhập lại!',
      errorTextStyle: context.textStyle.titleSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.error,
      ),
      forceErrorState: error ?? false,
      errorPinTheme: PinTheme(
          width: 60,
          height: 48,
          textStyle:
              context.textStyle.bodyMedium?.copyWith(color: AppColors.dark),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.bgTextFormField,
            border: Border.all(color: AppColors.error),
          )),
      onChanged: onChanged,
      onCompleted: onCompleted,
      onSubmitted: onSubmitted,
    );
  }
}
