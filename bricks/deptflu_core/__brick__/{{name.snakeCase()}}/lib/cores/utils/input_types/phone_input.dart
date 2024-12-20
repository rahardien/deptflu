import 'package:formz/formz.dart';

import '../form_validation_utils.dart';

class PhoneInput extends FormzInput<String, String> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([super.value = '']) : super.dirty();

  bool get isInvalidUserInput => !isPure && isNotValid;

  @override
  validator(value) {
    return FormValidationUtils.isValidPhone(value);
  }
}
