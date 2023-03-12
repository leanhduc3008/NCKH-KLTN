import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/constants/theme.dart';
import 'template_page.dart';

class Pro extends StatelessWidget {
  const Pro({super.key});

  static const String routePath = '/Pro';
  static Future<void>? goToPage() {
    return Get.toNamed(TemplatePage.routePath + Pro.routePath);
  }

  Future<bool> _launchURL() {
    const url = 'https://creative-tim.com';
    return launchUrlString(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/onboarding-bg.png'),
                    fit: BoxFit.cover))),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Coded By',
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3)),
                      const SizedBox(width: 10.0),
                      Image.asset('assets/images/creative-tim.png', scale: 7.0)
                    ],
                  ),
                  Center(
                      child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: const FittedBox(
                              child: Text('Now UI',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600)))),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: FittedBox(
                            child: Text.rich(TextSpan(
                                text: 'Flutter',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 67,
                                    fontWeight: FontWeight.w600),
                                children: <InlineSpan>[
                                  WidgetSpan(
                                      child: Container(
                                          padding: const EdgeInsets.all(2.0),
                                          margin: const EdgeInsets.fromLTRB(
                                              16.0, 0.0, 0, 50.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              color: AppColors.black),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 4, right: 4),
                                            child: Text('PRO',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 19,
                                                )),
                                          ))),
                                ])),
                          ))
                    ],
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                        'Take advantage of all the features and screens made by Creative Tim, coded on Flutter for both',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/ios.png', scale: 2.6),
                            const SizedBox(width: 30.0),
                            Image.asset('assets/images/android.png', scale: 2.6)
                          ]),
                      const SizedBox(height: 16.0),
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
                            onPressed: _launchURL,
                            child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 12,
                                    bottom: 12),
                                child: Text('GET STARTED',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0))),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
