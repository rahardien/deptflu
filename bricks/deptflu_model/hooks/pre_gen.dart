import 'package:mason/mason.dart';

void run(HookContext context) {
  final immutable = context.vars['immutable'];

  final isUsingEquatable = immutable == 'equatable';
  final isUsingFreezed = immutable == 'freezed';

  context.vars['using_equatable'] = isUsingEquatable;
  context.vars['using_freezed'] = isUsingFreezed;
}
