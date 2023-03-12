import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/context_extension.dart';
import '../../widgets/button/app_elevated_button.dart';
import '../login/widget/text_field_email.dart';
import '../login/widget/text_field_password.dart';
import 'register_view_model.dart';

class RegisterPage extends GetView<RegisterViewModel> {
  const RegisterPage({super.key});

  static const String routePath = '/RegisterPage';

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
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        context.l10n.welcomeNewUser,
                        style: context.textStyle.titleMedium?.copyWith(
                            color: AppColors.dark,
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 40),
                      TextFieldLoginCustom(
                        initialValue: controller.username,
                        hintText: context.l10n.enterUser,
                        onChanged: (String value) => controller.email = value,
                      ),
                      const SizedBox(height: 15),
                      TextFieldLoginCustom(
                        icon: const Icon(Icons.email_rounded),
                        validator: controller.validEmail,
                        initialValue: controller.email,
                        hintText: context.l10n.enterYourEmail,
                        onChanged: (String value) => controller.email = value,
                      ),
                      const SizedBox(height: 15),
                      TextFieldLoginPassword(
                        maxLength: null,
                        validator: controller.validPassword,
                        initialValue: controller.password,
                        hintText: context.l10n.enterYourPassword,
                        onChanged: (String value) =>
                            controller.password = value,
                      ),
                      const SizedBox(height: 15),
                      TextFieldLoginPassword(
                        maxLength: null,
                        validator: controller.validConfirmPassword,
                        initialValue: controller.confirmPassword,
                        hintText: context.l10n.confirmPassword,
                        onChanged: (String value) =>
                            controller.confirmPassword = value,
                      ),
                    ],
                  ),
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
                    onPressed: controller.onSubmit,
                    child: Text(context.l10n.agreeAndRegister))),
          )),
    );
  }
}
