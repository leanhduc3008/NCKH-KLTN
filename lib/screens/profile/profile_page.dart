import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../data/provider/auth_provider.dart';
import '../../l10n/generated/l10n.dart';
import '../../router/route_menu.dart';
import '../../widgets/widget.dart';
import '../login/login_page.dart';
import 'widget/avatar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routePath = '/Profile';
  static Future<void>? goToPage() {
    return Get.offAllNamed(ProfilePage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: RouteMenu.drawer,
        appBar: const AppNavbar(
          title: 'Profile',
        ),
        backgroundColor: AppColors.borderTextFormField,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: AppColors.transparentColor),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  color: AppColors.borderTextFormField,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: AvatarItem(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12)),
                        padding: 16.0.insetAll,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Thông tin người dùng',
                                      style: context.textStyle.bodyMedium
                                          ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Text('Cập nhật',
                                          style: context.textStyle.bodyMedium
                                              ?.copyWith(
                                                  color: AppColors.blueText,
                                                  fontWeight: FontWeight.w500)))
                                ],
                              ),
                              16.0.gapHeight,
                              // ID
                              Row(children: [
                                const Text('ID: '),
                                Text('0',
                                    style: context.textStyle.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500))
                              ]),
                              16.0.gapHeight,
                              // Name
                              Row(children: [
                                const Text('Tên người dùng: '),
                                Text('Lê Văn Anh Đức',
                                    style: context.textStyle.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500))
                              ]),
                              16.0.gapHeight,

                              // Email
                              Row(children: [
                                const Text('Email: '),
                                Text('duclva@imt-soft.com',
                                    style: context.textStyle.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500))
                              ]),
                              16.gapHeight,
                              // Position
                              Row(children: [
                                const Text('Vị trí: '),
                                Text('Software Engineer I',
                                    style: context.textStyle.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500))
                              ]),
                            ]),
                      ),
                    ])),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: AppElevatedIconButton(
                backgroundColor: context.colorScheme.error,
                borderRadius: Dimens.s3.borderRadius,
                icon: const Icon(FontAwesomeIcons.rightFromBracket),
                label: Text(L10n.current.logout),
                onPressed: () {
                  Get.find<AuthProvider>().logout();
                  LoginPage.goToPage();
                },
              )),
        ));
  }
}
