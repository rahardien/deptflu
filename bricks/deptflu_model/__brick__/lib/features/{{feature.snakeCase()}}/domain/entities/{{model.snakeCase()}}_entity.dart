{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}
{{#using_equatable}}
class {{model.pascalCase()}}Entity extends Equatable {
  final String? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const {{model.pascalCase()}}Entity({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id, name, createdAt, updatedAt,
      ];
}
{{/using_equatable}}

{{#using_freezed}}
class {{model.pascalCase()}}Entity {
  final String? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const {{model.pascalCase()}}Entity({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  {{model.pascalCase()}}Entity copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      {{model.pascalCase()}}Entity(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
{{/using_freezed}}
