import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{name.snakeCase()}}/common/data/datasources/auth_local_data_source.dart';
import 'package:{{name.snakeCase()}}/common/data/repositories/auth_repository_impl.dart';
import 'package:{{name.snakeCase()}}/common/domain/repositories/auth_repository.dart';
import 'package:{{name.snakeCase()}}/cores/services/api/api_service.dart';
import 'package:{{name.snakeCase()}}/cores/services/secure_storage_service.dart';
import 'package:{{name.snakeCase()}}/cores/services/shared_pref_service.dart';
import 'package:{{name.snakeCase()}}/features/login/login_module.dart';
import 'package:{{name.snakeCase()}}/features/main/main_module.dart';

/// Global instance to retrieve and inject depencencies accross the app
/// [sl] stands for Service Locator, which most likely suit the mechanism than dependency injection
final sl = GetIt.instance;

/// Class to inject global and modul-scoped dependencies using [Injection.init()]
/// Feel free to add another global dependencies or feature's module
abstract class Injection {
  static Future<void> init() async {
    await loadGlobalDependencies();
    await loadModules();
  }

  static Future<void> loadGlobalDependencies() async {
    // Global dependencies
    sl.registerLazySingletonAsync(() => SharedPreferences.getInstance());
    sl.registerLazySingleton(() => const FlutterSecureStorage());
    sl.registerLazySingleton(() => SecureStorageService.instance);
    sl.registerLazySingletonAsync(() => SharedPrefService.instance);

    final apiService = await ApiService.create();
    sl.registerLazySingleton<ApiService>(() => apiService);

    // Data sources
    final sharedPref = await sl.getAsync<SharedPrefService>();
    sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
        secureStorageService: sl.get(),
        sharedPrefService: sharedPref,
      ),
    );

    /// Repositories
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        localDataSource: sl.get<AuthLocalDataSource>(),
      ),
    );
  }

  static Future<void> loadModules() async {
    /// Feel free to add another module
    MainModule.init();
    LoginModule.init();
  }
}
