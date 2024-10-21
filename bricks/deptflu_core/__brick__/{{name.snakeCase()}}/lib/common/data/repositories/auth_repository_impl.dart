import 'package:dartz/dartz.dart';
import 'package:{{name.snakeCase()}}/common/data/datasources/auth_local_data_source.dart';
import 'package:{{name.snakeCase()}}/common/domain/entities/user_session_entity.dart';
import 'package:{{name.snakeCase()}}/common/domain/repositories/auth_repository.dart';
import 'package:{{name.snakeCase()}}/cores/errors/app_failure.dart';
import 'package:{{name.snakeCase()}}/cores/services/logger_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<AppFailure, Unit>> saveSesssion(
    UserSessionEntity entity,
  ) async {
    try {
      await Future.wait([
        localDataSource.saveUserId(entity.userId ?? ""),
        localDataSource.saveAccessToken(entity.accessToken ?? ""),
        localDataSource.saveRefreshToken(entity.refreshToken ?? ""),
      ]);

      return const Right(unit);
    } catch (e) {
      LoggerService.instance().error("[$this][login][catch] error: $e");
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Option<UserSessionEntity>> get session async {
    try {
      final result = await Future.wait([
        localDataSource.userId,
        localDataSource.accessToken,
        localDataSource.refreshToken,
      ]);

      final session = UserSessionEntity(
        userId: result[0],
        accessToken: result[1],
        refreshToken: result[2],
      );

      return optionOf(session);
    } catch (e) {
      LoggerService.instance().error("[$this][login][catch] error: $e");
      return none();
    }
  }

  @override
  Future<Either<AppFailure, Unit>> destroySession() async {
    try {
      await localDataSource.destroySession();

      return const Right(unit);
    } catch (e) {
      LoggerService.instance().error("[$this][login][catch] error: $e");
      return Left(UnknownFailure());
    }
  }
}
