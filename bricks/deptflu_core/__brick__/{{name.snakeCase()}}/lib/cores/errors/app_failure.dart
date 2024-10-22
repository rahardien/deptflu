{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}

abstract class AppFailure {{#using_equatable}} extends Equatable  {{/using_equatable}} { 
  final int? code;
  final dynamic messages;
  final Map<String, dynamic>? errors;
  const AppFailure({
    this.code,
    this.messages,
    this.errors,
  });

  {{#using_equatable}}
  @override
  List<Object?> get props => [code, messages, errors];
  {{/using_equatable}}
}

class ClientFailure extends AppFailure {
  const ClientFailure({
    super.code,
    String? super.messages,
    super.errors,
  });
}

class ServerFailure extends AppFailure {
  const ServerFailure() : super();
}

class UnknownFailure extends AppFailure{}

class OfflineFailure extends AppFailure{}

class RequestCancelledFailure extends AppFailure{}

class SessionFailure extends AppFailure{}

//
class MobileValidationFailure extends AppFailure {
  const MobileValidationFailure({
    super.errors,
  });
}
