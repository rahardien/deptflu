import 'dart:async';
import '../../../../cores/model/base_response.dart';
import '../models/{{name.snakeCase()}}_model.dart';

abstract interface class {{name.pascalCase()}}RemoteDataSource {
  FutureOr<BaseResponse<{{name.pascalCase()}}Model>> get{{name.pascalCase()}}();
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  {{name.pascalCase()}}RemoteDataSourceImpl();

  @override
  FutureOr<BaseResponse<{{name.pascalCase()}}Model>> get{{name.pascalCase()}}() async {
    throw UnimplementedError();
  }
}