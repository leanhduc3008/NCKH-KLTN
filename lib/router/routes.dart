import 'package:get/get.dart';

import '../screens/add_ticket/add_ticket_binder.dart';
import '../screens/add_ticket/add_ticket_page.dart';
import '../screens/content_template/content_template_binder.dart';
import '../screens/content_template/content_template_page.dart';
import '../screens/floor/floor_page.dart';
import '../screens/home/home_binder.dart';
import '../screens/home/home_page.dart';
import '../screens/login/login_binder.dart';
import '../screens/login/login_page.dart';
import '../screens/other/empty_page.dart';
import '../screens/profile/profile_page.dart';
import '../screens/register/otp_register/otp_binder.dart';
import '../screens/register/otp_register/otp_page.dart';
import '../screens/register/register_binder.dart';
import '../screens/register/register_page.dart';
import '../screens/register/register_success/register_success_binder.dart';
import '../screens/register/register_success/register_success_page.dart';
import '../screens/settings/settings_binder.dart';
import '../screens/settings/settings_page.dart';
import '../screens/template/articles.dart';
import '../screens/template/colors.dart';
import '../screens/template/components.dart';
import '../screens/template/onboarding.dart';
import '../screens/template/pro.dart';
import '../screens/template/register.dart';
import '../screens/template/template_page.dart';
import 'middleware/auth_middleware.dart';

class Routes {
  const Routes._();

  static String? get initialRoute => LoginPage.routePath;

  static GetPage get unknownRoute => GetPage(
        name: EmptyPage.routePath,
        page: () => const EmptyPage(),
      );

  /// ------------------ Main ----------------------------
  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: LoginPage.routePath,
      binding: LoginBinder(),
      page: () => const LoginPage(),
      children: _auth,
    ),
    GetPage(
      name: HomePage.routePath,
      middlewares: [AuthMiddleware()],
      binding: HomeBinder(),
      page: () => const HomePage(),
      children: [
        GetPage(
          name: AddTicketPage.routePath,
          binding: AddTicketBinder(),
          page: () => const AddTicketPage(),
        ),
        GetPage(
          name: ContentTemplatePage.routePath,
          binding: ContenTemplateBinder(),
          page: () => const ContentTemplatePage(),
        ),
      ],
    ),
    GetPage(
      name: FloorPage.routePath,
      middlewares: [AuthMiddleware()],
      page: () => const FloorPage(),
    ),
    GetPage(
      name: ProfilePage.routePath,
      middlewares: [AuthMiddleware()],
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: SettingsPage.routePath,
      binding: SettingsBinder(),
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: TemplatePage.routePath,
      middlewares: [AuthMiddleware()],
      page: () => const TemplatePage(),
      children: _template,
    ),
  ];

  /// ------------------ Authentication ------------------
  static final List<GetPage> _auth = <GetPage>[
    GetPage<RegisterPage>(
        name: RegisterPage.routePath,
        binding: RegisterBinder(),
        page: () => const RegisterPage(),
        children: [
          GetPage<OtpRegisterPage>(
              name: OtpRegisterPage.routePath,
              binding: OtpRegisterBinder(),
              page: () => const OtpRegisterPage(),
              children: [
                GetPage<RegisterSuccessPage>(
                    name: RegisterSuccessPage.routePath,
                    binding: RegisterSuccessBinder(),
                    page: () => const RegisterSuccessPage()),
              ]),
        ]),
  ];

  /// ------------------ Template -----------------------
  static final List<GetPage> _template = <GetPage>[
    GetPage(
      name: Components.routePath,
      page: () => const Components(),
    ),
    GetPage(
      name: ColorPage.routePath,
      page: () => const ColorPage(),
    ),
    GetPage(
      name: Articles.routePath,
      page: () => const Articles(),
    ),
    GetPage(
      name: Onboarding.routePath,
      page: () => const Onboarding(),
    ),
    GetPage(
      name: Pro.routePath,
      page: () => const Pro(),
    ),
    GetPage(
      name: Register.routePath,
      page: () => const Register(),
    ),
  ];
}
