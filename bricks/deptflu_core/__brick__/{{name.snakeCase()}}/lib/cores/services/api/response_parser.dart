import 'package:json_annotation/json_annotation.dart';
import 'package:{{name.snakeCase()}}/features/login/data/models/login_model.dart';

bool typeEqual<L, R>() => L == R;

bool typeEqualn<L, R>() => typeEqual<L, R>() || typeEqual<L?, R?>();

class ResponseParser<T> extends JsonConverter<T, Object> {
  @override
  T fromJson(Object json) {
    if (json is List && json.isEmpty) json = <String, dynamic>{};

    if (json is Map<String, dynamic> == false) {
      return json as T;
    }

    json = json as Map<String, dynamic>;

    if (typeEqualn<T, dynamic>()) {
      return dynamic as T;
    } else if (typeEqualn<T, LoginModel>()) {
      return LoginModel.fromJson(json) as T;
    }

    throw UnimplementedError("`$T` fromJson factory not implemented");
  }

  @override
  Object toJson(T object) {
    if (typeEqualn<T, dynamic>()) {
      return object as Object;
    } else if (typeEqualn<T, LoginModel>()) {
      return (object as LoginModel).toJson() as Object;
    }

    throw UnimplementedError("`$T` fromJson factory not implemented");
  }
}
