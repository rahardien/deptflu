import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/app.dart';
import 'package:{{name.snakeCase()}}/core/initializer.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize all config, dependencies, and module
  await Initializer.init();

  runApp(const {{name.pascalCase()}}App());
}

