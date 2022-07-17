import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../flavors.dart';
import 'base_http_service.dart';
import 'interceptors/error_interceptor.dart';

class DadyJokeHttpClient implements BaseHttpClient {
  static BaseOptions opts = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: connectTimeout,
    receiveTimeout: 20000,
    headers: {'Accept': 'application/json'},
  );

  final Dio _dio = createDio(opts);

  Dio get dio => _dio;

  static Dio createDio(BaseOptions opts) {
    final dio = Dio(opts);
    if (appFlavor != Flavor.PROD) {
      dio.interceptors.add(
        PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true, compact: false, maxWidth: 150),
      );
    }

    // set to false since AuthInterceptor will handle 401s with a custom exception
    dio.interceptors.add(ErrorInterceptor(isOverwriteUnauthorizedError: false));
    return dio;
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool noCache = false,
  }) {
    final noCacheHeader = Options(headers: {'Cache-Control': 'no-cache'});
    return _dio.get<T>(path, queryParameters: queryParameters, options: noCache ? noCacheHeader : null);
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.post(path, data: data, queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.put(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.delete(path, queryParameters: queryParameters);
  }
}
