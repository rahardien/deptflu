import 'package:equatable/equatable.dart';
import 'list_model.dart';

class BaseListResponse<T> extends Equatable {
  final int? statusCode;
  final String? message;
  final Map<String, dynamic>? errors;
  final ListModel<T>? data;

  const BaseListResponse({
    this.statusCode,
    this.message,
    this.data,
    this.errors,
  });

  factory BaseListResponse.fromJson(Map<String, dynamic> json) =>
      BaseListResponse(
        statusCode: json['statusCode'],
        message: json['message'],
        errors: json['errors'],
        data: json['data'] == null ? null : ListModel<T>.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'message': message,
        'errors': errors,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [
        statusCode,
        message,
        data,
        errors,
      ];
}
