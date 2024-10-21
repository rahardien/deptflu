import 'app_failure.dart';

class ErrorObject {
  final int? code;
  final String? message;
  final AppFailure failure;

  ErrorObject({
    required this.code,
    required this.message,
    required this.failure,
  });
}
