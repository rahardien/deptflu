import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    super.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json['token'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
