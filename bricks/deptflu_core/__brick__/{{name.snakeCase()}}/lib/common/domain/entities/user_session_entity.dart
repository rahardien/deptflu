import 'package:equatable/equatable.dart';

class UserSessionEntity extends Equatable {
  final String? userId;
  final String? accessToken;
  final String? refreshToken;

  const UserSessionEntity({
    this.userId,
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [
        userId,
        accessToken,
        refreshToken,
      ];
}
