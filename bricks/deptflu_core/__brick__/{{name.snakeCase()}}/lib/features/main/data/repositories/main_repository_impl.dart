import 'package:dartz/dartz.dart';

import '../../domain/repositories/main_repository.dart';
import '../datasources/main_local_data_source.dart';
import '../datasources/main_remote_data_source.dart';
import '../../domain/entities/main_entity.dart';
import '../../../../cores/errors/app_failure.dart';

class MainRepositoryImpl implements MainRepository {
  final MainRemoteDataSource remoteDataSource;
  final MainLocalDataSource localDataSource;

  MainRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<AppFailure, MainEntity>> getMain() async {
    throw UnimplementedError();
  }
}