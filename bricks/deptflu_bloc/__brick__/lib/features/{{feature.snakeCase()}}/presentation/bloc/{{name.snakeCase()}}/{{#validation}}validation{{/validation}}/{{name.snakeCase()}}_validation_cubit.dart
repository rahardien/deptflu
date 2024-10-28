{{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}
{{#using_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/using_freezed}}
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../cores/utils/input_types/normal_string_input.dart';

part '{{name.snakeCase()}}_validation_state.dart';
{{#using_freezed}}part '{{name.snakeCase()}}_validation_cubit.freezed.dart';{{/using_freezed}}

class {{name.pascalCase()}}ValidationCubit extends Cubit<{{name.pascalCase()}}ValidationState> {
  {{name.pascalCase()}}ValidationCubit(): super(const {{name.pascalCase()}}ValidationState());

  void onNameChanged(String input) {
    final name = NormalStringInput.dirty(input);

    emit(
      state.copyWith(
        name: name,
      ),
    );

    validateForm();
  }

  void onAddressChanged(String input) {
    final address = NormalStringInput.dirty(input);

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