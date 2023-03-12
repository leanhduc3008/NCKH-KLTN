import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/context_extension.dart';
import '../../../widgets/button/app_elevated_button.dart';
import '../../../widgets/input/otp_input_widget.dart';
import 'otp_view_model.dart';

class OtpRegisterPage extends GetView<OtpRegisterViewModel> {
  const OtpRegisterPage({super.key});

  static const String routePath = '/OtpRegisterPage';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
              elevation: 0,
              leadingWidth: 70,
              leading: InkWell(
                onTap: Get.back,
                child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderTextFormField),
                        borderRadius: BorderRadius.circular(Dimens.s1 * 3)),
                    height: Dimens.s6,
                    width: Dimens.s6,
                    child: const Icon(Icons.arrow_back_ios_new_rounded)),
              )),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.confirmOtp,
                      style: context.textStyle.titleMedium?.copyWith(
                          color: AppColors.dark,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      context.l10n.enterOtp,
                      style: context.textStyle.bodyMedium?.copyWith(
                          color: AppColors.grayText,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: PinPutOtpWidget(onSubmitted: (value) {
                        controller.inputOtp = value;
                      }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: context.l10n.notReceiveOtp,
                            style: context.textStyle.bodyMedium
                                ?.copyWith(color: AppColors.dark),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: context.l10n.resend,
                                  style: context.textStyle.bodyMedium
                                      ?.copyWith(color: AppColors.blueText)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: AppElevatedButton(
                    height: Dimens.s11,
                    backgroundColor: AppColors.dark,
                    onPressed: controller.confirm,
                    child: Text(context.l10n.confirm))),
          )),
    );
  }
}
