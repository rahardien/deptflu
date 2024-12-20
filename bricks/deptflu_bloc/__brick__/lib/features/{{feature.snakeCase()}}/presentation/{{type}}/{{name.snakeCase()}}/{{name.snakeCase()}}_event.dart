{{#using_bloc}}
part of '{{name.snakeCase()}}_{{type}}.dart';

{{#using_freezed}}
@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  {{#pagination}}
  factory {{name.pascalCase()}}Event.get{{name.pascalCase()}}Event(
      {@Default("") String query, 
      @Default(1) int page, 
      @Default(10) int limit}
  ) = _Get{{name.pascalCase()}}Event;
  {{/pagination}}
  {{^pagination}}
  factory {{name.pascalCase()}}Event.get{{name.pascalCase()}}Event() = _Get{{name.pascalCase()}}Event;
  {{/pagination}}
  factory {{name.pascalCase()}}Event.get{{name.pascalCase()}}ByIdEvent(String id) = _Get{{name.pascalCase()}}ByIdEvent;
}
{{/using_freezed}}

{{#using_equatable}}
abstract class {{name.pascalCase()}}Event extends Equatable {
  const {{name.pascalCase()}}Event();

  @override
  List<Object> get props => [];
}

class Get{{name.pascalCase()}}Event extends {{name.pascalCase()}}Event {
  {{#pagination}}
  final String query;
  final int page;
  final int limit;
  {{/pagination}}

  const Get{{name.pascalCase()}}Event(
    {{#pagination}}
    {this.query = '',
    this.page = 1,
    this.limit = 10,}
    {{/pagination}}
  );

  @override
  List<Object> get props => [
    {{#pagination}}
    query, page, limit
    {{/pagination}}
  ];
}

class Get{{name.pascalCase()}}ByIdEvent extends {{name.pascalCase()}}Event {
  final String id;

  const Get{{name.pascalCase()}}ByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}
{{/using_equatable}}
{{/using_bloc}}