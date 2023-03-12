import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/theme.dart';
import '../home/home_page.dart';
import 'template_page.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  static const String routePath = '/Onboarding';
  static Future<void>? goToPage() {
    return Get.toNamed(TemplatePage.routePath + Onboarding.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/onboarding-free.png'),
                    fit: BoxFit.cover))),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: MediaQuery.of(context).size.height * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/now-logo.png', scale: 3.5),
                    const SizedBox(height: 20),
                    Center(
                        child: Column(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const FittedBox(
                                child: Text('Now UI',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600)))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const FittedBox(
                              child: Text('Flutter',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600)),
                            ))
                      ],
                    )),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Designed By',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3)),
                        const SizedBox(width: 5.0),
                        Image.asset('assets/images/invision-white-slim.png',
                            scale: 7.0)
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Coded By',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3)),
                        const SizedBox(width: 10.0),
                        Image.asset('assets/images/creative-tim.png',
                            scale: 7.0),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.info,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {
                        HomePage.goToPage();
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 16, bottom: 16),
                          child: Text('GET STARTED',
                              style: TextStyle(fontSize: 12.0))),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
