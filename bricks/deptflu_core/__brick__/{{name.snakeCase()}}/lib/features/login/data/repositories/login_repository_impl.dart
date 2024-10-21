import 'package:dartz/dartz.dart';
import 'package:{{name.snakeCase()}}/common/data/datasources/auth_local_data_source.dart';
import 'package:{{name.snakeCase()}}/cores/errors/exceptions/api_exception.dart';
import 'package:{{name.snakeCase()}}/cores/services/logger_service.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';
import '../../domain/entities/login_entity.dart';
import '../../../../cores/errors/app_failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<AppFailure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
        email: email,
        password: password,
      );

      if (result.data == null) {
        return const Left(ServerFailure());
      }

      await authLocalDataSource.saveAccessToken(result.data!.token ?? "");

      return Right(result.data!);
    } on ClientException catch (e) {
      return Left(
        ClientFailure(
          code: e.code,
          messages: e.toString(),
          errors: e.errors,
        ),
      );
    } on ServerException {
      return const Left(ServerFailure());
    } on UnknownException {
      return Left(UnknownFailure());
    } catch (e) {
      LoggerService.instance().error("[$this][login][catch] error: $e");
      return Left(UnknownFailure());
    }
  }
}
