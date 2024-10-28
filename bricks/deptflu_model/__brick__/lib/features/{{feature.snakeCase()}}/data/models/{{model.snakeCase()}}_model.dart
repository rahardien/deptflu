import '../../domain/entities/{{model.snakeCase()}}_entity.dart';

{{#using_equatable}}
class {{model.pascalCase()}}Model extends {{model.pascalCase()}}Entity {
  const {{model.pascalCase()}}Model({
    super.id,
    super.name,
    super.createdAt,
    super.updatedAt,
  });

  factory {{model.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => {{model.pascalCase()}}Model(
        id: json['id'],
        name: json['name'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
{{/using_equatable}}

{{#using_freezed}}
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{model.snakeCase()}}_model.freezed.dart';
part '{{model.snakeCase()}}_model.g.dart';

@freezed
class {{model.pascalCase()}}Model with _${{model.pascalCase()}}Model {
  const {{model.pascalCase()}}Model._();

  const factory {{model.pascalCase()}}Model({
    String? id,
    String? name,
    DateTime? createdAt, 
    DateTime? updatedAt,
  }) = _{{model.pascalCase()}}Model;

  {{model.pascalCase()}}Entity toEntity() => {{model.pascalCase()}}Entity(
    id: id,
    name: name,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory {{model.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{model.pascalCase()}}ModelFromJson(json);
}
{{/using_freezed}}