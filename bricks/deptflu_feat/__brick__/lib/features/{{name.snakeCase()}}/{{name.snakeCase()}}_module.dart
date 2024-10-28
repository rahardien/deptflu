import 'package:get_it/get_it.dart';
import '../../cores/injection.dart';
import 'data/datasources/{{name.snakeCase()}}_remote_data_source.dart';
import 'data/datasources/{{name.snakeCase()}}_local_data_source.dart';
import 'data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import 'domain/repositories/{{name.snakeCase()}}_repository.dart';
import 'domain/usecases/get_{{name.snakeCase()}}_uc.dart';
import 'presentation/bloc/{{name.snakeCase()}}_bloc.dart';

class {{name.pascalCase()}}Module {
  static void init() {
    // Data Sources
    sl.registerLazySingleton<{{name.pascalCase()}}RemoteDataSource>(
      () => {{name.pascalCase()}}RemoteDataSourceImpl(),
    );
    sl.registerLazySingleton<{{name.pascalCase()}}LocalDataSource>(
      () => {{name.pascalCase()}}LocalDataSourceImpl(),
    );

    // Repositories
    sl.registerLazySingleton<{{name.pascalCase()}}Repository>(
      () => {{name.pascalCase()}}RepositoryImpl(
        remoteDataSource: sl.get(),
        localDataSource: sl.get(),
      ),
    );

    // Usecases
    // Sample of usecases
    sl.registerLazySingleton<{{name.pascalCase()}}Uc>(
      () => {{name.pascalCase()}}Uc(sl.get()),
    );

    // Bloc_s
  }
}
