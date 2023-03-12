import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/images.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/context_extension.dart';
import '../../widgets/button/app_elevated_button.dart';
import 'login_view_model.dart';
import 'widget/text_field_email.dart';
import 'widget/text_field_password.dart';

class LoginPage extends GetView<LoginViewModel> {
  const LoginPage({super.key});

  static const String routePath = '/LoginPage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(LoginPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Form(
        key: controller.formKey,
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.imageLoginTicket,
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 30),
                    TextFieldLoginCustom(
                      validator: controller.validEmail,
                      hintText: context.l10n.enterYourEmail,
                      onChanged: (String value) => controller.username = value,
                    ),
                    const SizedBox(height: 15),
                    TextFieldLoginPassword(
                      maxLength: null,
                      validator: controller.validPassword,
                      hintText: context.l10n.enterYourPassword,
                      onChanged: (String value) => controller.password = value,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          context.l10n.forgotPassword,
                          style: context.textStyle.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grayText),
                        )
                      ],
                    ),
                    const SizedBox(height: 50),
                    AppElevatedButton(
                        height: Dimens.s11,
                        backgroundColor: AppColors.dark,
                        onPressed: controller.onSubmit,
                        child: Text(context.l10n.login))
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: context.l10n.dontHaveAccount,
                          style: context.textStyle.bodyMedium
                              ?.copyWith(color: AppColors.dark),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.toRegisterPage();
                                  },
                                text: context.l10n.registerNow,
                                style: context.textStyle.bodyMedium
                                    ?.copyWith(color: AppColors.blueText)),
                          ],
                        ),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}
