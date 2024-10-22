{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}

{{#using_equatable}}
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
{{/using_equatable}}

{{#using_freezed}}
class UserSessionEntity {
  final String? userId;
  final String? accessToken;
  final String? refreshToken;

  const UserSessionEntity({
    this.userId,
    this.accessToken,
    this.refreshToken,
  });

  UserSessionEntity copyWith({
    String? userId,
    String? accessToken,
    String? refreshToken,
  }) =>
      UserSessionEntity(
        userId: userId ?? this.userId,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );
}
{{/using_freezed}}
