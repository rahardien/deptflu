{{#isUsingBloc}}part of '{{name.snakeCase()}}_bloc.dart';{{/isUsingBloc}}

{{#isUsingEquatable}}
abstract class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();

  @override
  List<Object> get props => [];
}

class {{name.pascalCase()}}StateInit extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}StateLoading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}StateSuccess extends {{name.pascalCase()}}State {
  final dynamic data;

  const {{name.pascalCase()}}StateSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class {{name.pascalCase()}}StateError extends {{name.pascalCase()}}State {
  final AppFailure failure;
  final int? code;
  final String? message;

  const {{name.pascalCase()}}StateError({required this.failure, this.code, this.message});

  @override
  List<Object> get props => [
    [failure, code, message,],
  ];
}
{{/isUsingEquatable}}