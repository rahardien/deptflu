import 'dart:async';
import 'package:{{name.snakeCase()}}/cores/services/api/api_service.dart';
import 'package:{{name.snakeCase()}}/cores/utils/extensions/future_extension.dart';

import '../../../../cores/models/base_response.dart';
import '../models/login_model.dart';

abstract interface class LoginRemoteDataSource {
  Future<BaseResponse<LoginModel>> login({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<BaseResponse<LoginModel>> login({
    required String email,
    required String password,
  }) async {
    return apiService.login({
      'email': email,
      'password': password,
    }).handleResponse();
  }
}
