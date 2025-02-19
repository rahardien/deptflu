import 'package:formz/formz.dart';

import '../form_validation_utils.dart';

class EmailInput extends FormzInput<String, String> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty([super.value = '']) : super.dirty();

  bool get isInvalidUserInput => !isPure && isNotValid;

  @override
  validator(value) {
    return FormValidationUtils.isValidEmail(value);
  }
}
