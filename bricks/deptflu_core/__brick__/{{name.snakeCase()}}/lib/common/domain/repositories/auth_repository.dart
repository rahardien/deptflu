import 'package:dartz/dartz.dart';
import 'package:{{name.snakeCase()}}/common/domain/entities/user_session_entity.dart';
import 'package:{{name.snakeCase()}}/cores/errors/app_failure.dart';

abstract interface class AuthRepository {
  Future<Either<AppFailure, Unit>> saveSesssion(UserSessionEntity entity);

  Future<Option<UserSessionEntity>> get session;

  Future<Either<AppFailure, Unit>> destroySession();
}
