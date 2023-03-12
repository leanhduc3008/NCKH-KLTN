import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseConnect extends GetConnect {
  BaseConnect([this.enableAuth = true]);

  final bool enableAuth;
  // late final AuthProvider _provider = Get.find();

  @override
  void onInit() {
    if (enableAuth) {
      httpClient.baseUrl = const String.fromEnvironment('BASE_URL');
      httpClient.timeout = const Duration(seconds: 10);

      /// =========== Authen interceptor ===============
      // httpClient.addRequestModifier((Request request) async {
      //   if (request.headers['requiresAuthToken'] == 'true') {
      //     final String? token = await _provider.token();

      //     request.headers.addAll(<String, String>{'Authorization': '$token'});
      //   }
      //   request.headers.remove('requiresAuthToken');

      //   return request;
      // });

      // httpClient.addResponseModifier((request, response) async {
      //   try {
      //     if ((response.body as Map?)?['statusCode'] == 408) {
      //       _provider.logout();
      //     }
      //     if ((response.body as Map?)?['token'] is String) {
      //       await _provider.saveToken((response.body as Map?)?['token']);
      //     }
      //   } catch (_) {}

      //   return response;
      // });
    }

    /// =========== Logging interceptor ===============
    if (kDebugMode) {
      httpClient.addRequestModifier((Request request) async {
        final String httpMethod = request.method.toUpperCase();

        _printHeader(title: httpMethod, text: request.url.toString());

        logPrint('\tHeaders:');
        request.headers
            .forEach((String k, Object? v) => logPrint('\t\t$k: $v'));

        if (request.url.queryParameters.isNotEmpty) {
          logPrint('\tQueryParameters:');
          request.url.queryParameters
              .forEach((String k, String v) => logPrint('\t\t$k: $v'));
        }

        final body = await request.bodyBytes.take(4000).bytesToString();
        logPrint('\tBody:');
        logPrint('\t\t$body');

        if (request.files != null) {
          logPrint('\tMultipart\\Form-data:');
          if (request.files!.fields.isNotEmpty) {
            for (final field in request.files!.fields) {
              logPrint('\t\t${field.key}: ${field.value}');
            }
          }
          if (request.files!.files.isNotEmpty) {
            for (final file in request.files!.files) {
              logPrint('\t\t${file.key}: @${file.value.filename}');
            }
          }
        }

        _printFooter(title: httpMethod);

        return request;
      });

      httpClient.addResponseModifier((request, response) async {
        int type = response.hasError ? 2 : 1;
        int? statusCode = response.statusCode;
        try {
          type = (response.body as Map?)!['success'] ? 1 : 2;
          statusCode = (response.body as Map?)!['statusCode'];
        } catch (_) {}
        final method = request.method.toUpperCase();
        final title = '$method ❱➤ Status: $statusCode';

        _printHeader(title: title, text: request.url.toString(), type: type);
        if ((response.bodyString?.length ?? 0) < 40000) {
          logPrint('\tResponse:', type: type);
          logPrint('\t\t${response.bodyString}', type: type);
        }
        _printFooter(title: title, type: type);

        return response;
      });
    }
  }

  /// [type] color log only supported in VS Code
  /// - 0 request
  /// - 1 reponse
  /// - 2 error
  void logPrint(String message, {int type = 0}) {
    switch (type) {
      case 0:
        dev.log('\x1B[33m$message', name: 'BaseConnect');
        break;
      case 1:
        dev.log('\x1B[32m$message', name: 'BaseConnect');
        break;
      case 2:
        dev.log('\x1B[31m$message', name: 'BaseConnect');
        break;
      default:
        dev.log(message, name: 'BaseConnect');
    }
  }

  void _printHeader({String? title, String? text, int type = 0}) {
    logPrint('╔╣ $title', type: type);
    logPrint('║ $text', type: type);
  }

  void _printFooter({String? title, int type = 0}) {
    logPrint('╚═ END $title', type: type);
  }
}
