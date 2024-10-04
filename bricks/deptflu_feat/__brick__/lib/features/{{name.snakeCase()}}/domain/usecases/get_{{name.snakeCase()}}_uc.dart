import '../repositories/{{name.snakeCase()}}_repository.dart';

class Get{{name.pascalCase()}}Uc {
  final {{name.pascalCase()}}Repository repository;

  const Get{{name.pascalCase()}}Uc(this.repository);
}