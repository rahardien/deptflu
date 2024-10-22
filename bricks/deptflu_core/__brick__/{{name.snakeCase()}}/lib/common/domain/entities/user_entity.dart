{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}

{{#using_equatable}}
class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}
{{/using_equatable}}

{{#using_freezed}}
class UserEntity {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) =>
      UserEntity(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatar: avatar ?? this.avatar,
      );
}
{{/using_freezed}}
