import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/cores/routes/route_interfaces.dart';
{{#isRoutingNone}}import 'package:{{name.snakeCase()}}/cores/routes/default/default_navigation.dart';{{/isRoutingNone}}
{{#isRoutingGoRouter}}import 'package:{{name.snakeCase()}}/cores/routes/go_router/go_router_navigation.dart';{{/isRoutingGoRouter}}

class AppNavigation {
  static late NavigationInterface _navigation;

  AppNavigation._() {
    {{#isRoutingNone}}_navigation = DefaultNavigation();{{/isRoutingNone}}
    {{#isRoutingGoRouter}} _navigation = GoRouterNavigation();{{/isRoutingGoRouter}}
  }

  static AppNavigation get instance => AppNavigation._();

  Future<T?> push<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  }) {
    return _navigation.push(context: context, path: path, param: param);
  }

  Future<T?> pushReplacement<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  }) async {
    _navigation.pushReplacement(context: context, path: path, param: param);
    return null;
  }

  void pop<T extends Object?>(BuildContext context, [T? result]) {
    return _navigation.pop(context, result);
  }
}
