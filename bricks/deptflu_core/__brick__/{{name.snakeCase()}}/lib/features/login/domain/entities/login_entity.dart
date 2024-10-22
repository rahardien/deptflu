{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}

class LoginEntity {{#using_equatable}} extends Equatable  {{/using_equatable}} {
  final String? token;

  const LoginEntity({
    this.token,
  });

  {{#using_equatable}}
  @override
  List<Object?> get props => [token];
  {{/using_equatable}}
}
