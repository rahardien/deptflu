
part of 'language_cubit.dart';



@freezed
class LanguageState with _$LanguageState {
  factory LanguageState.init() = _LanguageStateInit;
  factory LanguageState.loading() = _LanguageStateLoading;
  factory LanguageState.success(dynamic data) = _LanguageStateSuccess; // Change the data type as you require
  factory LanguageState.error({
    required AppFailure failure,
    int? code,
    String? message,
  }) = _LanguageStateError;
}




