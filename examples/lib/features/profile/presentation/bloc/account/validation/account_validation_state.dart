part of 'account_validation_cubit.dart';

@freezed
class AccountValidationState with _$AccountValidationState {
  const factory AccountValidationState({
    @Default(StringInput.pure()) StringInput name, // Change as you need
    @Default(StringInput.pure()) StringInput address, // Change as you need
    @Default(false) bool isFormValid,
  }) = _AccountValidationState;
}
