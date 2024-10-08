{{#isUsingEquatable}}import 'package:equatable/equatable.dart';{{/isUsingEquatable}}
{{#isUsingEquatable}}
class {{name.pascalCase()}}Entity extends Equatable {
  final String? id;

  const {{name.pascalCase()}}Entity({
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
{{/isUsingEquatable}}

{{#isUsingFreezed}}
class {{name.pascalCase()}}Entity {
  final String? id;

  const {{name.pascalCase()}}Entity({
    this.id,
  });

  {{name.pascalCase()}}Entity copyWith({
    String? id,
  }) =>
      {{name.pascalCase()}}Entity(
        id: id ?? this.id,
      );
}
{{/isUsingFreezed}}