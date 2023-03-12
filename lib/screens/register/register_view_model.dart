import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/base/base_view_model.dart';
import '../../../../data/model/user.dart';
import '../../../../data/provider/auth_provider.dart';
import '../../l10n/generated/l10n.dart';
import 'otp_register/otp_page.dart';

class RegisterViewModel extends BaseViewModel<User> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthProvider _provider = Get.find<AuthProvider>();

  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Future<User?> initialData() async {
    return _provider.user;
  }

  String? validEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorEmailEmpty;
      } else if (!value.endsWith('@imt-soft.com')) {
        return L10n.current.errorEmailFormat;
      }
    }
    return null;
  }

  String? validPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorPasswordEmpty;
      } else if (!RegExp(r'^[A-Za-z\d!@#$%^&*-+\=]+$').hasMatch(value) ||
          value.contains(' ')) {
        return L10n.current.errorFormatPassword;
      } else if (value.length < 8) {
        return L10n.current.errorMinLengthPassword;
      } else if (value.length > 32) {
        return L10n.current.errorMaxLengthPassword;
      }
    }
    return null;
  }

  String? validConfirmPassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return L10n.current.errorConfirmPasswordEmpty;
      } else if (!RegExp(r'^[A-Za-z\d!@#$%^&*-+\=]+$').hasMatch(value) ||
          value.contains(' ')) {
        return L10n.current.errorFormatPassword;
      } else if (value.length < 8) {
        return L10n.current.errorMinLengthPassword;
      } else if (value.length > 32) {
        return L10n.current.errorMaxLengthPassword;
      }
      if (value != password) {
        return L10n.current.errorConfirmPassword;
      }
    }
    return null;
  }

  Future<void> onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      Get.toNamed(Get.currentRoute + OtpRegisterPage.routePath);
    }
  }
}
