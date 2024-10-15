import 'dart:async';
import '../../../../cores/model/base_response.dart';
import '../models/login_model.dart';

abstract interface class LoginRemoteDataSource {
  FutureOr<BaseResponse<LoginModel>> getLogin();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl();

  @override
  FutureOr<BaseResponse<LoginModel>> getLogin() async {
    throw UnimplementedError();
  }
}