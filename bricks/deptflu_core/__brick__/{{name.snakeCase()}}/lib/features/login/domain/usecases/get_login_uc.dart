import 'package:dartz/dartz.dart';
import 'package:{{name.snakeCase()}}/cores/errors/app_failure.dart';
import 'package:{{name.snakeCase()}}/features/login/domain/entities/login_entity.dart';

import '../repositories/login_repository.dart';

class LoginWithEmailAndPasswordUc {
  final LoginRepository repository;

  const LoginWithEmailAndPasswordUc(this.repository);

  Future<Either<AppFailure, LoginEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
