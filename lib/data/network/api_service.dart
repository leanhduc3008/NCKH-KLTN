import 'package:get/get_connect/connect.dart';

import '../../common/base/base_connect.dart';
import '../../common/base/base_typedef.dart';
import 'api_interface.dart';
import 'network_exception.dart';
export 'api_interface.dart';

class ApiService implements ApiInterface {
  const ApiService._();

  static ApiService? _instance;

  static ApiService get instance => _instance ??= const ApiService._();

  static Future<ApiService> initialize() async {
    _getConnect ??= BaseConnect();
    _getConnect!.onInit();

    return instance;
  }

  static GetConnect? _getConnect;

  @override
  Future<T> getJson<T>({
    required String endpoint,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  }) async {
    try {
      final response = await _getConnect!.get(
        endpoint,
        query: queryParams,
        headers: <String, String>{
          'accept': 'application/json, text/plain, */*',
          'requiresAuthToken': '$requiresAuthToken',
        },
      );

      return NetworkException.convertResponse(response, converter);
    } catch (ex) {
      throw NetworkException.getException(ex);
    }
  }

  @override
  Future<T> postRaw<T>({
    required String endpoint,
    required data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  }) async {
    try {
      final response = await _getConnect!.post(
        endpoint,
        data,
        query: queryParams,
        headers: <String, String>{
          'accept': 'application/json, text/plain, */*',
          'requiresAuthToken': '$requiresAuthToken',
        },
      );

      return NetworkException.convertResponse(response, converter);
    } catch (ex) {
      throw NetworkException.getException(ex);
    }
  }

  @override
  Future<T> putRaw<T>({
    required String endpoint,
    required data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  }) async {
    try {
      final response = await _getConnect!.put(
        endpoint,
        data,
        query: queryParams,
        headers: <String, String>{
          'accept': 'application/json, text/plain, */*',
          'requiresAuthToken': '$requiresAuthToken',
        },
      );

      return NetworkException.convertResponse(response, converter);
    } catch (ex) {
      throw NetworkException.getException(ex);
    }
  }

  @override
  Future<T> deleteJson<T>({
    required String endpoint,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  }) async {
    try {
      final response = await _getConnect!.delete(
        endpoint,
        query: queryParams,
        headers: <String, String>{
          'accept': 'application/json, text/plain, */*',
          'requiresAuthToken': '$requiresAuthToken',
        },
      );

      return NetworkException.convertResponse(response, converter);
    } catch (ex) {
      throw NetworkException.getException(ex);
    }
  }

  @override
  Future<T> postJson<T>({
    required String endpoint,
    required Json data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  }) =>
      postRaw(
        endpoint: endpoint,
        data: data,
        queryParams: queryParams,
        requiresAuthToken: requiresAuthToken,
        converter: converter,
      );

  @override
  Future<T> putJson<T>({
    required String endpoint,
    required Json data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  }) =>
      putRaw(
        endpoint: endpoint,
        data: data,
        queryParams: queryParams,
        requiresAuthToken: requiresAuthToken,
        converter: converter,
      );
}
