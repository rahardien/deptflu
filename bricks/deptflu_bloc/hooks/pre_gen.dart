import 'package:mason/mason.dart';

void run(HookContext context) {
  final immutable = context.vars['immutable'] as String;
  final type = context.vars['type'] as String;

  final isUsingEquatable = immutable == 'equatable';
  final isUsingFreezed = immutable == 'freezed';

  final isUsingBloc = type == 'bloc';
  final isUsingCubit = type == 'cubit';

  context.vars['using_equatable'] = isUsingEquatable;
  context.vars['using_freezed'] = isUsingFreezed;

  context.vars['using_bloc'] = isUsingBloc;
  context.vars['using_cubit'] = isUsingCubit;
}
