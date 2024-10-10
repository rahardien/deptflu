import 'package:mason/mason.dart';

void run(HookContext context) {
  final immutable = context.vars['immutable'];
  final type = context.vars['type'];
  final validation = context.vars['validation'];

  final isUsingEquatable = immutable == 'equatable';
  final isUsingFreezed = immutable == 'freezed';

  final isUsingBloc = type == 'bloc';
  final isUsingCubit = type == 'cubit';

  final isValidationNone = validation == 'none';
  final isValidationFormz = validation == 'formz';

  context.vars['isUsingEquatable'] = isUsingEquatable;
  context.vars['isUsingFreezed'] = isUsingFreezed;

  context.vars['isUsingBloc'] = isUsingBloc;
  context.vars['isUsingCubit'] = isUsingCubit;

  context.vars['isValidationNone'] = isValidationNone;
  context.vars['isValidationFormz'] = isValidationFormz;
}
