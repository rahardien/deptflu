import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:{{name.snakeCase()}}/cores/constants/api_constants.dart';
import 'package:{{name.snakeCase()}}/cores/utils/map_utils.dart';
import 'package:{{name.snakeCase()}}/cores/services/logger_service.dart';

class ApiLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = options.uri.toString();
    final method = options.method;
    final header = options.headers;
    final body = options.queryParameters;

    LoggerService.instance().logApi(
      level: Level.info,
      type: ApiType.request,
      url: url,
      method: method,
      header: header,
      body: convertDynamicMap(body),
    );

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final url = response.requestOptions.uri.toString();
    final method = response.requestOptions.method.toUpperCase();
    final code = response.statusCode ?? -1;

    /// Alter incoming response from API to match our Response schema
    /// In this example, we use API from [https://reqres.in/], so we need to alter the response because it has different Response schema
    /// Note: You'll less likely to alter the incoming Response if using API Service from internal, since it will match the schema out-of-the-box
    Map<String, dynamic> data;

    if (response.data is Map<String, dynamic>) {
      data = response.data;
    } else {
      data = {
        'data': response.data,
      };
    }

    data['status_code'] = response.statusCode;
    data['message'] = response.statusMessage;

    if (data['data'] == null) {
      if (data['token'] != null) {
        data['data'] = {
          'token': data['token'],
        };
        data.remove('token');
      }
    }

    if (data['data'] is List<dynamic>) {
      data['data'] = {
        'list': data['data'],
        'pagination': {
          'page': data['page'],
          'per_page': data['per_page'],
          'total': data['total'],
          'total_page': data['total_pages'],
        },
      };
    }
    response.data = data;

    LoggerService.instance().logApi(
      level: Level.info,
      type: ApiType.response,
      url: url,
      method: method,
      code: code,
      data: convertDynamicMap(data),
    );

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LoggerService.instance().logApi(
      level: Level.error,
      type: ApiType.response,
      url: err.requestOptions.baseUrl,
      method: err.requestOptions.method,
      code: err.response?.statusCode ?? -1,
      data: {'message': err.message},
    );

    return handler.next(err);
  }
}
