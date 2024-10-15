import 'package:dartz/dartz.dart';

import '../../../../cores/errors/app_failure.dart';
import '../entities/login_entity.dart';

abstract interface class LoginRepository {
  Future<Either<AppFailure, LoginEntity>> getLogin();
}