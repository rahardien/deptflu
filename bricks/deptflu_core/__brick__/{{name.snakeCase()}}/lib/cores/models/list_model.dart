import 'package:equatable/equatable.dart';
import 'package:{{name.snakeCase()}}/cores/services/api/response_parser.dart';
import 'pagination.dart';

class ListModel<T> extends Equatable {
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

  @override
  List<Object?> get props => [list, pagination];
}
