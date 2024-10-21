import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:{{name.snakeCase()}}/cores/errors/app_failure.dart';
import '../../domain/usecases/get_login_uc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithEmailAndPasswordUc loginUc;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  LoginBloc({required this.loginUc}) : super(LoginStateInit()) {
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
  }

  bool validateForm() {
    return formKey.currentState?.saveAndValidate() ?? false;
  }
}
