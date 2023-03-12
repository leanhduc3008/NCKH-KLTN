import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'common/constants/theme.dart';
import 'data/database/no_sql_storage.dart';
import 'data/provider/app_provider.dart';
import 'data/provider/auth_provider.dart';
import 'l10n/generated/l10n.dart';
import 'router/routes.dart';
import 'screens/other/error_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      initialRoute: Routes.initialRoute,
      unknownRoute: Routes.unknownRoute,
      getPages: Routes.pages,
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('vi'), Locale('en')],
      locale: const Locale('vi'),
      builder: (context, widget) {
        if (!kDebugMode) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            if (widget is Scaffold || widget is Navigator) {
              return ErrorPage(errorDetails);
            }
            return ErrorFlutterWidget(
              errorDetails,
              name: widget.runtimeType.toString(),
            );
          };
        }

        if (widget == null) {
          throw FlutterError('Widget is null');
        }

        return widget;
      },
    );
  }

  static Future<void> resolveDependencies() async {
    // Dependencies
    await Get.putAsync(NoSqlStorage.initialize);
    // Provider
    Get.put<AuthProvider>(AuthProviderImpl());
    Get.put<AppProvider>(AppProviderImpl());
  }
}
