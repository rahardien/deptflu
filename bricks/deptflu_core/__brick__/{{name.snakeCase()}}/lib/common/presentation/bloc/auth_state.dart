part of 'auth_cubit.dart';

{{#using_equatable}}
class AuthState extends Equatable {
  final AuthStatus status;
  final String? accessToken;
  final String? message;

  const AuthState({
    this.status = AuthStatus.initial,
    this.accessToken,
    this.message,
  });

  @override
  List<Object?> get props => [status, accessToken, message];

  AuthState copyWith({
    AuthStatus? status,
    String? accessToken,
    String? message,
  }) =>
      AuthState(
        status: status ?? this.status,
        accessToken: accessToken ?? this.accessToken,
      );
}
{{/using_equatable}}

{{#using_freezed}}
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    String? accessToken,
    String? message,
  }) = _AuthState;
}
{{/using_freezed}}