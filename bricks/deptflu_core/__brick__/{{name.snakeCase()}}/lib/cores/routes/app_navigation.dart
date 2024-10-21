import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/cores/routes/navigation_interface.dart';
import 'package:{{name.snakeCase()}}/cores/routes/go_router/go_router_navigation.dart';

class AppNavigation {
  static late NavigationInterface _navigation;

  AppNavigation._() {
    _navigation = GoRouterNavigation();
  }

  static AppNavigation get instance => AppNavigation._();

  Future<T?> push<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  }) {
    return _navigation.push(context: context, path: path, param: param);
  }

  Future<T?> pushNamed<T extends Object?>({
    required BuildContext context,
    required String name,
    Object? param,
  }) {
    return _navigation.pushNamed(context: context, name: name, param: param);
  }

  Future<T?> pushReplacement<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  }) async {
    _navigation.pushReplacement(context: context, path: path, param: param);
    return null;
  }

  Future<T?> pushNamedReplacement<T extends Object?>({
    required BuildContext context,
    required String name,
    Object? param,
  }) async {
    _navigation.pushNamedReplacement(
      context: context,
      name: name,
      param: param,
    );
    return null;
  }

  void pop<T extends Object?>(BuildContext context, [T? result]) {
    return _navigation.pop(context, result);
  }
}
