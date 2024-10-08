import 'package:dartz/dartz.dart';

import '../../../../cores/errors/app_failure.dart';
import '../entities/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<Either<AppFailure, ProfileEntity>> getProfile();
}