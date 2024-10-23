{{#using_bloc}}part of '{{name.snakeCase()}}_bloc.dart';{{/using_bloc}}
{{#using_cubit}}part of '{{name.snakeCase()}}_cubit.dart';{{/using_cubit}}

{{#using_freezed}}
@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  {{^pagination}}
  factory {{name.pascalCase()}}State.init() = _{{name.pascalCase()}}StateInit;
  factory {{name.pascalCase()}}State.loading() = _{{name.pascalCase()}}StateLoading;
  factory {{name.pascalCase()}}State.success(dynamic data) = _{{name.pascalCase()}}StateSuccess; // Change the data type as you require
  factory {{name.pascalCase()}}State.error({
    required AppFailure failure,
    int? code,
    String? message,
  }) = _{{name.pascalCase()}}StateError;
  {{/pagination}}

  {{#pagination}}
  const factory {{name.pascalCase()}}State({
    @Default(BaseStatus.initial) BaseStatus status,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(false) bool isLoadMore,
    @Default([]) List<dynamic> data, // Change the data type as you require
    @Default(null) int? statusCode,
    @Default("") String errorMessage,
    @Default(null) AppFailure? failure,
  }) = _{{name.pascalCase()}}State;
  {{/pagination}}
}
{{/using_freezed}}

{{#using_equatable}}
{{^pagination}}
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
{{/pagination}}
{{#pagination}}
class {{name.pascalCase()}}State extends Equatable {
  final BaseStatus status;
  final int page;
  final int limit;
  final bool isLoadMore;
  final List<dynamic> data;
  final int? statusCode;
  final String? message;
  final AppFailure? failure;

  const {{name.pascalCase()}}State({
    this.status = BaseStatus.initial,
    this.page = 1,
    this.limit = 10,
    this.isLoadMore = false,
    this.data = const [],
    this.statusCode,
    this.message,
    this.failure,
  });

  @override
  List<Object> get props => [
        status,
        page,
        limit,
        isLoadMore,
        data,
        [
          statusCode,
          message,
          failure,
        ],
      ];

  {{name.pascalCase()}}State copyWith({
    BaseStatus? status,
    int? page,
    int? limit,
    bool? isLoadMore,
    List<dynamic>? data,
    int? statusCode,
    String? message,
    AppFailure? failure,
  }) =>
      {{name.pascalCase()}}State(
        status: status ?? this.status,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        isLoadMore: isLoadMore ?? this.isLoadMore,
        data: data ?? this.data,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        failure: failure ?? this.failure,
      );
}
{{/pagination}}
{{/using_equatable}}