import 'package:formz/formz.dart';

import '../form_validation_utils.dart';

class NormalStringInput extends FormzInput<String, String> {
  const NormalStringInput.pure() : super.pure('');
  const NormalStringInput.dirty([super.value = '']) : super.dirty();

  bool get isInvalidUserInput => !isPure && isNotValid;

  @override
  String? validator(String value) => FormValidationUtils.isNotEmpty(value);
}
