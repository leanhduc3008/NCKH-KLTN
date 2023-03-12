import '../../common/base/base_typedef.dart';

abstract class ApiInterface {
  const ApiInterface();

  Future<T> getJson<T>({
    required String endpoint,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  });

  Future<T> postJson<T>({
    required String endpoint,
    required Json data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  });

  Future<T> putJson<T>({
    required String endpoint,
    required Json data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  });

  Future<T> deleteJson<T>({
    required String endpoint,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  });

  Future<T> putRaw<T>({
    required String endpoint,
    required dynamic data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  });

  Future<T> postRaw<T>({
    required String endpoint,
    required dynamic data,
    Json? queryParams,
    bool requiresAuthToken = true,
    Converter<T>? converter,
  });
}
