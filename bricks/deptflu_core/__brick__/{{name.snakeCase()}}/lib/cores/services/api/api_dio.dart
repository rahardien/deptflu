import "package:dio/dio.dart";

import "package:{{name.snakeCase()}}/environment.dart";
import "package:{{name.snakeCase()}}/cores/services/api/api_log_interceptor.dart";

abstract class ApiDio {
  static Dio getDio({
    String? baseUrl,
    Map<String, dynamic> header = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
    String contentType = "application/json",
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? Environment.appBaseUrl,
        connectTimeout: Duration(milliseconds: connectTimeout),
        receiveTimeout: Duration(milliseconds: receiveTimeout),
        contentType: contentType,
      ),
    );

    dio.options.headers.addAll(header);
    dio.interceptors.add(ApiLogInterceptor());

    return dio;
  }
}
