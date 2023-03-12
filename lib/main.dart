import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'firebase/firebase_crashlytics.dart';
import 'firebase/firebase_options.dart';

void main() async {
  runZonedGuarded(
    () async {
      final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: binding);
      // Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FirebaseCrashlytics.instance.initialize();
      // App
      await App.resolveDependencies();
      runApp(const App());
    },
    (e, stack) => FirebaseCrashlytics.instance.recordError(e, stack),
  );
}
