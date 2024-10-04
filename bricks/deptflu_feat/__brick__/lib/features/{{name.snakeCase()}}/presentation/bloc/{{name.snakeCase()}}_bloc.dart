import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_{{name.snakeCase()}}_uc.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  final Get{{name.pascalCase()}}Uc get{{name.pascalCase()}}Uc;

  {{name.pascalCase()}}Bloc({required this.get{{name.pascalCase()}}Uc}): super({{name.pascalCase()}}StateInit());
}