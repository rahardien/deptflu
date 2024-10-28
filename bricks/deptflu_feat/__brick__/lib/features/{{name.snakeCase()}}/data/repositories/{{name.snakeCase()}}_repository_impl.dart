import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/{{name.snakeCase()}}_local_data_source.dart';
import '../datasources/{{name.snakeCase()}}_remote_data_source.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;

  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
}