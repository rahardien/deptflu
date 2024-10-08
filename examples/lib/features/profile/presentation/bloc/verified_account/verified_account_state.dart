part of 'verified_account_cubit.dart';

@freezed
class VerifiedAccountState with _$VerifiedAccountState {
  factory VerifiedAccountState.init() = _VerifiedAccountStateInit;
  factory VerifiedAccountState.loading() = _VerifiedAccountStateLoading;
  factory VerifiedAccountState.success(dynamic data) =
      _VerifiedAccountStateSuccess;
  factory VerifiedAccountState.error({
    required AppFailure failure,
    int? code,
    String? message,
  }) = _VerifiedAccountStateError;
}
