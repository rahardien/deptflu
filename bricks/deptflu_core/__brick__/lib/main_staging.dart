import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/app.dart';
import 'package:{{name.snakeCase()}}/environment.dart';
import 'package:{{name.snakeCase()}}/cores/initializer.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.setFlavor(EnvironmentFlavor.staging);

  /// Initialize all config, dependencies, and module
  await Initializer.init();

  runApp(const {{name.pascalCase()}}App());
}