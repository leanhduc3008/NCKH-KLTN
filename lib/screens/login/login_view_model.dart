import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../../common/base/base_view_model.dart';
import '../../../../data/model/user.dart';
import '../../../../data/provider/auth_provider.dart';
import '../../l10n/generated/l10n.dart';
import '../home/home_page.dart';
import '../register/register_page.dart';

class LoginViewModel extends BaseViewModel<User> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthProvider _provider = Get.find<AuthProvider>();

  String username = '';
  String password = '';

  @override
  Future<User?> initialData() async {
    return _provider.user;
  }

  @override
  void onReady() {
    if (Get.arguments is String) {
      Get.defaultDialog(title: Get.arguments);
    }
    super.onReady();
    addListener(_listenUserChange);
  }

  @override
  void onClose() {
    FlutterNativeSplash.remove();
    removeListener(_listenUserChange);
    super.onClose();
  }

  void _listenUserChange() {
    if (state != null) {
      HomePage.goToPage();
    } else {
      FlutterNativeSplash.remove();
    }
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

  void toRegisterPage() {
    Get.toNamed(Get.currentRoute + RegisterPage.routePath);
  }

  Future<void> onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      final User user = await _provider.login(username, password);
      change(user);
    }
  }
}
