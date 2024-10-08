{{#isUsingBloc}}part of '{{name.snakeCase()}}_bloc.dart';{{/isUsingBloc}}

{{#isUsingEquatable}}
abstract class {{name.pascalCase()}}Event extends Equatable {
  const {{name.pascalCase()}}Event();

  @override
  List<Object> get props => [];
}

class Get{{name.pascalCase()}}sEvent extends {{name.pascalCase()}}Event {}

class Get{{name.pascalCase()}}ByIdEvent extends {{name.pascalCase()}}Event {
  final String id;

  const Get{{name.pascalCase()}}ByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class Add{{name.pascalCase()}}Event extends {{name.pascalCase()}}Event {
  final dynamic data;

  const Add{{name.pascalCase()}}Event(this.data);

  @override
  List<Object> get props => [data];
}

class Remove{{name.pascalCase()}}ByIdEvent extends {{name.pascalCase()}}Event {
  final String id;

  const Remove{{name.pascalCase()}}ByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}
{{/isUsingEquatable}}