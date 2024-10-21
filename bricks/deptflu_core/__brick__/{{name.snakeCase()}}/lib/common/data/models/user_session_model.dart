import '../../domain/entities/user_session_entity.dart';

class UserSessionModel extends UserSessionEntity {
  const UserSessionModel({
    super.userId,
    super.accessToken,
    super.refreshToken,
  });

  factory UserSessionModel.fromJson(Map<String, dynamic> json) =>
      UserSessionModel(
        userId: json['user_id'] as String?,
        accessToken: json['name'] as String?,
      );

  factory UserSessionModel.fromEntity(UserSessionEntity entity) =>
      UserSessionModel(
        userId: entity.userId,
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}
