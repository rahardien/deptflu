import 'package:mason/mason.dart';

abstract class HookUtils {
  static String getAppId({
    required String org,
    required String name,
  }) {
    return "${org.dotCase}.${name.pascalCase}";
  }
}
