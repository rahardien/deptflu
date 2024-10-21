import 'package:equatable/equatable.dart';
import 'package:{{name.snakeCase()}}/cores/constants/auth_constants.dart';

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
