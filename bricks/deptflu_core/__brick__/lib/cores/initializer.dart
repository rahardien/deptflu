import 'package:{{name.snakeCase()}}/cores/injection.dart';
import 'package:{{name.snakeCase()}}/cores/routes/route_interfaces.dart';
{{#isRoutingGoRouter}}import 'package:{{name.snakeCase()}}/cores/routes/go_router/go_router_router.dart';{{/isRoutingGoRouter}}

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

  {{#isRoutingGoRouter}}static RouterInterface get router => GorouterRouter.instance();{{/isRoutingGoRouter}}

  static Future<void> initLocalDatabase() async {}

  static Future<void> initFirebase() async {}

  static Future<void> initPushNotification() async {}
}
