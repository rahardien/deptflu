import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/{{name.snakeCase()}}_bloc.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I.get<{{name.pascalCase()}}Bloc>(),
        ),
      ],
      child: const _{{name.pascalCase()}}Layout(),
    );
  }
}

class _{{name.pascalCase()}}Layout extends StatelessWidget {
  const _{{name.pascalCase()}}Layout();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("{{name.pascalCase()}} Page"),
      ),
    );
  }
}
