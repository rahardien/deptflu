import 'package:equatable/equatable.dart';

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
