import 'package:dartz/dartz.dart';

import '../../../../cores/errors/app_failure.dart';
import '../entities/main_entity.dart';

abstract interface class MainRepository {
  Future<Either<AppFailure, MainEntity>> getMain();
}