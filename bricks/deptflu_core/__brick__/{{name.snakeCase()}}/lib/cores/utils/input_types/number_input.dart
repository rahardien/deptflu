import 'package:formz/formz.dart';

import '../form_validation_utils.dart';

class NumberInput extends FormzInput<String, String> {
  const NumberInput.pure() : super.pure('');
  const NumberInput.dirty([super.value = '']) : super.dirty();

  @override
  validator(value) {
    return FormValidationUtils.isNumeric(value);
  }
}
