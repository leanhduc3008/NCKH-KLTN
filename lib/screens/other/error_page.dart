import 'package:flutter/material.dart';

import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../firebase/firebase_crashlytics.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.errorDetails, {super.key});

  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);

    return Scaffold(
      backgroundColor: context.colorScheme.error,
      body: Center(
        child: Text(
          _stringify(errorDetails.exception),
          style: context.textStyle.headlineMedium?.copyWith(
            color: context.colorScheme.onError,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Quay lại'),
          ),
        ),
      ),
    );
  }

  static String _stringify(Object? exception) {
    try {
      return exception.toString();
    } catch (_) {}
    return 'Error';
  }
}

class ErrorFlutterWidget extends StatelessWidget {
  const ErrorFlutterWidget(this.errorDetails, {super.key, this.name});

  final FlutterErrorDetails errorDetails;
  final String? name;

  @override
  Widget build(BuildContext context) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);

    return Card(
      color: AppColors.error,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$name lỗi!',
          style: context.textStyle.headlineMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
