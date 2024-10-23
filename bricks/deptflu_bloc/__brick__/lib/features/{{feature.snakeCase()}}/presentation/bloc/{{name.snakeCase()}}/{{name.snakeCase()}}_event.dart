part of '{{name.snakeCase()}}_{{type}}.dart';

{{#using_bloc}}
{{#using_freezed}}
@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  factory {{name.pascalCase()}}Event.get{{name.pascalCase()}}sEvent() = _Get{{name.pascalCase()}}sEvent;
  factory {{name.pascalCase()}}Event.get{{name.pascalCase()}}ByIdEvent(String id) = _Get{{name.pascalCase()}}ByIdEvent;
}
{{/using_freezed}}

{{#using_equatable}}
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
{{/using_equatable}}
{{/using_bloc}}