{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}

class MainEntity {{#using_equatable}} extends Equatable  {{/using_equatable}} {
  final String? id;

  const MainEntity({
    this.id,
  });

  {{#using_equatable}}
  @override
  List<Object?> get props => [
        id,
      ];
  {{/using_equatable}}
}


