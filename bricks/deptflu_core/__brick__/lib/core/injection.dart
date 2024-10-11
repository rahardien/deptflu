import 'package:get_it/get_it.dart';
import 'package:{{name.snakeCase()}}/core/services/secure_storage_service.dart';
import 'package:{{name.snakeCase()}}/core/services/shared_pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    sl.registerLazySingletonAsync(() => SharedPreferences.getInstance());
    sl.registerLazySingleton(() => const FlutterSecureStorage());

    sl.registerLazySingleton(() => SecureStorageService.instance);
    sl.registerLazySingletonAsync(() => SharedPrefService.instance);

    /// Feel free to add another global dependencies
  }

  static Future<void> loadModules() async {
    /// Feel free to add another module
  }
}
