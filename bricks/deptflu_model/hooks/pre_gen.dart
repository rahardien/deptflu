import 'package:mason/mason.dart';

void run(HookContext context) {
  final immutable = context.vars['immutable'];

  final isUsingEquatable = immutable == 'equatable';
  final isUsingFreezed = immutable == 'freezed';

  context.vars['isUsingEquatable'] = isUsingEquatable;
  context.vars['isUsingFreezed'] = isUsingFreezed;
}
