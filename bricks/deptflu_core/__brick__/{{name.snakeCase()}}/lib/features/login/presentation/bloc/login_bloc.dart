import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}
{{#using_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/using_freezed}}
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:{{name.snakeCase()}}/cores/errors/app_failure.dart';
import '../../domain/usecases/get_login_uc.dart';

part 'login_event.dart';
part 'login_state.dart';
{{#using_freezed}}part 'login_bloc.freezed.dart';{{/using_freezed}}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithEmailAndPasswordUc loginUc;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  LoginBloc({required this.loginUc}) : super(
    {{#using_equatable}}LoginStateInit(){{/using_equatable}}
    {{#using_freezed}}LoginState.init(){{/using_freezed}}
    ) {
    {{#using_equatable}}
    on<LoginWithEmailAndPasswordEvent>((event, emit) async {
      if (validateForm()) {
        final formValues = formKey.currentState?.value;

        emit(LoginStateLoading());

        final result = await loginUc.call(
          email: formValues?['email'],
          password: formValues?['password'],
        );

        result.fold(
          (e) {
            emit(
              LoginStateError(code: e.code, message: e.messages, failure: e),
            );
          },
          (data) {
            emit(LoginStateSuccess(data.token ?? ""));
          },
        );
      } 
    });
    {{/using_equatable}}
    {{#using_freezed}}
    on<LoginEvent>((event, emit) async {
      event.when(
        loginWithEmailAndPassword: () async {
          if (validateForm()) {
            final formValues = formKey.currentState?.value;

            emit(LoginState.loading());

            final result = await loginUc.call(
              email: formValues?['email'],
              password: formValues?['password'],
            );

            result.fold(
              (e) {
                emit(
                  LoginState.error(
                      code: e.code, message: e.messages, failure: e),
                );
              },
              (data) {
                emit(LoginState.success(token: data.token ?? ""));
              },
            );
          }
        },
      );
    });
    {{/using_freezed}}
  }

  bool validateForm() {
    return formKey.currentState?.saveAndValidate() ?? false;
  }
}
