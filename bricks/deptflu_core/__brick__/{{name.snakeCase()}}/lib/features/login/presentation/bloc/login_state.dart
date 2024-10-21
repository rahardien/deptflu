part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInit extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final String token;

  const LoginStateSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class LoginStateError extends LoginState {
  final int? code;
  final String? message;
  final AppFailure failure;

  const LoginStateError({
    required this.code,
    required this.message,
    required this.failure,
  });

  @override
  List<Object> get props => [
        [code, message],
        failure
      ];
}
