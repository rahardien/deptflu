import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseResponse<T> extends Equatable {
  @JsonKey(name: "status_code")
  final int? statusCode;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "errors")
  final Map<String, dynamic>? errors;
  @JsonKey(name: "data")
  final T? data;

  const BaseResponse({
    this.data,
    this.statusCode,
    this.message,
    this.errors,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [data, statusCode, message, errors];
}
