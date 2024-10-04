import 'package:get_it/get_it.dart';
import 'data/datasources/news_remote_data_source.dart';
import 'data/repositories/news_repository_impl.dart';
import 'domain/repositories/news_repository.dart';
import 'domain/usecases/get_news_uc.dart';
import 'presentation/bloc/news_bloc.dart';

class NewsModule {
  static void init() {
    // Data Sourcees
    GetIt.I.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(),
    );

    // Repositories
    GetIt.I.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(),
    );

    // Usecases
    // Sample of usecases
    GetIt.I.registerLazySingleton<GetNewsUc>(
      () => GetNewsUc(GetIt.I.get()),
    );

    // Bloc_s
    GetIt.I.registerLazySingleton<NewsBloc>(
      () => NewsBloc(getNewsUc: GetIt.I.get()),
    );
  }
}
