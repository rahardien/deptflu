import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    super.id,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json['id'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
