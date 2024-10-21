import 'package:get_it/get_it.dart';
import 'data/datasources/main_remote_data_source.dart';
import 'data/datasources/main_local_data_source.dart';
import 'data/repositories/main_repository_impl.dart';
import 'domain/repositories/main_repository.dart';
import 'domain/usecases/get_main_uc.dart';
import 'presentation/bloc/main_bloc.dart';

class MainModule {
  static void init() {
    // Data Sources
    GetIt.I.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(),
    );
    GetIt.I.registerLazySingleton<MainLocalDataSource>(
      () => MainLocalDataSourceImpl(),
    );

    // Repositories
    GetIt.I.registerLazySingleton<MainRepository>(
      () => MainRepositoryImpl(
        remoteDataSource: GetIt.I.get(),
        localDataSource: GetIt.I.get(),
      ),
    );

    // Usecases
    // Sample of usecases
    GetIt.I.registerLazySingleton<GetMainUc>(
      () => GetMainUc(GetIt.I.get()),
    );

    // Bloc_s
    GetIt.I.registerLazySingleton<MainBloc>(
      () => MainBloc(getMainUc: GetIt.I.get()),
    );
  }
}
