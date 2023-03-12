import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/context_extension.dart';
import '../../../widgets/button/app_elevated_button.dart';
import 'register_success_view_model.dart';

class RegisterSuccessPage extends GetView<RegisterSuccessViewModel> {
  const RegisterSuccessPage({super.key});

  static const String routePath = '/RegisterSuccessPage';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.imageSuccessMark,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    context.l10n.registerSuccessfully,
                    style: context.textStyle.titleMedium?.copyWith(
                        color: AppColors.dark,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    context.l10n.youHaveRegisterdSuccessfully,
                    textAlign: TextAlign.center,
                    style: context.textStyle.bodyMedium?.copyWith(
                        color: AppColors.grayText,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: AppElevatedButton(
                    height: Dimens.s11,
                    backgroundColor: AppColors.dark,
                    onPressed: controller.login,
                    child: Text(context.l10n.login))),
          )),
    );
  }
}
