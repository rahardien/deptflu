import 'package:formz/formz.dart';

import '../form_validation_utils.dart';

class PasswordConfirmationInput extends FormzInput<String, String> {
  final String password;

  const PasswordConfirmationInput.pure({this.password = ''}) : super.pure('');
  const PasswordConfirmationInput.dirty({
    required this.password,
    String value = '',
  }) : super.dirty(value);

  bool get isInvalidUserInput => !isPure && isNotValid;

  @override
  validator(value) {
    return FormValidationUtils.isMatch(password, value);
  }
}
