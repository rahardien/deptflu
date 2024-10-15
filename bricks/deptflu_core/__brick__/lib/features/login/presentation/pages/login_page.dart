import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I.get<LoginBloc>(),
        ),
      ],
      child: const _LoginLayout(),
    );
  }
}

class _LoginLayout extends StatelessWidget {
  const _LoginLayout();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Login Page"),
      ),
    );
  }
}
