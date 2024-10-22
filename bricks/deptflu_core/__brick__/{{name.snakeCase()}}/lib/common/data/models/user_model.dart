import 'package:{{name.snakeCase()}}/common/domain/entities/user_entity.dart';
{{#using_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/using_freezed}}

{{#using_equatable}}
class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        email: entity.email,
        firstName: entity.firstName,
        lastName: entity.lastName,
        avatar: entity.avatar,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
{{/using_equatable}}

{{#using_freezed}}
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UserModel;

  UserEntity toEntity() => UserEntity(
    id: id,
    email: email,
    firstName: firstName,
    lastName: lastName,
    avatar: avatar,
  );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        email: entity.email,
        firstName: entity.firstName,
        lastName: entity.lastName,
        avatar: entity.avatar,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
{{/using_freezed}}