import 'package:get_it/get_it.dart';
import 'data/datasources/profile_remote_data_source.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/usecases/get_profile_uc.dart';
import 'presentation/bloc/profile_bloc.dart';

class ProfileModule {
  static void init() {
    // Data Sourcees
    GetIt.I.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(),
    );

    // Repositories
    GetIt.I.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(),
    );

    // Usecases
    // Sample of usecases
    GetIt.I.registerLazySingleton<GetProfileUc>(
      () => GetProfileUc(GetIt.I.get()),
    );

    // Bloc_s
    GetIt.I.registerLazySingleton<ProfileBloc>(
      () => ProfileBloc(getProfileUc: GetIt.I.get()),
    );
  }
}
