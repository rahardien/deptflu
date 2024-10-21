import 'dart:async';
import '../../../../cores/models/base_response.dart';
import '../models/main_model.dart';

abstract interface class MainRemoteDataSource {
  FutureOr<BaseResponse<MainModel>> getMain();
}

class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  MainRemoteDataSourceImpl();

  @override
  FutureOr<BaseResponse<MainModel>> getMain() async {
    throw UnimplementedError();
  }
}
