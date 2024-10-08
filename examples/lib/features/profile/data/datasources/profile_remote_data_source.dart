import 'dart:async';
import '../../../../cores/model/base_response.dart';
import '../models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  FutureOr<BaseResponse<ProfileModel>> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  FutureOr<BaseResponse<ProfileModel>> getProfile() async {
    throw UnimplementedError();
  }
}
