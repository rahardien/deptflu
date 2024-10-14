import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract interface class RouterInterface {
  RouterConfig<Object> get routerConfig;
}

abstract interface class NavigationInterface {
  Future<T?> push<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  });

  Future<T?> pushReplacement<T extends Object?>({
    required BuildContext context,
    required String path,
    Object? param,
  });

  void pop<T extends Object?>(BuildContext context, [T? result]);
}
