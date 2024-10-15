import 'package:dartz/dartz.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_data_source.dart';
import '../datasources/login_remote_data_source.dart';
import '../../domain/entities/login_entity.dart';
import '../../../../cores/errors/app_failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<AppFailure, LoginEntity>> getLogin() async {
    throw UnimplementedError();
  }
}