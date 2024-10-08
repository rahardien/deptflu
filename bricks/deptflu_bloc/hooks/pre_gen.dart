import 'package:mason/mason.dart';

void run(HookContext context) {
  final immutable = context.vars['immutable'];
  final type = context.vars['type'];

  final isUsingEquatable = immutable == 'equatable';
  final isUsingFreezed = immutable == 'freezed';
  final isUsingBloc = type == 'bloc';
  final isUsingCubit = type == 'cubit';

  context.vars['isUsingEquatable'] = isUsingEquatable;
  context.vars['isUsingFreezed'] = isUsingFreezed;
  context.vars['isUsingBloc'] = isUsingBloc;
  context.vars['isUsingCubit'] = isUsingCubit;
}
