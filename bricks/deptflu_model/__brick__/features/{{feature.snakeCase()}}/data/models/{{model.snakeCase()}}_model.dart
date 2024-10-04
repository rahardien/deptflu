import '../../domain/entities/{{model.snakeCase()}}_entity.dart';

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
