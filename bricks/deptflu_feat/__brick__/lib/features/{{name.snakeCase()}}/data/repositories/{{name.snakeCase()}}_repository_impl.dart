import 'package:dartz/dartz.dart';

import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/{{name.snakeCase()}}_local_data_source.dart';
import '../datasources/{{name.snakeCase()}}_remote_data_source.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../../../cores/errors/app_failure.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;

  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<AppFailure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}() async {
    throw UnimplementedError();
  }
}