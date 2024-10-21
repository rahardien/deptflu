import 'package:get_it/get_it.dart';
import 'data/datasources/login_remote_data_source.dart';
import 'data/datasources/login_local_data_source.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/get_login_uc.dart';
import 'presentation/bloc/login_bloc.dart';
import 'package:{{name.snakeCase()}}/cores/injection.dart';

class LoginModule {
  static void init() {
    // Data Sources
    GetIt.I.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(sl.get()),
    );
    GetIt.I.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(),
    );

    // Repositories
    GetIt.I.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        remoteDataSource: GetIt.I.get(),
        authLocalDataSource: GetIt.I.get(),
      ),
    );

    // Usecases
    // Sample of usecases
    GetIt.I.registerLazySingleton<LoginWithEmailAndPasswordUc>(
      () => LoginWithEmailAndPasswordUc(GetIt.I.get()),
    );

    // Bloc_s
    GetIt.I.registerLazySingleton<LoginBloc>(
      () => LoginBloc(loginUc: GetIt.I.get()),
    );
  }
}
