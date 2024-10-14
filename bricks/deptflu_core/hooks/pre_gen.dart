import 'package:mason/mason.dart';

void run(HookContext context) {
  final immutable = context.vars['immutable'];
  final type = context.vars['type'];
  final validation = context.vars['validation'];
  final routing = context.vars['routing'];

  final isUsingEquatable = immutable == 'equatable';
  final isUsingFreezed = immutable == 'freezed';

  final isUsingBloc = type == 'bloc';
  final isUsingCubit = type == 'cubit';

  final isValidationNone = validation == 'none';
  final isValidationFormz = validation == 'formz';

  final isRoutingNone = routing == 'none';
  final isRoutingGoRouter = routing == 'go_router';

  context.vars['isUsingEquatable'] = isUsingEquatable;
  context.vars['isUsingFreezed'] = isUsingFreezed;

  context.vars['isUsingBloc'] = isUsingBloc;
  context.vars['isUsingCubit'] = isUsingCubit;
  context.vars['isUsingBlocOrCubit'] = isUsingBloc || isUsingCubit;

  context.vars['isValidationNone'] = isValidationNone;
  context.vars['isValidationFormz'] = isValidationFormz;

  context.vars['isRoutingNone'] = isRoutingNone;
  context.vars['isRoutingGoRouter'] = isRoutingGoRouter;
}
