import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cores/errors/app_failure.dart';
{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}
{{#using_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/using_freezed}}
{{#pagination}}import '../../../../../cores/constant/base_status.dart';{{/pagination}}

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';
{{#using_freezed}}part '{{name.snakeCase()}}_bloc.freezed.dart';{{/using_freezed}}

{{#using_bloc}}
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{#using_equatable}}{{name.pascalCase()}}Bloc(): super({{^pagination}}{{name.pascalCase()}}StateInit(){{/pagination}}{{#pagination}}{{name.pascalCase()}}State(){{/pagination}});{{/using_equatable}}
  {{#using_freezed}}{{name.pascalCase()}}Bloc(): super({{^pagination}}{{name.pascalCase()}}State.init(){{/pagination}}{{#pagination}}{{name.pascalCase()}}State(){{/pagination}});{{/using_freezed}}
}
{{/using_bloc}}

{{#using_cubit}}
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{#using_equatable}}{{name.pascalCase()}}Cubit(): super({{^pagination}}{{name.pascalCase()}}StateInit(){{/pagination}}{{#pagination}}{{name.pascalCase()}}State(){{/pagination}});{{/using_equatable}}
  {{#using_freezed}}{{name.pascalCase()}}Cubit(): super({{^pagination}}{{name.pascalCase()}}State.init(){{/pagination}}{{#pagination}}{{name.pascalCase()}}State(){{/pagination}});{{/using_freezed}}

  Future<void> get{{name.pascalCase()}}s() async {}

  Future<void> get{{name.pascalCase()}}ById(String id) async {}
}
{{/using_cubit}}