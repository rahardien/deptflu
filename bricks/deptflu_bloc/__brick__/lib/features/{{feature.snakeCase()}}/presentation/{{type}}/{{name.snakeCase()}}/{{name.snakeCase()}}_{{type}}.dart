import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cores/errors/app_failure.dart';
{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}
{{#using_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/using_freezed}}
{{#pagination}}import '../../../../../cores/models/base_status.dart';{{/pagination}}

{{#using_bloc}}part '{{name.snakeCase()}}_event.dart';{{/using_bloc}}
part '{{name.snakeCase()}}_state.dart';
{{#using_freezed}}part '{{name.snakeCase()}}_{{type}}.freezed.dart';{{/using_freezed}}

{{#using_bloc}}
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> { 
{{name.pascalCase()}}Bloc(): super(
  {{^pagination}}
    {{#using_equatable}}{{name.pascalCase()}}StateInit(){{/using_equatable}}
    {{#using_freezed}}{{name.pascalCase()}}State.init(){{/using_freezed}}
  {{/pagination}}
  {{#pagination}}{{name.pascalCase()}}State(){{/pagination}}
);
}
{{/using_bloc}}

{{#using_cubit}}
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(): super(
    {{^pagination}}
      {{#using_equatable}}{{name.pascalCase()}}StateInit(){{/using_equatable}}
      {{#using_freezed}}{{name.pascalCase()}}State.init(){{/using_freezed}}
    {{/pagination}}
    {{#pagination}}{{name.pascalCase()}}State(){{/pagination}}
  );

  Future<void> get{{name.pascalCase()}}(
    {{#pagination}}
    {String query = "",
    int page = 1,
    int limit = 10}
    {{/pagination}}
  ) async {}

  Future<void> get{{name.pascalCase()}}ById(String id) async {}
}
{{/using_cubit}}