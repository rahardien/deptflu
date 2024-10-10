import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../cores/utils/validation/string_input.dart';

part 'account_validation_state.dart';
part 'account_validation_cubit.freezed.dart';

class AccountValidationCubit extends Cubit<AccountValidationState> {
  AccountValidationCubit() : super(const AccountValidationState());

  void onNameChanged(String input) {
    final name = StringInput.dirty(input);

    emit(
      state.copyWith(
        name: name,
      ),
    );

    validateForm();
  }

  void onAddressChanged(String input) {
    final address = StringInput.dirty(input);

    emit(
      state.copyWith(
        address: address,
      ),
    );

    validateForm();
  }

  void validateForm() {
    final isValid = Formz.validate([
      state.name,
      state.address,
    ]);

    emit(
      state.copyWith(
        isFormValid: isValid,
      ),
    );
  }
}
