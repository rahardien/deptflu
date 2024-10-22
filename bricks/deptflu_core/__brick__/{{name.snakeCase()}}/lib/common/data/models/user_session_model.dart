import '../../domain/entities/user_session_entity.dart';
{{#using_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/using_freezed}}

{{#using_equatable}}
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
{{/using_equatable}}

{{#using_freezed}}
part 'user_session_model.freezed.dart';
part 'user_session_model.g.dart';

@freezed
class UserSessionModel with _$UserSessionModel {
  const UserSessionModel._();

  const factory UserSessionModel({
    String? userId,
    String? accessToken,
    String? refreshToken,
  }) = _UserSessionModel;

  UserSessionEntity toEntity() => UserSessionEntity(
    userId: userId,
    accessToken: accessToken,
    refreshToken: refreshToken,
  );

  factory UserSessionModel.fromEntity(UserSessionEntity entity) => UserSessionModel(
        userId: entity.userId,
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

  factory UserSessionModel.fromJson(Map<String, dynamic> json) => _$UserSessionModelFromJson(json);
}
{{/using_freezed}}