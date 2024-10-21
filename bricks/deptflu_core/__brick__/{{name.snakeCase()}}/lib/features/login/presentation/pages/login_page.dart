import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{name.snakeCase()}}/common/presentation/bloc/auth_cubit.dart';
import 'package:{{name.snakeCase()}}/common/presentation/bloc/auth_state.dart';
import 'package:{{name.snakeCase()}}/cores/constants/auth_constants.dart';
import 'package:{{name.snakeCase()}}/cores/routes/app_navigation.dart';
import 'package:{{name.snakeCase()}}/cores/routes/routes.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (_, state) {
            if (state.status == AuthStatus.authenticated) {
              AppNavigation.instance.pushNamedReplacement(
                context: context,
                name: Routes.home,
              );
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (_, state) {
            if (state is LoginStateSuccess) {
              log("Success login. Redirecting...");
              context.read<AuthCubit>().authenticate(accessToken: state.token);
            }
          },
        ),
      ],
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FormBuilder(
            key: context.read<LoginBloc>().formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 32),
                  FormBuilderTextField(
                      name: 'email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ])),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (_, state) {
                      return FilledButton(
                        onPressed: state is LoginStateLoading
                            ? null
                            : () async {
                                context
                                    .read<LoginBloc>()
                                    .add(LoginWithEmailAndPasswordEvent());
                              },
                        child: const Text("Login"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
