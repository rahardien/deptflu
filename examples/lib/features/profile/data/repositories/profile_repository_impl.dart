import 'package:dartz/dartz.dart';

import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../datasources/profile_remote_data_source.dart';
import '../../domain/entities/profile_entity.dart';
import '../../../../cores/errors/app_failure.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<AppFailure, ProfileEntity>> getProfile() async {
    throw UnimplementedError();
  }
}