import 'package:get_it/get_it.dart';
import 'data/datasources/{{name.snakeCase()}}_remote_data_source.dart';
import 'data/datasources/{{name.snakeCase()}}_local_data_source.dart';
import 'data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import 'domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'domain/usecases/get_{{name.snakeCase()}}_uc.dart';
import 'presentation/bloc/{{name.snakeCase()}}_bloc.dart';

class {{name.pascalCase()}}Module {
  static void init() {
    // Data Sources
    GetIt.I.registerLazySingleton<{{name.pascalCase()}}RemoteDataSource>(
      () => {{name.pascalCase()}}RemoteDataSourceImpl(),
    );
    GetIt.I.registerLazySingleton<{{name.pascalCase()}}LocalDataSource>(
      () => {{name.pascalCase()}}LocalDataSourceImpl(),
    );

    // Repositories
    GetIt.I.registerLazySingleton<{{name.pascalCase()}}Repository>(
      () => {{name.pascalCase()}}RepositoryImpl(
        remoteDataSource: GetIt.I.get(),
        localDataSource: GetIt.I.get(),
      ),
    );

    // Usecases
    // Sample of usecases
    GetIt.I.registerLazySingleton<Get{{name.pascalCase()}}Uc>(
      () => Get{{name.pascalCase()}}Uc(GetIt.I.get()),
    );

    // Bloc_s
    GetIt.I.registerLazySingleton<{{name.pascalCase()}}Bloc>(
      () => {{name.pascalCase()}}Bloc(get{{name.pascalCase()}}Uc: GetIt.I.get()),
    );
  }
}
