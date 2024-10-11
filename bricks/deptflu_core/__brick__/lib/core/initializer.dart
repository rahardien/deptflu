import 'package:{{name.snakeCase()}}/core/injection.dart';

/// Class to initialize all config by calling [Initializer.init()]
/// Feel free to add another config initialization method
abstract class Initializer {
  static Future<void> init() async {
    /// Don't forget to load all dependencies and module first using [Injection.init()]
    await Injection.init();

    await initFirebase();
    await initLocalDatabase();
    await initPushNotification();
  }

  static Future<void> initLocalDatabase() async {}

  static Future<void> initFirebase() async {}

  static Future<void> initPushNotification() async {}
}
