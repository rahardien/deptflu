import 'package:formz/formz.dart';

import '../form_validation_utils.dart';

class TotalTransactionInput extends FormzInput<String, String> {
  final int minimumValue;

  const TotalTransactionInput.pure({this.minimumValue = 0}) : super.pure('');
  const TotalTransactionInput.dirty({
    required this.minimumValue,
    String value = '',
  }) : super.dirty(value);

  @override
  validator(value) {
    return FormValidationUtils.minimumValue(value, minimumValue);
  }
}
