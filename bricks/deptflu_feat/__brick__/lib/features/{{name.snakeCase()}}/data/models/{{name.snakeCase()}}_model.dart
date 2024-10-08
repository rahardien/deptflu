import '../../domain/entities/{{name.snakeCase()}}_entity.dart';

{{#isUsingEquatable}}
class {{name.pascalCase()}}Model extends {{name.pascalCase()}}Entity {
  const {{name.pascalCase()}}Model({
    super.id,
  });

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => {{name.pascalCase()}}Model(
        id: json['id'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
{{/isUsingEquatable}}

{{#isUsingFreezed}}
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_model.freezed.dart';
part '{{name.snakeCase()}}_model.g.dart';

@freezed
class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const {{name.pascalCase()}}Model._();

  const factory {{name.pascalCase()}}Model({
    String? id,
  }) = _{{name.pascalCase()}}Model;

  {{name.pascalCase()}}Entity toEntity() => {{name.pascalCase()}}Entity(
    id: id,
  );

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}ModelFromJson(json);
}
{{/isUsingFreezed}}