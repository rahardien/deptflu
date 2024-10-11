import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/app.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const {{name.pascalCase()}}App());
}

