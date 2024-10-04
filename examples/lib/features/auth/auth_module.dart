import 'package:get_it/get_it.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/get_auth_uc.dart';
import 'presentation/bloc/auth_bloc.dart';

class AuthModule {
  static void init() {
    // Data Sourcees
    GetIt.I.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    );

    // Repositories
    GetIt.I.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(),
    );

    // Usecases
    // Sample of usecases
    GetIt.I.registerLazySingleton<GetAuthUc>(
      () => GetAuthUc(GetIt.I.get()),
    );

    // Bloc_s
    GetIt.I.registerLazySingleton<AuthBloc>(
      () => AuthBloc(getAuthUc: GetIt.I.get()),
    );
  }
}
