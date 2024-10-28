import '../repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}Uc {
  final {{name.pascalCase()}}Repository repository;

  const {{name.pascalCase()}}Uc(this.repository);
}