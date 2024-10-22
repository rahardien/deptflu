{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}
import 'package:{{name.snakeCase()}}/cores/services/api/response_parser.dart';
import 'pagination.dart';

class ListModel<T> {{#using_equatable}} extends Equatable  {{/using_equatable}} {
  final List<T>? list;
  final Pagination? pagination;

  const ListModel({
    this.list,
    this.pagination,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        list: json['list'] == null
            ? null
            : (json['list'] as List<dynamic>)
                .map((e) => ResponseParser<T>().fromJson(e))
                .toList(),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination']),
      );

  Map<String, dynamic> toJson() => {
        'list':
            list?.map((obj) => ResponseParser<T>().toJson(obj)).toList() ?? [],
        'pagination': pagination?.toJson(),
      };

  {{#using_equatable}}
  @override
  List<Object?> get props => [list, pagination];
  {{/using_equatable}}
}
