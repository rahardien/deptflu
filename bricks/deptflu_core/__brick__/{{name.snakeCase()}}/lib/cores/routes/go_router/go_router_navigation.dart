import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name.snakeCase()}}/cores/routes/navigation_interface.dart';

class GoRouterNavigation implements NavigationInterface {
  @override
  void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (context.canPop()) context.pop(result);
  }

  @override
  Future<T?> push<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  }) {
    return context.push(path, extra: param);
  }

  @override
  Future<T?> pushReplacement<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  }) async {
    context.go(path, extra: param);
    return null;
  }

  @override
  Future<T?> pushNamed<T extends Object?>(
      {required BuildContext context, required String name, Object? param}) {
    return context.pushNamed(name, extra: param);
  }

  @override
  Future<T?> pushNamedReplacement<T extends Object?>(
      {required BuildContext context,
      required String name,
      Object? param}) async {
    context.goNamed(name, extra: param);
    return null;
  }
}
