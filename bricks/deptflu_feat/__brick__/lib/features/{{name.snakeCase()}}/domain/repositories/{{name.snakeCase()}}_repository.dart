import 'package:dartz/dartz.dart';

import '../../../../cores/errors/app_failure.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';

abstract interface class {{name.pascalCase()}}Repository {
  Future<Either<AppFailure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}();
}