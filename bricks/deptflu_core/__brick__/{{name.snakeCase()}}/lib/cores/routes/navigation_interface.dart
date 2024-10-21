import 'package:flutter/widgets.dart';

abstract interface class NavigationInterface {
  Future<T?> push<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  });

  Future<T?> pushNamed<T extends Object?>({
    required BuildContext context,
    required String name,
    Object? param,
  });

  Future<T?> pushReplacement<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  });

  Future<T?> pushNamedReplacement<T extends Object?>({
    required BuildContext context,
    required String name,
    Object? param,
  });

  void pop<T extends Object?>(BuildContext context, [T? result]);
}
