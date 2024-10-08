{{#isUsingEquatable}}import 'package:equatable/equatable.dart';{{/isUsingEquatable}}
{{#isUsingEquatable}}
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
{{/isUsingEquatable}}

{{#isUsingFreezed}}
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
{{/isUsingFreezed}}
