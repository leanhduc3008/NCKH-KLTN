import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

export 'package:firebase_crashlytics/firebase_crashlytics.dart';

extension CustomCrashlyticsExt on FirebaseCrashlytics {
  Future<void> initialize() async {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }
}
