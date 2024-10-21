import 'package:equatable/equatable.dart';
import 'package:{{name.snakeCase()}}/cores/services/api/response_parser.dart';

class BaseResponse<T> extends Equatable {
  final int? statusCode;
  final String? message;
  final Map<String, dynamic>? errors;
  final T? data;

  const BaseResponse({
    this.data,
    this.statusCode,
    this.message,
    this.errors,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        statusCode: json['statusCode'],
        message: json['message'],
        errors: json['errors'],
        data: json['data'] == null
            ? null
            : ResponseParser<T>().fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [data, statusCode, message, errors];
}
