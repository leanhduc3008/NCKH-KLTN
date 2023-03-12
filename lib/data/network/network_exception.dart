import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../common/base/base_typedef.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException implements Exception {
  const NetworkException._() : super();

  const factory NetworkException.unauthorizedException() =
      _UnauthorizedException;

  const factory NetworkException.unrecognizedException() =
      _UnrecognizedException;

  const factory NetworkException.otherException() = _OtherException;

  const factory NetworkException.formatException() = _FormatException;

  const factory NetworkException.fetchDataException() = _FetchDataException;

  const factory NetworkException.apiException({
    int? statusCode,
    String? statusText,
  }) = _ApiException;

  static T convertResponse<T>(Response response, Converter<T>? converter) {
    final isValidStructure =
        response.body is Map && (response.body as Map)['success'] is bool;

    // API Successful
    if (isValidStructure && (response.body as Map)['success'] == true) {
      if (converter != null) {
        return converter((response.body as Map)['data']);
      }

      return (response.body as Map)['data'] as T;
    }

    if (kDebugMode && response.request != null) {
      cURLRepresentation(response.request!).then(dev.log);
    }

    // API Fail
    if (isValidStructure && (response.body as Map)['success'] == false) {
      if ((response.body as Map)['statusCode'] == 408) {
        throw const NetworkException.unauthorizedException();
      }

      throw NetworkException.apiException(
        statusCode: (response.body as Map)['statusCode'],
        statusText: (response.body as Map)['statusValue'],
      );
    }

    // No internet
    if (response.statusText?.contains('SocketException') ?? false) {
      throw const NetworkException.fetchDataException();
    }

    // API result invalid structure
    throw NetworkException.apiException(
      statusCode: response.statusCode,
      statusText: response.bodyString,
    );
  }

  static NetworkException getException(Object error) {
    if (kDebugMode) {
      StackTrace? stackTrace;
      if (error is Error) {
        stackTrace = error.stackTrace;
      }
      dev.log(
        'Error type: ${error.runtimeType}',
        name: 'NetworkException',
        error: error,
        stackTrace: stackTrace,
      );
    }

    if (error is NetworkException) {
      return error;
    } else if (error is SocketException || error is TimeoutException) {
      return const NetworkException.fetchDataException();
    } else if (error is FormatException || error is TypeError) {
      return const NetworkException.formatException();
    } else if (error is Exception || error is Error) {
      return const NetworkException.otherException();
    }

    return const NetworkException.unrecognizedException();
  }

  static Future<String> cURLRepresentation<T>(Request<T> request) async {
    final List<String> components = <String>[];
    components
        .add("curl --request ${request.method.toUpperCase()} '${request.url}'");
    // Header
    request.headers.forEach((String k, dynamic v) {
      if (!k.contains('content-length')) {
        components.add("--header '$k: $v'");
      }
    });
    // Body
    final body = await request.bodyBytes.take(2000).bytesToString();
    if (body.isNotEmpty) {
      components.add("--data-raw '$body'");
    }
    // Multipart/form-data
    if (request.files?.fields.isNotEmpty ?? false) {
      String data = json.encode(request.files!.fields);
      data = data.replaceAll('"', r'\"');
      for (final MapEntry<String, String> value in request.files!.fields) {
        components.add("--form '${value.key}=\"${value.value}\"'");
      }
    }
    if (request.files?.files.isNotEmpty ?? false) {
      for (final MapEntry<String, MultipartFile> e in request.files!.files) {
        components.add("--form '${e.key}=\"@/path/${e.value.filename}\"'");
      }
    }
    return components.join(' \\\n');
  }
}

extension ExtNetworkException on NetworkException {
  String get statusText => when(
        apiException: (statusCode, statusText) => statusText ?? 'Lỗi máy chủ',
        unauthorizedException: () => 'Phiên đăng nhập đã hết hạn',
        fetchDataException: () => 'Lỗi kết nối máy chủ',
        formatException: () => 'Lỗi kiểu dữ liệu',
        otherException: () => 'Lôi khác',
        unrecognizedException: () => 'Lỗi không xác định',
      );

  int get statusCode => maybeWhen(
        apiException: (statusCode, statusText) => statusCode ?? 500,
        unauthorizedException: () => HttpStatus.unauthorized,
        fetchDataException: () => HttpStatus.requestTimeout,
        orElse: () => 0,
      );

  bool get isError => maybeWhen(
      apiException: (statusCode, statusText) => true,
      formatException: () => true,
      orElse: () => false);
}
