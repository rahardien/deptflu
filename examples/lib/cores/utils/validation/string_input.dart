import 'package:formz/formz.dart';

class StringInput extends FormzInput<String, String> {
  const StringInput.pure() : super.pure('');
  const StringInput.dirty([super.value = '']) : super.dirty();

  bool get isInvalidUserInput => !isPure && isNotValid;

  @override
  String? validator(String value) => value.isEmpty ? "Field is required" : null;
}
