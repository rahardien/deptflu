import '../../domain/entities/login_entity.dart';


class LoginModel extends LoginEntity {
  const LoginModel({
    super.id,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json['id'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}


