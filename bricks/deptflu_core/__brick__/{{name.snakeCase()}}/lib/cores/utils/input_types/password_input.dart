import 'package:formz/formz.dart';

import '../form_validation_utils.dart';

class PasswordInput extends FormzInput<String, String> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  bool get isInvalidUserInput => !isPure && isNotValid;

  @override
  validator(value) {
    return FormValidationUtils.isValidPassword(value);
  }
}
