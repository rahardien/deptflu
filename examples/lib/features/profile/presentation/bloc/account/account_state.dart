
part of 'account_cubit.dart';



@freezed
class AccountState with _$AccountState {
  factory AccountState.init() = _AccountStateInit;
  factory AccountState.loading() = _AccountStateLoading;
  factory AccountState.success(dynamic data) = _AccountStateSuccess; // Change the data type as you require
  factory AccountState.error({
    required AppFailure failure,
    int? code,
    String? message,
  }) = _AccountStateError;
}




