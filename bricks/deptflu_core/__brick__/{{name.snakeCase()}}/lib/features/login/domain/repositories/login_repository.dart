import 'package:dartz/dartz.dart';

import '../../../../cores/errors/app_failure.dart';
import '../entities/login_entity.dart';

abstract interface class LoginRepository {
  Future<Either<AppFailure, LoginEntity>> login({
    required String email,
    required String password,
  });
}
