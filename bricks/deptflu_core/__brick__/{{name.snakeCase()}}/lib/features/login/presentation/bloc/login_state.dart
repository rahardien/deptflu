part of 'login_bloc.dart';

{{#using_equatable}}
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
{{/using_equatable}}

{{#using_freezed}}
@freezed
class LoginState with _$LoginState {
  const factory LoginState.init() = _Init;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success({required String token}) = _Success;
  const factory LoginState.error({
    int? code,
    String? message,
    required AppFailure failure,
  }) = _Error;
}
{{/using_freezed}}