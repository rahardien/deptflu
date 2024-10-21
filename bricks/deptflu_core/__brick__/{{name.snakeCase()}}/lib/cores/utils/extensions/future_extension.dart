import 'package:{{name.snakeCase()}}/cores/errors/exceptions/api_exception.dart';
import 'package:{{name.snakeCase()}}/cores/models/base_response.dart';

extension FutureHandleApiResponseExt<T> on Future<BaseResponse<T>> {
  Future<BaseResponse<T>> handleResponse() async {
    return then((response) {
      if (response.statusCode.toString().startsWith('2')) {
        return response;
      }

      if (response.statusCode == 0) {
        throw RequestCancelledException();
      } else if (response.statusCode == 401) {
        throw SessionException();
      }

      if (response.statusCode.toString().startsWith('4')) {
        throw ClientException(
          response.statusCode,
          response.message,
          response.errors,
        );
      } else if (response.statusCode.toString().startsWith('5')) {
        throw ServerException(false);
      }

      throw UnknownException(response.message);
    });
  }
}
